--Main map functions

local river = {}

local function loadRiver(world)
    love.physics.setMeter(64) 
    world.physics = love.physics.newWorld(0, 9.81*64, true)
    world.map = loader.load(world.physics)

    local objects = world.map.pObjects
    for i=1, #objects do
        objects[i].pFixture = love.physics.newFixture(objects[i].pBody, objects[i].pShape, 2.0)
        objects[i].pBody:setFixedRotation(objects[i].pFixRotation)
        objects[i].pBody:setSleepingAllowed(false)
        if objects[i].canJump then
            objects[i].pFixture:setUserData("ground")
        elseif objects[i].name == "Player" then
            objects[i].pFixture:setUserData("player")
        end
    end
end
river.load = loadRiver

local function updateRiver(world, dt)

end
river.update = updateRiver

local function drawRiver(world)
    local objects = world.map.pObjects
    for i=1, #objects do
        love.graphics.setColor(unpack(objects[i].color))
        love.graphics.polygon("fill", objects[i].pBody:getWorldPoints(objects[i].pShape:getPoints()))
    end
end
river.draw = drawRiver

return river