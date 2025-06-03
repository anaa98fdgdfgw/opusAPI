-- SmartAgriculturalSystem.lua
-- Centralized agricultural management system for Opus OS

local UI      = require('opus.ui')
local Event   = require('opus.event')
local Util    = require('opus.util')
local GPS     = require('opus.gps')
local Point   = require('opus.point')

-- open all attached modems so the server can communicate
for _, side in ipairs(peripheral.getNames()) do
  if peripheral.getType(side) == 'modem' then
    pcall(rednet.open, side)
  end
end

--[[
This is a simplified example server implementing the architecture
outlined by the user. Many advanced features are placeholders and
would require additional code to be fully functional.
]]

-- Logger ---------------------------------------------------------------------
local Logger = {}
Logger.levels = { DEBUG = 1, INFO = 2, WARN = 3, ERROR = 4 }
Logger.logs = {}
Logger.currentLevel = Logger.levels.DEBUG

function Logger:log(level, msg)
  if self.levels[level] >= self.currentLevel then
    local entry = { os.clock(), level, msg }
    table.insert(self.logs, entry)
    print(string.format('[%s] %s', level, msg))
  end
end
function Logger:debug(msg) self:log('DEBUG', msg) end
function Logger:info(msg)  self:log('INFO', msg) end
function Logger:warn(msg)  self:log('WARN', msg) end
function Logger:error(msg) self:log('ERROR', msg) end

-- Communication layer --------------------------------------------------------
local Communication = {
  protocol = 'smart_agro',
  retries = 3,
}

local function waitForAck(id, token, timeout)
  local timer = os.startTimer(timeout or 2)
  while true do
    local e, p1, p2, p3 = os.pullEvent()
    if e == 'rednet_message' and p1 == id and type(p2) == 'table' and p2.ack == token then
      return true
    elseif e == 'timer' and p1 == timer then
      return false
    end
  end
end

function Communication.send(id, msg)
  local token = math.random(1, 1e9)
  msg.token = token
  for i = 1, Communication.retries do
    rednet.send(id, msg, Communication.protocol)
    if waitForAck(id, token, 2 ^ i) then
      return true
    end
  end
  return false
end

function Communication.broadcast(msg)
  rednet.broadcast(msg, Communication.protocol)
end

-- World mapping --------------------------------------------------------------
local WorldMap = {
  blocks = {}, -- key = "x,y,z" => block info
}

local function pack(x, y, z)
  return table.concat({x,y,z}, ',')
end

function WorldMap:update(scan, origin)
  for dx=-5,5 do
    for dy=-5,5 do
      for dz=-5,5 do
        local b = scan[dx] and scan[dx][dy] and scan[dx][dy][dz]
        if b then
          local x = origin.x + dx
          local y = origin.y + dy
          local z = origin.z + dz
          self.blocks[pack(x,y,z)] = b
        end
      end
    end
  end
end

function WorldMap:isBlocked(x,y,z)
  local b = self.blocks[pack(x,y,z)]
  return b and b.name ~= 'air'
end

-- Smart pathfinder -----------------------------------------------------------
local SmartPathfinder = {
  cache = {}, -- key => { path, time }
  ttl = 30,
}

local function heuristic(a,b)
  return math.abs(a.x-b.x) + math.abs(a.y-b.y) + math.abs(a.z-b.z)
end

local function neighbors(node)
  local pts = {}
  for i=0,5 do
    local d = Point.headings[i]
    table.insert(pts, { x = node.x + d.xd, y = node.y + d.yd, z = node.z + d.zd })
  end
  return pts
end

function SmartPathfinder:aStar(start, goal)
  local open = { start }
  local came = {}
  local g = { [pack(start.x,start.y,start.z)] = 0 }
  local f = { [pack(start.x,start.y,start.z)] = heuristic(start, goal) }

  while #open > 0 do
    table.sort(open, function(a,b)
      local ak = pack(a.x,a.y,a.z)
      local bk = pack(b.x,b.y,b.z)
      return (f[ak] or math.huge) < (f[bk] or math.huge)
    end)
    local current = table.remove(open, 1)
    if current.x==goal.x and current.y==goal.y and current.z==goal.z then
      local path = {current}
      local ck = pack(current.x,current.y,current.z)
      while came[ck] do
        current = came[ck]
        ck = pack(current.x,current.y,current.z)
        table.insert(path, 1, current)
      end
      return path
    end
    local ck = pack(current.x,current.y,current.z)
    for _,n in pairs(neighbors(current)) do
      if not WorldMap:isBlocked(n.x,n.y,n.z) then
        local nk = pack(n.x,n.y,n.z)
        local tentative = g[ck] + 1
        if tentative < (g[nk] or math.huge) then
          came[nk] = current
          g[nk] = tentative
          f[nk] = tentative + heuristic(n, goal)
          table.insert(open, n)
        end
      end
    end
  end
end

function SmartPathfinder:find(start, goal)
  local key = pack(start.x,start.y,start.z) .. '>' .. pack(goal.x,goal.y,goal.z)
  local c = self.cache[key]
  if c and os.clock() - c.time < self.ttl then
    return Util.shallowCopy(c.path)
  end
  local path = self:aStar(start, goal)
  if path then
    self.cache[key] = { path = path, time = os.clock() }
  end
  return path
end

-- Turtle controller ----------------------------------------------------------
local TurtleController = {
  turtles = {}, -- id => turtle data
}

function TurtleController:addTurtle(id)
  if not self.turtles[id] then
    self.turtles[id] = {
      id = id,
      state = 'IDLE',
    }
    Logger:info('Turtle ' .. id .. ' added')
  end
end

function TurtleController:update(id, data)
  self:addTurtle(id)
  Util.merge(self.turtles[id], data)
  local list = {}
  for tid in pairs(self.turtles) do
    table.insert(list, tid)
  end
  table.sort(list)
  mainPage.tabs.network.status.value = 'Turtles: ' .. table.concat(list, ', ')
  mainPage.tabs.network.status:draw()
end

function TurtleController:send(id, command, args)
  local msg = { type = 'cmd', cmd = command, args = args }
  Communication.send(id, msg)
end

-- Task manager ---------------------------------------------------------------
local TaskManager = {
  queues = {
    CRITICAL = {}, HIGH = {}, NORMAL = {}, LOW = {}
  },
  order = { 'CRITICAL', 'HIGH', 'NORMAL', 'LOW' }
}

function TaskManager:add(priority, task)
  table.insert(self.queues[priority], task)
end

function TaskManager:nextTask()
  for _,p in ipairs(self.order) do
    local q = self.queues[p]
    if #q > 0 then
      return table.remove(q, 1)
    end
  end
end

-- UI -------------------------------------------------------------------------
local mainPage = UI.Page {
  titleBar = UI.TitleBar { title = 'Smart Agricultural System' },
  tabs = UI.Tabs {
    x = 1, y = 2, ex = -1, ey = -1,
    network = UI.Tab {
      index = 1, title = 'Network',
      status = UI.Text { x = 2, y = 2, value = 'Waiting for turtles...' },
    },
    map = UI.Tab {
      index = 2, title = 'Map',
      info = UI.Text { x = 2, y = 2, value = 'Map view (todo)' },
    },
    tasks = UI.Tab {
      index = 3, title = 'Tasks',
      info = UI.Text { x = 2, y = 2, value = 'Task manager (todo)' },
    },
    control = UI.Tab {
      index = 4, title = 'Control',
      info = UI.Text { x = 2, y = 2, value = 'Manual control (todo)' },
    },
    logs = UI.Tab {
      index = 5, title = 'Logs',
      grid = UI.ScrollingGrid {
        x = 1, y = 2, ex = -1, ey = -1,
        columns = {
          { heading = 'Time', key = 't', width = 7 },
          { heading = 'Level', key = 'l', width = 6 },
          { heading = 'Message', key = 'm', width = 40 },
        },
        values = {},
      }
    }
  }
}

function mainPage.tabs.logs.grid:onEvent(event)
  if event.type == 'grid_focus' then return true end
end

UI:setPages({ main = mainPage })
UI:setPage(mainPage)

-- Event handlers -------------------------------------------------------------
Event.on({ 'rednet_message' }, function(id, msg, proto)
  if proto == Communication.protocol and type(msg) == 'table' then
    if msg.type == 'status' then
      TurtleController:update(id, msg.data)
    elseif msg.ack then
      -- ignore acks
    else
      -- acknowledge command
      rednet.send(id, { ack = msg.token }, Communication.protocol)
    end
  end
end)

Event.onInterval(2, function()
  local values = {}
  for _,entry in ipairs(Logger.logs) do
    table.insert(values, { t = string.format('%.1f', entry[1]), l = entry[2], m = entry[3] })
  end
  mainPage.tabs.logs.grid:setValues(values)
  mainPage.tabs.logs.grid:draw()
end)

-- Start the UI/event loop ----------------------------------------------------
UI:pullEvents()
