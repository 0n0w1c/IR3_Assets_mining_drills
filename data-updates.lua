if not (mods["IndustrialRevolution3Assets1"]
        and mods["IndustrialRevolution3Assets2"]
        and mods["IndustrialRevolution3Assets3"]
        and mods["IndustrialRevolution3Assets4"]
    ) then
    return
end

require("prototypes/explosion/burner-mining-drill")
require("prototypes/entity/burner-mining-drill")
require("prototypes/item/burner-mining-drill")

recipe = data.raw["recipe"]["burner-mining-drill"]
if mods["quality"] then
    local recycling = require("__quality__/prototypes/recycling")
    recycling.generate_recycling_recipe(recipe)
end

require("prototypes/explosion/electric-mining-drill")
require("prototypes/entity/electric-mining-drill")
require("prototypes/item/electric-mining-drill")
require("prototypes/technology/electric-mining-drill")

recipe = data.raw["recipe"]["electric-mining-drill"]
if mods["quality"] then
    local recycling = require("__quality__/prototypes/recycling")
    recycling.generate_recycling_recipe(recipe)
end

if mods["space-age"] then
    require("prototypes/explosion/big-mining-drill")
    require("prototypes/entity/big-mining-drill")
    require("prototypes/item/big-mining-drill")
    require("prototypes/technology/big-mining-drill")

    recipe = data.raw["recipe"]["big-mining-drill"]
    if mods["quality"] then
        local recycling = require("__quality__/prototypes/recycling")
        recycling.generate_recycling_recipe(recipe)
    end
else
    if mods["aai-industry"] and data.raw["mining-drill"]["area-mining-drill"] then
        require("prototypes/explosion/area-mining-drill")
        require("prototypes/entity/area-mining-drill")
        require("prototypes/item/area-mining-drill")
        require("prototypes/technology/area-mining-drill")

        recipe = data.raw["recipe"]["area-mining-drill"]
        if mods["quality"] then
            local recycling = require("__quality__/prototypes/recycling")
            recycling.generate_recycling_recipe(recipe)
        end
    end
end
