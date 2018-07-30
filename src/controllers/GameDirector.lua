--Models
local World = require "models.business.World"

--Util
local SpriteSheet = require "util.SpriteSheet"
local SpriteAnimation = require "util.SpriteAnimation"
local Stack = require "util.Stack"

--Controllers
local EnemiesController = require "controllers.EnemiesController"

--Gui Components
local ProgressBar = require "util.ui.ProgressBar"

local GameDirector = {}

GameDirector.__index = GameDirector

function GameDirector:configureSpriteSheet(jsonFile, directory, looping, duration, scaleX, scaleY)
    local newSprite = SpriteSheet:new(jsonFile, directory)
    local frameTable, frameStack = newSprite:getFrames()
    local newAnimation = SpriteAnimation:new(frameStack, newSprite:getAtlas(), duration)
    newAnimation:setType(looping)
    newAnimation:setScale(scaleX, scaleY)
    return newAnimation
end

function GameDirector:new()
    love.physics.setMeter(64)
    local world = World:new()
    this = {
        bulletsInWorld = {},
        world = world,
        enemiesController = EnemiesController:new(world),
        gameStatus = "run",
        --Libraries
        libraries = {Json = require "libs.Json", SpriteSheet = SpriteSheet, SpriteAnimation = SpriteAnimation, Stack = Stack}
    }
    
    return setmetatable(this, GameDirector)
end

function GameDirector:getLibraries(library)
    return self.libraries[library]
end

function GameDirector:keypressed(key, scancode, isrepeat)
end

function GameDirector:keyreleased(key, scancode)
end

function GameDirector:update(dt)
    self.world:update(dt)
    self.enemiesController:update(dt)
end

function GameDirector:draw()
    self.enemiesController:draw()
end

return GameDirector
