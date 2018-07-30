local ScoreBoard = {}

ScoreBoard.__index = ScoreBoard

function ScoreBoard:new(x, y, text)
    local this = {
        x =  x or 0, y = y or 0, score = 0, text = text or "Your Score: "
    }

    return setmetatable(this, ScoreBoard)
end

function ScoreBoard:changePosition(x, y)
    self.x, self.y = x, y
end

function ScoreBoard:change(by)
    self.score = self.score + by
end

function ScoreBoard:draw()
    love.graphics.print(self.text .. self.score, self.x, self.y)
end

return ScoreBoard