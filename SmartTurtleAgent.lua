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

local scanner = peripheral.find('geoScanner') or peripheral.find('plethora:scanner')

local function getPosition()
  local x,y,z = GPS.locate(2, false)
  if x then
    return { x = math.floor(x+0.5), y = math.floor(y+0.5), z = math.floor(z+0.5) }
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

local function sendStatus()
  local msg = { type = 'status', data = getStatus() }
  rednet.broadcast(msg, protocol)
end

local function doScan()
  if scanner and scanner.scan then
    local ok, data = pcall(scanner.scan, 5)
    if ok then
      rednet.broadcast({ type = 'scan', data = data }, protocol)
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

-- initial status
sendStatus()
Event.pullEvents()
