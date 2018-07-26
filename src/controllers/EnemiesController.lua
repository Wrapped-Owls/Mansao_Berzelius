local Enemy = require "models.actors.Enemy"

local EnemiesController = {}

EnemiesController.__index = EnemiesController

function EnemiesController:new(world)
    local this = {
        enemies = {},
        world = world.world,
        timeForShot = 1
    }
    
    return setmetatable(this, EnemiesController)
end

function EnemiesController:artificialInteligence(actor)
    
end

function EnemiesController:createEnemies()
    
end

function EnemiesController:update(dt)
    for index, enemy in pairs(self.enemies) do
        self:artificialInteligence(enemy)
        enemy:update(dt)
    end
end

function EnemiesController:draw()
    for index, enemy in pairs(self.enemies) do
        enemy:draw()
    end
end

return EnemiesController
