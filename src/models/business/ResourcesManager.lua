local ResourcesManager = {}

ResourcesManager.__index = ResourcesManager

function ResourcesManager:new()
    local this = {vitalForce = 10, leafs = 0, substrate = 0}

    return setmetatable(this, ResourcesManager)
end

return ResourcesManager
