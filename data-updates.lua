if not (mods["IndustrialRevolution3Assets1"]
        and mods["IndustrialRevolution3Assets2"]
        and mods["IndustrialRevolution3Assets3"]
        and mods["IndustrialRevolution3Assets4"]
    ) then
    return
end

require("prototypes/entity/burner-mining-drill")
require("prototypes/item/burner-mining-drill")

require("prototypes/entity/electric-mining-drill")
require("prototypes/item/electric-mining-drill")
require("prototypes/technology/electric-mining-drill")

if mods["space-age"] then
    require("prototypes/entity/big-mining-drill")
    require("prototypes/item/big-mining-drill")
    require("prototypes/technology/big-mining-drill")
end
