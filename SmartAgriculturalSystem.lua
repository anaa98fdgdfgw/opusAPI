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
      lastSeen = os.clock(),
    }
    Logger:info('Turtle ' .. id .. ' added')
  end
end

function TurtleController:update(id, data)
  self:addTurtle(id)
  local t = self.turtles[id]
  if t.position and data.position then
    local dx = data.position.x - t.position.x
    local dz = data.position.z - t.position.z
    if math.abs(dx) + math.abs(dz) == 1 then
      if dx == 1 then t.facing = 'east'
      elseif dx == -1 then t.facing = 'west'
      elseif dz == 1 then t.facing = 'south'
      elseif dz == -1 then t.facing = 'north' end
    end
  end
  Util.merge(t, data)
  t.lastSeen = os.clock()
  local list = {}
  for tid in pairs(self.turtles) do
    table.insert(list, tid)
  end
  table.sort(list)
  if mainPage.tabs and mainPage.tabs.network then
    local values = {}
    for _,tid in ipairs(list) do
      local t = self.turtles[tid]
      table.insert(values, {
        id = tid,
        fuel = t.fuel,
        state = t.state,
        last = string.format('%.1f', os.clock() - t.lastSeen)
      })
    end
    mainPage.tabs.network.grid:setValues(values)
    mainPage.tabs.network.grid:draw()
  end
end

function TurtleController:prune(timeout)
  for id,t in pairs(self.turtles) do
    if os.clock() - (t.lastSeen or 0) > timeout then
      Logger:warn('Turtle ' .. id .. ' timed out')
      self.turtles[id] = nil
    end
  end
end

function TurtleController:send(id, command, args)
  local t = self.turtles[id]
  if not t then
    return false
  end
  local msg = { type = 'cmd', cmd = command, args = args }
  if Communication.send(id, msg) then
    t.state = 'BUSY'
    return true
  end
  return false
end

function TurtleController:moveTo(id, goal)
  local t = self.turtles[id]
  if not t or not t.position then
    return false
  end
  local path = SmartPathfinder:find(t.position, goal)
  if not path then
    Logger:warn('No path for turtle ' .. id)
    return false
  end
  for i = 2, #path do
    local prev = path[i - 1]
    local cur  = path[i]
    local dx = cur.x - prev.x
    local dy = cur.y - prev.y
    local dz = cur.z - prev.z
    if dy ~= 0 then
      local dir = dy > 0 and 'up' or 'down'
      if not self:send(id, 'move', { dir }) then return false end
    else
      local targetFacing
      if dx == 1 then targetFacing = 'east'
      elseif dx == -1 then targetFacing = 'west'
      elseif dz == 1 then targetFacing = 'south'
      elseif dz == -1 then targetFacing = 'north' end
      if targetFacing then
        while t.facing and t.facing ~= targetFacing do
          self:send(id, 'move', { 'turnRight' })
          -- assume turn right updates facing clockwise
          local order = { east='south', south='west', west='north', north='east' }
          t.facing = order[t.facing]
        end
        if not t.facing then t.facing = targetFacing end
        if not self:send(id, 'move', { 'forward' }) then return false end
        -- update predicted position
        t.position = { x = cur.x, y = cur.y, z = cur.z }
      end
    end
  end
  return true
end

-- Task manager ---------------------------------------------------------------
local TaskManager = {
  queues = {
    CRITICAL = {}, HIGH = {}, NORMAL = {}, LOW = {}
  },
  order = { 'CRITICAL', 'HIGH', 'NORMAL', 'LOW' }
}

function TaskManager:add(priority, task)
  task.id = math.random(1, 1e9)
  task.priority = priority
  table.insert(self.queues[priority], task)
  Logger:info('Task '..task.id..' queued ('..priority..')')
end

function TaskManager:assign()
  for _,p in ipairs(self.order) do
    local q = self.queues[p]
    for i = #q,1,-1 do
      local task = q[i]
      if not task.turtle then
        local bestId, bestScore
        for id,t in pairs(TurtleController.turtles) do
          if t.state == 'IDLE' and t.position then
            local score = task.dest and Point.distance(t.position, task.dest) or 0
            if not bestScore or score < bestScore then
              bestScore = score
              bestId = id
            end
          end
        end
        if bestId then
          task.turtle = bestId
          table.remove(q, i)
          Logger:info('Assign task '..task.id..' to turtle '..bestId)
          TaskManager:execute(task)
        end
      end
    end
  end
end

function TaskManager:execute(task)
  if task.cmd == 'moveTo' and task.dest then
    TurtleController:moveTo(task.turtle, task.dest)
  elseif task.cmd == 'scan' then
    TurtleController:send(task.turtle, 'scan')
  end
end

-- UI -------------------------------------------------------------------------
local mainPage = UI.Page {
  titleBar = UI.TitleBar { title = 'Smart Agricultural System' },
  tabs = UI.Tabs {
    x = 1, y = 2, ex = -1, ey = -1,
    network = UI.Tab {
      index = 1, title = 'Network',
      grid = UI.ScrollingGrid {
        x = 1, y = 2, ex = -1, ey = -1,
        columns = {
          { heading = 'ID', key = 'id', width = 6 },
          { heading = 'Fuel', key = 'fuel', width = 6 },
          { heading = 'State', key = 'state', width = 8 },
          { heading = 'Last', key = 'last', width = 6 },
        },
        values = {},
      },
    },
    map = UI.Tab {
      index = 2, title = 'Map',
      info = UI.Text { x = 2, y = 2, value = 'Map view (todo)' },
    },
    tasks = UI.Tab {
      index = 3, title = 'Tasks',
      grid = UI.ScrollingGrid {
        x = 1, y = 2, ex = -1, ey = -1,
        columns = {
          { heading = 'ID', key = 'id', width = 8 },
          { heading = 'Cmd', key = 'cmd', width = 8 },
          { heading = 'Turtle', key = 'turtle', width = 7 },
          { heading = 'State', key = 'state', width = 8 },
        },
        values = {},
      },
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
    elseif msg.type == 'scan' and msg.origin and msg.data then
      WorldMap:update(msg.data, msg.origin)
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
  if mainPage.tabs and mainPage.tabs.logs then
    mainPage.tabs.logs.grid:setValues(values)
    mainPage.tabs.logs.grid:draw()
  end
  TaskManager:assign()
  TurtleController:prune(10)
  if mainPage.tabs and mainPage.tabs.tasks then
    local tv = {}
    for _,p in ipairs(TaskManager.order) do
      for _,task in ipairs(TaskManager.queues[p]) do
        table.insert(tv, { id = task.id, cmd = task.cmd, turtle = task.turtle or '-', state = 'queued' })
      end
    end
    mainPage.tabs.tasks.grid:setValues(tv)
    mainPage.tabs.tasks.grid:draw()
  end
end)

-- Start the UI/event loop ----------------------------------------------------
UI:pullEvents()
