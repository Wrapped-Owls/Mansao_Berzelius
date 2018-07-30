local Button = require "util/ui/Button"

local ButtonManager = {}

ButtonManager.__index = ButtonManager

function ButtonManager:new()
    local this = {
        buttons = {},
        options = {}
    }

    return setmetatable(this, ButtonManager)
end

function ButtonManager:addButton(buttonName, x, y, width, height, image, originalImage, animation)
    local newButton = Button:new(buttonName, x, y, width, height, image, originalImage, animation)
    table.insert(self.buttons, newButton)
    table.insert(self.options, buttonName)
    return newButton
end

function ButtonManager:mousemoved(x, y, dx, dy, istouch)
    for index, button in pairs(self.buttons) do
        button:mousemoved(x, y, dx, dy, istouch)
    end
end

function ButtonManager:mousepressed(x, y, button)
    for index, guiButton in pairs(self.buttons) do
        guiButton:mousepressed(x, y, button)
    end
end

function ButtonManager:mousereleased(x, y, button)
    for index, guiButton in pairs(self.buttons) do
        guiButton:mousereleased(x, y, button)
    end
end

function ButtonManager:update(dt)
    for index, button in pairs(self.buttons) do
        button:update(dt)
    end
end

function ButtonManager:draw()
    for index, button in pairs(self.buttons) do
        button:draw()
    end
end

return ButtonManager
