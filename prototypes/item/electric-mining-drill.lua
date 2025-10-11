local item_sounds = require("__base__/prototypes/item_sounds")

data:extend({
    {
        type = "item",
        name = "electric-mining-drill",
        icon = "__IndustrialRevolution3Assets1__/graphics/icons/64/electric-mining-drill.png",
        subgroup = "extraction-machine",
        order = "a[items]-b[electric-mining-drill]",
        inventory_move_sound = item_sounds.drill_inventory_move,
        pick_sound = item_sounds.drill_inventory_pickup,
        drop_sound = item_sounds.drill_inventory_move,
        place_result = "electric-mining-drill",
        stack_size = 50
    }
})
