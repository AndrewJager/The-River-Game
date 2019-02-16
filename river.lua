--Main map functions

local river = {}
local utils = require "utils"
local playerGen = require "player"

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
end
river.load = loadRiver

local function updateRiver(world, dt)
    boatGod.pBody:setLinearVelocity(world.boatSpeed,0.0)
    rockerL.pBody:setLinearVelocity(world.boatSpeed,0.0)
    rockerR.pBody:setLinearVelocity(world.boatSpeed, 0)
    deckBack.pBody:applyForce(0, 1000)

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
    love.graphics.setColor(255,255,255)

    
    love.graphics.translate(world.player.pBody:getX() - 450, 0)
    love.graphics.print(world.helpText, 25, 610)
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


return river