--Big Fish references added: 0

local world = {}
world.map = {}
world.keys = {}

loader = require "mapLoader"
river = require "river"

function love.load()
    love.window.setTitle("The River")
    love.window.setMode(900, 650)
    river.load(world)
end

function love.update(dt)
    world.keys = getInput()
    river.update(world, dt)
end

function love.draw()
    river.draw(world)
end

function getInput()
    local keys = {}
    keys.right = love.keyboard.isDown("right")
	keys.left = love.keyboard.isDown("left")
	keys.up = love.keyboard.isDown("up")
    keys.down = love.keyboard.isDown("down")
    keys.a = love.keyboard.isDown("a")
    keys.d = love.keyboard.isDown("d")
    keys.z = love.keyboard.isDown("z")
    keys.x = love.keyboard.isDown("x")
    keys.c = love.keyboard.isDown("c")
    keys.h = love.keyboard.isDown("h")

    return keys
end