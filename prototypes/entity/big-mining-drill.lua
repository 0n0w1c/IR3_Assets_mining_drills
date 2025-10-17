local DC           = require("__IR3_Assets_mining_drills__/prototypes/lib/drill_common")

local footprint    = settings.startup["IR3-big-drill-footprint"]
    and settings.startup["IR3-big-drill-footprint"].value or "5x5"
local is7          = (footprint == "7x7")

local BASE_SCALE   = 0.5
local SPRITE_SCALE = is7 and BASE_SCALE or (BASE_SCALE * (5 / 7))
local SHIFT_FACTOR = is7 and 1 or (5 / 7)

local function scale_drill_graphics(gs)
    return DC.scale_drill_graphics(gs, SPRITE_SCALE, SHIFT_FACTOR)
end

local extent                          = is7 and 7 or 5
local half_extent                     = extent / 2
local connection_shift                = half_extent - 0.5
local selection_box                   = { { -half_extent, -half_extent }, { half_extent, half_extent } }
local collision_box                   = { { -(half_extent - 0.1), -(half_extent - 0.1) }, { (half_extent - 0.1), (half_extent - 0.1) } }
local vector_to_place                 = { 0, -(half_extent + 0.35) }

local entity                          = data.raw["mining-drill"]["big-mining-drill"]

entity.icon                           = "__IndustrialRevolution3Assets1__/graphics/icons/64/chrome-drill.png"

entity.collision_box                  = collision_box
entity.selection_box                  = selection_box
entity.drawing_box_vertical_extension = 1
entity.integration_patch              = nil

entity.circuit_connector              = circuit_connector_definitions.create_vector(universal_connector_template,
    DC.connector_vectors_for(extent))

entity.input_fluid_box                = {
    volume = 200,
    production_type = "input",
    pipe_connections = {
        { position = { -connection_shift, 0 }, direction = defines.direction.west },
        { position = { connection_shift, 0 },  direction = defines.direction.east },
        { position = { 0, connection_shift },  direction = defines.direction.south },
    },
    pipe_covers = PIPE_COVERS
}

entity.graphics_set                   = scale_drill_graphics({
    status_colors = STATUS_COLORS,

    working_visualisations = {
        {
            always_draw = true,
            animation = {
                filename =
                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-rail.png",
                priority = "high",
                width = 512,
                height = 512,
                frame_count = 1,
                line_length = 1,
                repeat_count = 118,
                animation_speed = 0.5,
                scale = 0.5,
                shift = { 0, 0 },
            },
            render_layer = "lower-object-above-shadow",
        },
        {
            always_draw = true,
            render_layer = "object",

            north_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-north-shadow.png",
                        priority = "high",
                        width = 512,
                        height = 512,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-north.png",
                        priority = "high",
                        width = 512,
                        height = 512,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-shadow.png",
                        priority = "high",
                        width = 544,
                        height = 288,
                        frame_count = 60,
                        line_length = 6,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 1.25, 0.25 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-base.png",
                        priority = "high",
                        width = 320,
                        height = 384,
                        frame_count = 60,
                        line_length = 10,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, -0.5 },
                    },
                }
            },
            east_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-east-shadow.png",
                        priority = "high",
                        width = 512,
                        height = 512,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-east.png",
                        priority = "high",
                        width = 512,
                        height = 512,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-shadow.png",
                        priority = "high",
                        width = 544,
                        height = 288,
                        frame_count = 60,
                        line_length = 6,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 1.25, 0.25 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-base.png",
                        priority = "high",
                        width = 320,
                        height = 384,
                        frame_count = 60,
                        line_length = 10,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, -0.5 },
                    },
                }
            },
            south_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-south-shadow.png",
                        priority = "high",
                        width = 512,
                        height = 512,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-south.png",
                        priority = "high",
                        width = 512,
                        height = 512,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-shadow.png",
                        priority = "high",
                        width = 544,
                        height = 288,
                        frame_count = 60,
                        line_length = 6,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 1.25, 0.25 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-base.png",
                        priority = "high",
                        width = 320,
                        height = 384,
                        frame_count = 60,
                        line_length = 10,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, -0.5 },
                    },
                }
            },
            west_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-west-shadow.png",
                        priority = "high",
                        width = 512,
                        height = 512,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-west.png",
                        priority = "high",
                        width = 512,
                        height = 512,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-shadow.png",
                        priority = "high",
                        width = 544,
                        height = 288,
                        frame_count = 60,
                        line_length = 6,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 1.25, 0.25 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-base.png",
                        priority = "high",
                        width = 320,
                        height = 384,
                        frame_count = 60,
                        line_length = 10,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, -0.5 },
                    },
                }
            },
        },
        {
            align_to_waypoint = false,
            always_draw = true,
            name = "drill-animation",
            animation = {
                filename =
                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-working.png",
                priority = "high",
                width = 256,
                height = 224,
                frame_count = 118,
                line_length = 10,
                animation_speed = 0.5,
                scale = 0.5,
                shift = { 0, -0.25 },
                blend_mode = "additive-soft",
                draw_as_glow = true,
            },
            apply_tint = "status",
        },
    },
})

entity.wet_mining_graphics_set        = scale_drill_graphics({
    status_colors = {
        disabled             = { r = 1, g = 0.25, b = 0.25, a = 1 },
        full_output          = { r = 1, g = 0.625, b = 0.25, a = 1 },
        idle                 = { r = 0.25, g = 0.625, b = 1, a = 1 },
        insufficient_input   = { r = 1, g = 0.625, b = 0.25, a = 1 },
        low_power            = { r = 1, g = 0.25, b = 0.25, a = 1 },
        no_minable_resources = { r = 0.25, g = 0.625, b = 1, a = 1 },
        no_power             = { 0, 0, 0, 0 },
        working              = { r = 0.25, g = 1, b = 0.25, a = 1 },
    },

    working_visualisations = {
        {
            always_draw = true,
            animation = {
                filename =
                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-rail.png",
                priority = "high",
                width = 512,
                height = 512,
                frame_count = 1,
                line_length = 1,
                repeat_count = 118,
                animation_speed = 0.5,
                scale = 0.5,
                shift = { 0, 0 },
            },
            render_layer = "lower-object-above-shadow",
        },
        {
            always_draw = true,
            render_layer = "object",

            east_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-east-shadow.png",
                        priority = "high",
                        width = 512,
                        height = 512,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-east.png",
                        priority = "high",
                        width = 512,
                        height = 512,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-shadow.png",
                        priority = "high",
                        width = 544,
                        height = 288,
                        frame_count = 60,
                        line_length = 6,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 1.25, 0.25 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-base.png",
                        priority = "high",
                        width = 320,
                        height = 384,
                        frame_count = 60,
                        line_length = 10,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, -0.5 },
                    },
                }
            },
            north_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-north-shadow.png",
                        priority = "high",
                        width = 512,
                        height = 512,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-north.png",
                        priority = "high",
                        width = 512,
                        height = 512,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-shadow.png",
                        priority = "high",
                        width = 544,
                        height = 288,
                        frame_count = 60,
                        line_length = 6,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 1.25, 0.25 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-base.png",
                        priority = "high",
                        width = 320,
                        height = 384,
                        frame_count = 60,
                        line_length = 10,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, -0.5 },
                    },
                }
            },
            south_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-south-shadow.png",
                        priority = "high",
                        width = 512,
                        height = 512,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-south.png",
                        priority = "high",
                        width = 512,
                        height = 512,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-shadow.png",
                        priority = "high",
                        width = 544,
                        height = 288,
                        frame_count = 60,
                        line_length = 6,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 1.25, 0.25 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-base.png",
                        priority = "high",
                        width = 320,
                        height = 384,
                        frame_count = 60,
                        line_length = 10,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, -0.5 },
                    },
                }
            },
            west_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-west-shadow.png",
                        priority = "high",
                        width = 512,
                        height = 512,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-underlay-west.png",
                        priority = "high",
                        width = 512,
                        height = 512,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 0 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-shadow.png",
                        priority = "high",
                        width = 544,
                        height = 288,
                        frame_count = 60,
                        line_length = 6,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 1.25, 0.25 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-base.png",
                        priority = "high",
                        width = 320,
                        height = 384,
                        frame_count = 60,
                        line_length = 10,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, -0.5 },
                    },
                }
            },
        },
        {
            align_to_waypoint = false,
            always_draw = true,
            name = "drill-animation",
            animation = {
                filename =
                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-working.png",
                priority = "high",
                width = 256,
                height = 224,
                frame_count = 118,
                line_length = 10,
                animation_speed = 0.5,
                scale = 0.5,
                shift = { 0, -0.25 },
                blend_mode = "additive-soft",
                draw_as_glow = true,
            },
            apply_tint = "status",
        },
        {
            always_draw = true,
            secondary_draw_order = -50,

            east_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-patch-east-shadow.png",
                        priority = "high",
                        width = 544,
                        height = 512,
                        repeat_count = 118,
                        scale = 0.5,
                        shift = { 0.25, 0 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-connector-north.png",
                        priority = "high",
                        width = 128,
                        height = 192,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, -2.5 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-connector-south.png",
                        priority = "high",
                        width = 128,
                        height = 192,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 2.5 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-connector-west.png",
                        priority = "high",
                        width = 192,
                        height = 128,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { -2.5, 0 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-pipes-nw.png",
                        priority = "high",
                        width = 256,
                        height = 256,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { -2, -2 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-pipes-sw.png",
                        priority = "high",
                        width = 256,
                        height = 256,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { -2, 2 },
                    },
                }
            },

            north_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-patch-north-shadow.png",
                        priority = "high",
                        width = 544,
                        height = 512,
                        repeat_count = 118,
                        scale = 0.5,
                        shift = { 0.25, 0 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-connector-south.png",
                        priority = "high",
                        width = 128,
                        height = 192,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 2.5 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-connector-east.png",
                        priority = "high",
                        width = 192,
                        height = 128,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 2.5, 0 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-connector-west.png",
                        priority = "high",
                        width = 192,
                        height = 128,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { -2.5, 0 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-pipes-se.png",
                        priority = "high",
                        width = 256,
                        height = 256,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 2, 2 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-pipes-sw.png",
                        priority = "high",
                        width = 256,
                        height = 256,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { -2, 2 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-pipes-shadow-se.png",
                        priority = "high",
                        width = 64,
                        height = 192,
                        frame_count = 60,
                        line_length = 10,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 3, 1.5 },
                    },
                }
            },

            south_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-patch-south-shadow.png",
                        priority = "high",
                        width = 544,
                        height = 512,
                        repeat_count = 118,
                        scale = 0.5,
                        shift = { 0.25, 0 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-connector-north.png",
                        priority = "high",
                        width = 128,
                        height = 192,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, -2.5 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-connector-east.png",
                        priority = "high",
                        width = 192,
                        height = 128,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 2.5, 0 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-connector-west.png",
                        priority = "high",
                        width = 192,
                        height = 128,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { -2.5, 0 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-pipes-ne.png",
                        priority = "high",
                        width = 256,
                        height = 256,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 2, -2 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-pipes-nw.png",
                        priority = "high",
                        width = 256,
                        height = 256,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { -2, -2 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-pipes-shadow-ne.png",
                        priority = "high",
                        width = 64,
                        height = 192,
                        frame_count = 60,
                        line_length = 10,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 3, -1.5 },
                    },
                }
            },

            west_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-patch-west-shadow.png",
                        priority = "high",
                        width = 544,
                        height = 512,
                        repeat_count = 118,
                        scale = 0.5,
                        shift = { 0.25, 0 },
                        draw_as_shadow = true,
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-connector-north.png",
                        priority = "high",
                        width = 128,
                        height = 192,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, -2.5 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-connector-south.png",
                        priority = "high",
                        width = 128,
                        height = 192,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, 2.5 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-connector-east.png",
                        priority = "high",
                        width = 192,
                        height = 128,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 2.5, 0 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-pipes-ne.png",
                        priority = "high",
                        width = 256,
                        height = 256,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 2, -2 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-pipes-se.png",
                        priority = "high",
                        width = 256,
                        height = 256,
                        repeat_count = 118,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 2, 2 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-pipes-shadow-ne.png",
                        priority = "high",
                        width = 64,
                        height = 192,
                        frame_count = 60,
                        line_length = 10,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 3, -1.5 },
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/chrome-drill-pipes-shadow-se.png",
                        priority = "high",
                        width = 64,
                        height = 192,
                        frame_count = 60,
                        line_length = 10,
                        run_mode = "forward-then-backward",
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 3, 1.5 },
                    },
                }
            },
        },
        {
            always_draw = true,
            apply_tint = "input-fluid-base-color",

            east_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-n.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 0, -3 },
                        blend_mode = "additive-soft",
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-s.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 0, 3 },
                        blend_mode = "additive-soft",
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-w.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { -3, 0 },
                        blend_mode = "additive-soft",
                    },
                }
            },

            north_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-e.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 3, 0 },
                        blend_mode = "additive-soft",
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-s.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 0, 3 },
                        blend_mode = "additive-soft",
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-w.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { -3, 0 },
                        blend_mode = "additive-soft",
                    },
                }
            },

            south_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-n.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 0, -3 },
                        blend_mode = "additive-soft",
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-e.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 3, 0 },
                        blend_mode = "additive-soft",
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-w.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { -3, 0 },
                        blend_mode = "additive-soft",
                    },
                }
            },

            west_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-n.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 0, -3 },
                        blend_mode = "additive-soft",
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-e.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 3, 0 },
                        blend_mode = "additive-soft",
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-s.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 0, 3 },
                        blend_mode = "additive-soft",
                    },
                }
            },
        },

        {
            always_draw = true,
            apply_tint = "input-fluid-flow-color",

            east_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-n.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 0, -3 },
                        blend_mode = "additive",
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-s.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 0, 3 },
                        blend_mode = "additive",
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-w.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { -3, 0 },
                        blend_mode = "additive",
                    },
                }
            },

            north_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-e.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 3, 0 },
                        blend_mode = "additive",
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-s.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 0, 3 },
                        blend_mode = "additive",
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-w.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { -3, 0 },
                        blend_mode = "additive",
                    },
                }
            },

            south_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-n.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 0, -3 },
                        blend_mode = "additive",
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-e.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 3, 0 },
                        blend_mode = "additive",
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-w.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { -3, 0 },
                        blend_mode = "additive",
                    },
                }
            },

            west_animation = {
                layers = {
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-n.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 0, -3 },
                        blend_mode = "additive",
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-e.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 3, 0 },
                        blend_mode = "additive",
                    },
                    {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-s.png",
                        priority = "high",
                        width = 128,
                        height = 128,
                        scale = 0.5,
                        shift = { 0, 3 },
                        blend_mode = "additive",
                    },
                }
            },
        },
    },
})

entity.vector_to_place_result         = vector_to_place

entity.working_sound                  = {
    fade_in_ticks = 10,
    fade_out_ticks = 30,
    sound = { filename = "__IndustrialRevolution3Assets1__/sound/heavy-drill.ogg", volume = 1 }
}
