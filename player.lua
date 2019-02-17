--Player functions

local player = {}

local function loadPlayer(world)
    local player = {} --Create player
    player.pBody = love.physics.newBody(world.physics, 50, 350, "dynamic")
    player.pBody:setFixedRotation(true)
    player.shape = love.physics.newCircleShape(20)
    player.fixture = love.physics.newFixture(player.pBody, player.shape, 1) 
    player.fixture:setUserData("player")
    player.fixture:setFriction(2.0)
    player.dead = false
    player.tool = ""
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
        world.helpText = "Press Z and C to rotate light. X to turn light on/off. Press A and D to drive boat"
        if world.keys.x == false then
            world.cReleased = true
        end
        if world.keys.x then
            if world.cReleased then
                if world.lampOn then
                    world.lampOn = false
                else
                    world.lampOn = true
                    world.lampAngle = world.platformB.pBody:getX()
                end
            end
            world.cReleased = false
        end
        if world.keys.a then
            world.boatSpeed = -75
            world.lampAngle = 0
            world.lampOn = false
        elseif world.keys.d then
            world.boatSpeed = 75
            world.lampAngle = 0
            world.lampOn = false
        else
            world.boatSpeed = 0
        end
        if world.keys.z then
            world.lampAngle = world.lampAngle - 15
        elseif world.keys.c then
            world.lampAngle = world.lampAngle + 15
        end
    elseif zones.onBelow >= 1 then
        world.helpText = "choose tool"
    elseif zones.onDock >= 1 then
        world.helpText = "Arrow keys to move and jump"
    else
        world.helpText = ""
        world.boatSpeed = 0
    end

    if world.keys.h then
        world.message = ""
    end
end
player.updatePlayer = updatePlayer

return player