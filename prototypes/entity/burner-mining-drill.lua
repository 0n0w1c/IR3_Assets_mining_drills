local DC           = require("__IR3_Assets_mining_drills__/prototypes/lib/drill_common")

local footprint    = settings.startup["IR3-burner-drill-footprint"]
    and settings.startup["IR3-burner-drill-footprint"].value or "2x2"
local is5          = (footprint == "5x5")

local BASE_SCALE   = 0.5
local SPRITE_SCALE = is5 and BASE_SCALE or (BASE_SCALE * (2 / 5))
local SHIFT_FACTOR = is5 and 1 or (2 / 5)

local function scale_drill_graphics(gs)
    return DC.scale_drill_graphics(gs, SPRITE_SCALE, SHIFT_FACTOR)
end

local extent                    = is5 and 5 or 2
local half_extent               = extent / 2
local selection_box             = { { -half_extent, -half_extent }, { half_extent, half_extent } }
local collision_box             = { { -(half_extent - 0.1), -(half_extent - 0.1) }, { (half_extent - 0.1), (half_extent - 0.1) } }

local vector_to_place           = { -0.5, -(half_extent + 0.35) }
local resource_searching_radius = is5 and 2.49 or 1
local smoke_shift               = is5 and -1.65 or -0.8

if is5 then
    vector_to_place = { 0, -(half_extent + 0.35) }
end

local entity                          = data.raw["mining-drill"]["burner-mining-drill"]

entity.icon                           = "__IndustrialRevolution3Assets1__/graphics/icons/64/burner-mining-drill.png"
entity.collision_box                  = collision_box
entity.selection_box                  = selection_box
entity.drawing_box_vertical_extension = 1
entity.integration_patch              = nil

entity.circuit_connector              = circuit_connector_definitions.create_vector(universal_connector_template,
    DC.connector_vectors_for(extent))

entity.energy_source.light_flicker    = {
    color = { r = 0, g = 0, b = 0, a = 0 }
}
entity.energy_source.smoke            = {
    {
        name           = "smoke",
        frequency      = 3,
        deviation      = { 0.1, 0.1 },
        north_position = { 0, smoke_shift },
        east_position  = { 0, smoke_shift },
        south_position = { 0, smoke_shift },
        west_position  = { 0, smoke_shift }
    }
}

entity.graphics_set                   = scale_drill_graphics({
    working_visualisations = {
        {
            always_draw = true,
            animation = {
                filename =
                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/copper-drill-underlay-rail.png",
                priority = "high",
                width = 384,
                height = 384,
                frame_count = 1,
                line_length = 1,
                repeat_count = 120,
                animation_speed = 0.5,
                scale = 0.5,
                shift = { 0, 0 }
            },
            render_layer = "lower-object-above-shadow"
        },

        {
            always_draw = true,
            render_layer = "object",

            north_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-underlay-north-shadow.png",
                        priority = "high",
                        width = 384,
                        height = 384,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                        draw_as_shadow = true
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/copper-drill-underlay-north.png",
                        priority = "high",
                        width = 384,
                        height = 384,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 }
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/copper-drill-shadow.png",
                        priority = "high",
                        width = 320,
                        height = 192,
                        frame_count = 60,
                        line_length = 6,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 1, 0.25 },
                        draw_as_shadow = true
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/copper-drill-base.png",
                        priority = "high",
                        width = 192,
                        height = 256,
                        frame_count = 60,
                        line_length = 10,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, -0.25 }
                    }
                }
            },

            east_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-underlay-east-shadow.png",
                        priority = "high",
                        width = 384,
                        height = 384,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                        draw_as_shadow = true
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/copper-drill-underlay-east.png",
                        priority = "high",
                        width = 384,
                        height = 384,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 }
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/copper-drill-shadow.png",
                        priority = "high",
                        width = 320,
                        height = 192,
                        frame_count = 60,
                        line_length = 6,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 1, 0.25 },
                        draw_as_shadow = true
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/copper-drill-base.png",
                        priority = "high",
                        width = 192,
                        height = 256,
                        frame_count = 60,
                        line_length = 10,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, -0.25 }
                    }
                }
            },

            south_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-underlay-south-shadow.png",
                        priority = "high",
                        width = 384,
                        height = 384,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                        draw_as_shadow = true
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/copper-drill-underlay-south.png",
                        priority = "high",
                        width = 384,
                        height = 384,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 }
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/copper-drill-shadow.png",
                        priority = "high",
                        width = 320,
                        height = 192,
                        frame_count = 60,
                        line_length = 6,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 1, 0.25 },
                        draw_as_shadow = true
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/copper-drill-base.png",
                        priority = "high",
                        width = 192,
                        height = 256,
                        frame_count = 60,
                        line_length = 10,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, -0.25 }
                    }
                }
            },

            west_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-underlay-west-shadow.png",
                        priority = "high",
                        width = 384,
                        height = 384,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                        draw_as_shadow = true
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/copper-drill-underlay-west.png",
                        priority = "high",
                        width = 384,
                        height = 384,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 }
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/copper-drill-shadow.png",
                        priority = "high",
                        width = 320,
                        height = 192,
                        frame_count = 60,
                        line_length = 6,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 1, 0.25 },
                        draw_as_shadow = true
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/copper-drill-base.png",
                        priority = "high",
                        width = 192,
                        height = 256,
                        frame_count = 60,
                        line_length = 10,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, -0.25 }
                    }
                }
            }
        },

        {
            align_to_waypoint = false,
            animation = {
                filename =
                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/copper-drill-working.png",
                priority = "high",
                width = 64,
                height = 128,
                frame_count = 60,
                line_length = 20,
                run_mode = "forward-then-backward",
                animation_speed = 0.5,
                scale = 0.5,
                shift = { 0, -1.25 },
                blend_mode = "additive",
                draw_as_glow = true
            },
            fadeout = true
        }
    }
})

entity.resource_searching_radius      = resource_searching_radius
entity.vector_to_place_result         = vector_to_place
