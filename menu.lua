local menu = {}

local uare = require "Libraries/uare"

local header = nil 

local function menuCreate(world)
btnStartStyle = uare.newStyle({

    width = 400,
    height = 60,
    
    --color
    color = {0.313, 0.298, 0.380},
    hoverColor = {0.313, 0.298, 0.380},
    holdColor = {0.066, 0.047, 0.152},
    
    --border
    border = {
    color = {0.125, 0.031, 0.211},
    hoverColor = {0.0, 0.0, 0.0},
    holdColor = {0.031, 0.349, 0.090},
    size = 5
    },
    
    --text
    text = {
    color = {0.9, 0.9, 0.9},
    hoverColor = {0.9, 0.9, 0.9},
    holdColor = {0.9, 0, 0},
    font = world.btnFont,
    align = "center",
    offset = {
        x = 0,
        y = -25
    }
    },

})

myButton1 = uare.new({
    
    text = {
    display = "Start"
    },
    x = 250,
    y = 500,
    onClick = function() 
        world.level = "river"
        uare.clear()
    end
    
}):style(btnStartStyle)

header = love.graphics.newImage("images/header.png")

end
menu.load = menuCreate

local function menuUpdate(dt)
    uare.update(dt, love.mouse.getX(), love.mouse.getY())
end
menu.update = menuUpdate

local function menuDraw()
    love.graphics.push()
    love.graphics.scale(0.41,0.41)
    love.graphics.setColor(0.5,0.5,0.5,1)
    love.graphics.draw(header, 0 ,0)
    love.graphics.pop()
    uare.draw()
end
menu.draw = menuDraw

return menu