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

require("prototypes/explosion/electric-mining-drill")
require("prototypes/entity/electric-mining-drill")
require("prototypes/item/electric-mining-drill")
require("prototypes/technology/electric-mining-drill")

if mods["IR3_Assets_resources"] and data.raw["resource"]["natural-gas-fissure"] then
    require("prototypes/explosion/steel-derrick")
    require("prototypes/entity/steel-derrick")
    require("prototypes/item/steel-derrick")
    require("prototypes/recipe/steel-derrick")
    require("prototypes/technology/oil-gathering")
end

if mods["space-age"] then
    require("prototypes/explosion/big-mining-drill")
    require("prototypes/entity/big-mining-drill")
    require("prototypes/item/big-mining-drill")
    require("prototypes/technology/big-mining-drill")
else
    if mods["aai-industry"] and data.raw["mining-drill"]["area-mining-drill"] then
        require("prototypes/explosion/area-mining-drill")
        require("prototypes/entity/area-mining-drill")
        require("prototypes/item/area-mining-drill")
        require("prototypes/technology/area-mining-drill")
    end
end
