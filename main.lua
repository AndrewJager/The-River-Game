--Big Fish references added: 0

local world = {}
world.map = {}

loader = require "mapLoader"
river = require "river"

function love.load()
    love.window.setTitle("The River")
    river.load(world)
end

function love.update(dt)
    river.update(world, dt)
end

function love.draw()
    river.draw(world)
end