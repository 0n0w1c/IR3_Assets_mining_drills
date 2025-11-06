data:extend({
    {
        name = "steel-derrick",
        type = "recipe",
        energy_required = 5,
        ingredients = {
            { type = "item", name = "steel-plate",        amount = 5, },
            { type = "item", name = "iron-gear-wheel",    amount = 10, },
            { type = "item", name = "electronic-circuit", amount = 5, },
            { type = "item", name = "pipe",               amount = 10, }
        },
        results = { { type = "item", name = "steel-derrick", amount = 1, } },
        enabled = false,
    }
})

recipe = data.raw["recipe"]["steel-derrick"]
local recycling = {}
if mods["quality"] then
    recycling = require("__quality__/prototypes/recycling")
    recycling.generate_recycling_recipe(recipe)
end
