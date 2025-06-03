-- SmartTurtleAgent.lua
-- Turtle-side agent for the Smart Agricultural System on Opus OS

local Event = require('opus.event')
local Util  = require('opus.util')
local GPS   = require('opus.gps')

-- open all modems
for _,side in ipairs(peripheral.getNames()) do
  if peripheral.getType(side) == 'modem' then
    pcall(rednet.open, side)
  end
end

local protocol = 'smart_agro'
local state = 'IDLE'
local serverId

local scanner = peripheral.find('geoScanner') or peripheral.find('plethora:scanner')

local function getPosition()
  local pos = GPS.getPoint(2, false)
  if pos then
    return { x = pos.x, y = pos.y, z = pos.z }
  end
end

local function getInventory()
  local inv = {}
  for i = 1, 16 do
    local item = turtle.getItemDetail(i)
    if item then
      inv[i] = { name = item.name, count = item.count }
    end
  end
  return inv
end

local function getStatus()
  return {
    position  = getPosition(),
    fuel      = turtle.getFuelLevel(),
    inventory = getInventory(),
    state     = state,
  }
end

local function registerWithServer()
  state = 'REGISTER'
  local token = math.random(1, 1e9)
  local msg = { type = 'register', token = token, data = getStatus() }
  for attempt = 1, 3 do
    rednet.broadcast(msg, protocol)
    local timer = os.startTimer(2 ^ attempt)
    while true do
      local e, p1, p2, p3 = os.pullEvent()
      if e == 'rednet_message' and p3 == protocol and type(p2) == 'table' and p2.ack == token then
        serverId = p1
        state = 'IDLE'
        return true
      elseif e == 'timer' and p1 == timer then
        break
      end
    end
  end
  state = 'IDLE'
  return false
end

local function sendStatus()
  local msg = { type = 'status', data = getStatus() }
  rednet.broadcast(msg, protocol)
end

local function doScan()
  if scanner and scanner.scan then
    local ok, data = pcall(scanner.scan, 5)
    if ok then
      local pos = getPosition()
      rednet.broadcast({ type = 'scan', origin = pos, data = data }, protocol)
    end
  end
end

-- Basic command implementations
local commands = {}

commands.move = function(dir, steps)
  steps = steps or 1
  local m = {
    forward   = turtle.forward,
    back      = turtle.back,
    up        = turtle.up,
    down      = turtle.down,
    turnLeft  = turtle.turnLeft,
    turnRight = turtle.turnRight,
  }
  local fn = m[dir]
  if not fn then return false, 'invalid direction' end
  for i = 1, steps do
    if not fn() then
      return false
    end
  end
  return true
end

commands.dig = function(dir)
  local m = { forward = turtle.dig, up = turtle.digUp, down = turtle.digDown }
  local fn = m[dir or 'forward']
  return fn and fn()
end

commands.place = function(dir)
  local m = { forward = turtle.place, up = turtle.placeUp, down = turtle.placeDown }
  local fn = m[dir or 'forward']
  return fn and fn()
end

commands.suck = function(dir)
  local m = { forward = turtle.suck, up = turtle.suckUp, down = turtle.suckDown }
  local fn = m[dir or 'forward']
  return fn and fn()
end

commands.drop = function(dir)
  local m = { forward = turtle.drop, up = turtle.dropUp, down = turtle.dropDown }
  local fn = m[dir or 'forward']
  return fn and fn()
end

commands.scan = function()
  doScan()
  return true
end

local function handleCommand(id, msg)
  state = string.upper(msg.cmd or 'IDLE')
  local fn = commands[msg.cmd]
  local ok, res = false, nil
  if fn then
    ok, res = pcall(fn, table.unpack(msg.args or {}))
  else
    res = 'unknown command'
  end
  rednet.send(id, { ack = msg.token, ok = ok, result = res }, protocol)
  state = 'IDLE'
  sendStatus()
end

Event.onInterval(5, sendStatus)

Event.on({ 'rednet_message' }, function(id, msg, proto)
  if proto == protocol and type(msg) == 'table' and msg.type == 'cmd' then
    handleCommand(id, msg)
  end
end)

-- register with the server and send initial status
registerWithServer()
sendStatus()
Event.pullEvents()
