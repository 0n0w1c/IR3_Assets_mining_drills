if not (mods["IndustrialRevolution3Assets1"]
        and mods["IndustrialRevolution3Assets2"]
        and mods["IndustrialRevolution3Assets3"]
        and mods["IndustrialRevolution3Assets4"]
    ) then
    return
end

if settings.startup["IR3-steel-derrick"].value then
    require("prototypes/explosion/steel-derrick")
    require("prototypes/entity/steel-derrick")
    require("prototypes/item/steel-derrick")
    require("prototypes/recipe/steel-derrick")
    require("prototypes/technology/oil-gathering")
end
