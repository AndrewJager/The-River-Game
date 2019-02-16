--Player functions

local player = {}

local function loadPlayer(world)
    local player = {} --Create player
    player.pBody = love.physics.newBody(world.physics, 400, 350, "dynamic")
    player.pBody:setFixedRotation(true)
    player.shape = love.physics.newCircleShape(20)
    player.fixture = love.physics.newFixture(player.pBody, player.shape, 1) 
    player.fixture:setUserData("player")
    player.fixture:setFriction(2.0)
    return player
end
player.loadPlayer = loadPlayer

local function updatePlayer(world, dt, zones)
    local player = world.player
    local x, y = player.pBody:getLinearVelocity()
    local speed = 150
    if world.keys.right then
        player.pBody:setLinearVelocity(speed, y)
    elseif world.keys.left then
        player.pBody:setLinearVelocity(-speed, y)
    end
    if zones.footing >= 1 then
        if world.keys.up then
            player.pBody:applyForce(0, -3000)
        end
    end

    --actions
    if zones.inLight >= 1 then
        world.helpText = "Press Z and X to rotate light. Press A and D to drive boat"
        if world.keys.a then
            world.boatSpeed = -25
        elseif world.keys.d then
            world.boatSpeed = 25
        else
            world.boatSpeed = 0
        end
    elseif zones.onBelow >= 1 then
        world.helpText = "choose tool"
    else
        world.helpText = ""
        world.boatSpeed = 0
    end
end
player.updatePlayer = updatePlayer

return player