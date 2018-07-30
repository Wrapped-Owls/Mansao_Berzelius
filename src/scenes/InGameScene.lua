local InGameScene = {}

InGameScene.__index = InGameScene

function InGameScene:new()
    local this = {
        mansion = gameDirector:getLibraries("SpriteSheet"):new("mansao.json", "assets/sprites/"),
        fishies = {}, scoreBoard = require "scenes.subscenes.ScoreBoard":new(0, 0)
    }
    local position = scaleDimension:directScale(800, 600)
    this.scoreBoard:changePosition(position * 10, position * 10)
    scaleDimension:calculeScales("MansionBackground", 4096, 4096, 0, 0, {width = 4096, height = 4096})
    return setmetatable(this, InGameScene)
end

function InGameScene:mousepressed(x, y, button)
    local fishSprite = gameDirector:getLibraries("SpriteSheet"):new("fish.json", "assets/sprites/")
    table.insert(self.fishies, {sprite = fishSprite, x = x, y = y})
    self.scoreBoard:change(1)
end

function InGameScene:update(dt)
end

function InGameScene:draw()
    local scales = scaleDimension:getScale("MansionBackground")
    love.graphics.draw(self.mansion:getAtlas(), scales.x, scales.y, 0, scales.scaleX, scales.scaleY)

    for key, value in pairs(self.fishies) do
        love.graphics.draw(value.sprite:getAtlas(), value.x, value.y)
    end

    self.scoreBoard:draw()

end

return InGameScene