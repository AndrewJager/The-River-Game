--Main map functions

local river = {}
local utils = require "utils"
local playerGen = require "player"
local worldCopy = {} --Hacky, but I don't care

local boatGod = nil
local deck = nil
local deckBack = nil
local prow = nil
local platform = nil
local platformB = nil
local rockerL = nil
local rockerR = nil
local prowZone = nil
local backZone = nil
local lightZone = nil
local belowZone = nil
local lamp = nil
local lampTarget = nil

local zones = {}
zones.footing = 0
zones.inLight = 0
zones.onProw = 0
zones.onBack = 0
zones.onBelow = 0

local function loadRiver(world)
    love.physics.setMeter(64) 
    world.physics = love.physics.newWorld(0, 9.81*64, true)
    world.physics:setCallbacks(beginCallback, endCallback)
    world.map = loader.load(world.physics)
    world.helpText = ""
    world.boatSpeed = 0

    world.player = playerGen.loadPlayer(world)
    worldCopy = world
    local objects = world.map.pObjects
    for i=1, #objects do
        objects[i].pFixture = love.physics.newFixture(objects[i].pBody, objects[i].pShape, 2.0)
        objects[i].pBody:setFixedRotation(objects[i].pFixRotation)
        objects[i].pBody:setSleepingAllowed(false)
        objects[i].pFixture:setUserData(objects[i].data)
        if objects[i].isSensor then
            objects[i].pFixture:setSensor(true)
        end
    end

    boatGod = utils.getByName("boatGod", objects)
    deck = utils.getByName("Deck", objects)
    deck.pBody:setAngularDamping(10.0)
    deck.pBody:setLinearDamping(10.0)
    deck.pFixture:setDensity(15)
    deckBack = utils.getByName("DeckBack", objects)
    prow = utils.getByName("Prow", objects)
    platform = utils.getByName("Platform", objects)
    platformB = utils.getByName("Platform2", objects)
    rockerL = utils.getByName("rockerL", objects)
    rockerR = utils.getByName("rockerR", objects)
    prowZone = utils.getByName("prowZone", objects)
    backZone = utils.getByName("backZone", objects)
    lightZone = utils.getByName("lightZone", objects)
    belowZone = utils.getByName("belowZone", objects)

    lamp = {}
    lamp.pBody = love.physics.newBody(world.physics, platformB.pBody:getX(), platformB.pBody:getY() - 15, "kinematic")
    lamp.pBody:setFixedRotation(true)
    lamp.color = {(0.4),(0),(0), (0.4)}
    lamp.pShape = love.physics.newRectangleShape(0,0, 20, 20)
    lamp.pFixture = love.physics.newFixture(lamp.pBody, lamp.pShape, 2.1)
    lamp.pBody:setMass(0.0)
    lamp.pFixture:setSensor(true)
    table.insert(world.map.pObjects, lamp)
    world.lamp = lamp
    lampTarget = {}
    lampTarget.pBody = love.physics.newBody(world.physics, platformB.pBody:getX(), platformB.pBody:getY() + 450, "dynamic")
    lampTarget.color = {(0.4),(0),(0), (0.4)}
    lampTarget.pShape = love.physics.newRectangleShape(0,0, 20, 20)
    lampTarget.pFixture = love.physics.newFixture(lampTarget.pBody, lampTarget.pShape, 2.1)
    lampTarget.pBody:setMass(0.0)
    lampTarget.pFixture:setSensor(true)
    table.insert(world.map.pObjects, lampTarget)

    local rope = love.physics.newRopeJoint(boatGod.pBody, deck.pBody, boatGod.pBody:getX(), boatGod.pBody:getY(), deck.pBody:getX(), deck.pBody:getY(), 350)
    local rope2 = love.physics.newRopeJoint(rockerL.pBody, deck.pBody, rockerL.pBody:getX(), rockerL.pBody:getY(), rockerL.pBody:getX(), deck.pBody:getY(), 350)
    local rope3 = love.physics.newRopeJoint(rockerR.pBody, deck.pBody, rockerR.pBody:getX(), rockerR.pBody:getY(), rockerR.pBody:getX(), deck.pBody:getY(), 350)
    local weld = love.physics.newWeldJoint(deck.pBody, deckBack.pBody, deck.pBody:getX(), deck.pBody:getY())
    local weld2 = love.physics.newWeldJoint(deck.pBody, prow.pBody, deck.pBody:getX(), deck.pBody:getY())
    local weld3 = love.physics.newWeldJoint(deck.pBody, platform.pBody, deck.pBody:getX(), deck.pBody:getY())
    local weld4 = love.physics.newWeldJoint(deck.pBody, platformB.pBody, deck.pBody:getX(), deck.pBody:getY())
    local weld5 = love.physics.newWeldJoint(deck.pBody, prowZone.pBody, deck.pBody:getX(), deck.pBody:getY())
    local weld6 = love.physics.newWeldJoint(deck.pBody, backZone.pBody, deck.pBody:getX(), deck.pBody:getY())
    local weld7 = love.physics.newWeldJoint(deck.pBody, lightZone.pBody, deck.pBody:getX(), deck.pBody:getY())
    local weld8 = love.physics.newWeldJoint(deck.pBody, belowZone.pBody, deck.pBody:getX(), deck.pBody:getY())
    local weld9 = love.physics.newRevoluteJoint(deck.pBody, lamp.pBody, lamp.pBody:getX(), lamp.pBody:getY())
    local weld10 = love.physics.newWeldJoint(lamp.pBody, lampTarget.pBody, lamp.pBody:getX(), lamp.pBody:getY())
end
river.load = loadRiver

local function updateRiver(world, dt)
    boatGod.pBody:setLinearVelocity(world.boatSpeed,0.0)
    rockerL.pBody:setLinearVelocity(world.boatSpeed,0.0)
    rockerR.pBody:setLinearVelocity(world.boatSpeed, 0)

    playerGen.updatePlayer(world, dt, zones)

    world.physics:update(dt)
end
river.update = updateRiver

local function drawRiver(world)
    love.graphics.translate(-world.player.pBody:getX() + 450, 0)
    love.graphics.setColor(0.76, 0.18, 0.05)
    love.graphics.circle("fill", world.player.pBody:getX(), world.player.pBody:getY(), world.player.shape:getRadius())

    local objects = world.map.pObjects
    for i=1, #objects do
        love.graphics.setColor(unpack(objects[i].color))
        love.graphics.polygon("fill", objects[i].pBody:getWorldPoints(objects[i].pShape:getPoints()))
    end
    love.graphics.setColor(0.074, 0.247, 0.141)
    love.graphics.stencil(lightStencil, "replace", 1)
    love.graphics.setStencilTest("equal", 0)
    love.graphics.rectangle("fill", 0, 400, 2000, 400)
    love.graphics.setStencilTest()

    love.graphics.translate(world.player.pBody:getX() - 450, 0)
    love.graphics.setColor(1,1,1)
    love.graphics.print(world.helpText.."  "..math.deg(world.lamp.pBody:getAngle()), 25, 610)
end
river.draw = drawRiver

function beginCallback(a, b, col)
    if a:getUserData() == "player" or b:getUserData() == "player" then
        if a:getUserData() == "boat" or b:getUserData() == "boat" then
            zones.footing = zones.footing + 1
        elseif a:getUserData() == "prowZone" or b:getUserData() == "prowZone" then
            zones.onProw = zones.onProw + 1
        elseif a:getUserData() == "backZone" or b:getUserData() == "backZone" then
            zones.onBack = zones.onBack + 1
        elseif a:getUserData() == "lightZone" or b:getUserData() == "lightZone" then
            zones.inLight = zones.inLight + 1
        elseif a:getUserData() == "belowZone" or b:getUserData() == "belowZone" then
            zones.onBelow = zones.onBelow + 1
        end
    end
end

function endCallback(a, b, col)
    if a:getUserData() == "player" or b:getUserData() == "player" then
        if a:getUserData() == "boat" or b:getUserData() == "boat" then
            zones.footing = zones.footing - 1
        elseif a:getUserData() == "prowZone" or b:getUserData() == "prowZone" then
            zones.onProw = zones.onProw - 1
        elseif a:getUserData() == "backZone" or b:getUserData() == "backZone" then
            zones.onBack = zones.onBack - 1
        elseif a:getUserData() == "belowZone" or b:getUserData() == "belowZone" then
            zones.onBelow = zones.onBelow - 1
        elseif a:getUserData() == "lightZone" or b:getUserData() == "lightZone" then
            zones.inLight = zones.inLight - 1
        end
    end
end

function lightStencil()
    local lightPos = platformB.pBody
    local targetPos = lampTarget.pBody
    x = lampTarget.pBody:getX()
    y = lampTarget.pBody:getY()
    love.graphics.polygon('fill', lightPos:getX(), lightPos:getY(), x - 150, y, x + 150, y)
end

return river