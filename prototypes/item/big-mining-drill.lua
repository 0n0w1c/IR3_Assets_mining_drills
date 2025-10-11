local item_sounds = require("__base__/prototypes/item_sounds")

data:extend({
    {
        type = "item",
        name = "big-mining-drill",
        icon = "__IndustrialRevolution3Assets1__/graphics/icons/64/chrome-drill.png",
        subgroup = "extraction-machine",
        order = "a[items]-c[big-mining-drill]",
        inventory_move_sound = item_sounds.drill_inventory_move,
        pick_sound = item_sounds.drill_inventory_pickup,
        drop_sound = item_sounds.drill_inventory_move,
        place_result = "big-mining-drill",
        stack_size = 20,
        default_import_location = "vulcanus",
        weight = 50 * kg
    }
})
