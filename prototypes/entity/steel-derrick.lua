require("__IR3_Assets_mining_drills__/prototypes/lib/drill_common")

local entity                  = table.deepcopy(data.raw["mining-drill"]["pumpjack"])

entity.name                   = "steel-derrick"
entity.icon                   = "__IndustrialRevolution3Assets1__/graphics/icons/64/steel-derrick.png"
entity.resource_categories    = { "gas" }
entity.minable                = { mining_time = 0.5, result = "steel-derrick" }
entity.base_picture           = nil
entity.fast_replaceable_group = "derricks"
entity.corpse                 = "medium-remnants"
entity.dying_explosion        = "steel-derrick-explosion"
entity.vector_to_place_result = { 0, 0 }

entity.circuit_connector      = circuit_connector_definitions.create_vector(universal_connector_template,
    {
        { variation = 27, main_offset = util.by_pixel(-22.625, -21.875), shadow_offset = util.by_pixel(-22.625, -21.875), show_shadow = true },
        { variation = 27, main_offset = util.by_pixel(-22.625, -21.875), shadow_offset = util.by_pixel(-22.625, -21.875), show_shadow = true },
        { variation = 27, main_offset = util.by_pixel(-22.625, -21.875), shadow_offset = util.by_pixel(-22.625, -21.875), show_shadow = true },
        { variation = 27, main_offset = util.by_pixel(-22.625, -21.875), shadow_offset = util.by_pixel(-22.625, -21.875), show_shadow = true },
    }
)

entity.damaged_trigger_effect = {
    {
        damage_type_filters = {
            "fire",
            "impact"
        },
        frame_speed = 1,
        frame_speed_deviation = 0.1,
        initial_height = 0.5,
        initial_vertical_speed = 0.07,
        initial_vertical_speed_deviation = 0.1,
        offset_deviation = {
            { -0.5, -0.5 },
            { 0.5,  0.5 }
        },
        particle_name = "iron-particle",
        probability = 0.14472270902820961,
        repeat_count = 1,
        speed_from_center = 0.02,
        speed_from_center_deviation = 0.01,
        type = "create-particle"
    },
    {
        damage_type_filters = {
            "fire",
            "impact"
        },
        frame_speed = 1,
        frame_speed_deviation = 0.1,
        initial_height = 0.5,
        initial_vertical_speed = 0.07,
        initial_vertical_speed_deviation = 0.1,
        offset_deviation = {
            { -0.5, -0.5 },
            { 0.5,  0.5 }
        },
        particle_name = "steel-particle",
        probability = 0.8176833060093843,
        repeat_count = 1,
        speed_from_center = 0.02,
        speed_from_center_deviation = 0.01,
        type = "create-particle"
    }
}

entity.graphics_set           = {
    animation = {
        east = {
            layers = {
                {
                    animation_speed = 0.75,
                    draw_as_glow = false,
                    draw_as_light = false,
                    draw_as_shadow = true,
                    filename =
                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/derrick-base-shadow.png",
                    frame_count = 1,
                    height = 256,
                    line_length = 1,
                    priority = "high",
                    repeat_count = 118,
                    scale = 0.5,
                    shift = { 1.5, 0.5 },
                    width = 384,
                    x = 384,
                    y = 0
                },
                {
                    animation_speed = 0.75,
                    draw_as_glow = false,
                    draw_as_light = false,
                    draw_as_shadow = true,
                    filename =
                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/derrick-working-shadow.png",
                    frame_count = 60,
                    height = 128,
                    line_length = 6,
                    priority = "high",
                    run_mode = "forward-then-backward",
                    scale = 0.5,
                    shift = { 1.5, 0.5 },
                    width = 256,
                    x = 0,
                    y = 0
                },
                {
                    animation_speed = 0.75,
                    draw_as_glow = false,
                    draw_as_light = false,
                    draw_as_shadow = false,
                    filename =
                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/steel-derrick-base.png",
                    frame_count = 1,
                    height = 320,
                    line_length = 1,
                    priority = "high",
                    repeat_count = 118,
                    scale = 0.5,
                    shift = { 0, 0 },
                    width = 192,
                    x = 192,
                    y = 0
                },
                {
                    animation_speed = 0.75,
                    draw_as_glow = false,
                    draw_as_light = false,
                    draw_as_shadow = false,
                    filename =
                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/steel-derrick-working.png",
                    frame_count = 60,
                    height = 256,
                    line_length = 10,
                    priority = "high",
                    run_mode = "forward-then-backward",
                    scale = 0.5,
                    shift = { 0.5, -0.5 },
                    width = 128,
                    x = 0,
                    y = 0
                }
            }
        },
        north = {
            layers = {
                {
                    animation_speed = 0.75,
                    draw_as_glow = false,
                    draw_as_light = false,
                    draw_as_shadow = true,
                    filename =
                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/derrick-base-shadow.png",
                    frame_count = 1,
                    height = 256,
                    line_length = 1,
                    priority = "high",
                    repeat_count = 118,
                    scale = 0.5,
                    shift = { 1.5, 0.5 },
                    width = 384,
                    x = 0,
                    y = 0
                },
                {
                    animation_speed = 0.75,
                    draw_as_glow = false,
                    draw_as_light = false,
                    draw_as_shadow = true,
                    filename =
                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/derrick-working-shadow.png",
                    frame_count = 60,
                    height = 128,
                    line_length = 6,
                    priority = "high",
                    run_mode = "forward-then-backward",
                    scale = 0.5,
                    shift = { 1.5, 0.5 },
                    width = 256,
                    x = 0,
                    y = 0
                },
                {
                    animation_speed = 0.75,
                    draw_as_glow = false,
                    draw_as_light = false,
                    draw_as_shadow = false,
                    filename =
                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/steel-derrick-base.png",
                    frame_count = 1,
                    height = 320,
                    line_length = 1,
                    priority = "high",
                    repeat_count = 118,
                    scale = 0.5,
                    shift = { 0, 0 },
                    width = 192,
                    x = 0,
                    y = 0
                },
                {
                    animation_speed = 0.75,
                    draw_as_glow = false,
                    draw_as_light = false,
                    draw_as_shadow = false,
                    filename =
                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/steel-derrick-working.png",
                    frame_count = 60,
                    height = 256,
                    line_length = 10,
                    priority = "high",
                    run_mode = "forward-then-backward",
                    scale = 0.5,
                    shift = { 0.5, -0.5 },
                    width = 128,
                    x = 0,
                    y = 0
                }
            }
        },
        south = {
            layers = {
                {
                    animation_speed = 0.75,
                    draw_as_glow = false,
                    draw_as_light = false,
                    draw_as_shadow = true,
                    filename =
                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/derrick-base-shadow.png",
                    frame_count = 1,
                    height = 256,
                    line_length = 1,
                    priority = "high",
                    repeat_count = 118,
                    scale = 0.5,
                    shift = { 1.5, 0.5 },
                    width = 384,
                    x = 768,
                    y = 0
                },
                {
                    animation_speed = 0.75,
                    draw_as_glow = false,
                    draw_as_light = false,
                    draw_as_shadow = true,
                    filename =
                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/derrick-working-shadow.png",
                    frame_count = 60,
                    height = 128,
                    line_length = 6,
                    priority = "high",
                    run_mode = "forward-then-backward",
                    scale = 0.5,
                    shift = { 1.5, 0.5 },
                    width = 256,
                    x = 0,
                    y = 0
                },
                {
                    animation_speed = 0.75,
                    draw_as_glow = false,
                    draw_as_light = false,
                    draw_as_shadow = false,
                    filename =
                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/steel-derrick-base.png",
                    frame_count = 1,
                    height = 320,
                    line_length = 1,
                    priority = "high",
                    repeat_count = 118,
                    scale = 0.5,
                    shift = { 0, 0 },
                    width = 192,
                    x = 384,
                    y = 0
                },
                {
                    animation_speed = 0.75,
                    draw_as_glow = false,
                    draw_as_light = false,
                    draw_as_shadow = false,
                    filename =
                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/steel-derrick-working.png",
                    frame_count = 60,
                    height = 256,
                    line_length = 10,
                    priority = "high",
                    run_mode = "forward-then-backward",
                    scale = 0.5,
                    shift = { 0.5, -0.5 },
                    width = 128,
                    x = 0,
                    y = 0
                }
            }
        },
        west = {
            layers = {
                {
                    animation_speed = 0.75,
                    draw_as_glow = false,
                    draw_as_light = false,
                    draw_as_shadow = true,
                    filename =
                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/derrick-base-shadow.png",
                    frame_count = 1,
                    height = 256,
                    line_length = 1,
                    priority = "high",
                    repeat_count = 118,
                    scale = 0.5,
                    shift = { 1.5, 0.5 },
                    width = 384,
                    x = 1152,
                    y = 0
                },
                {
                    animation_speed = 0.75,
                    draw_as_glow = false,
                    draw_as_light = false,
                    draw_as_shadow = true,
                    filename =
                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/derrick-working-shadow.png",
                    frame_count = 60,
                    height = 128,
                    line_length = 6,
                    priority = "high",
                    run_mode = "forward-then-backward",
                    scale = 0.5,
                    shift = { 1.5, 0.5 },
                    width = 256,
                    x = 0,
                    y = 0
                },
                {
                    animation_speed = 0.75,
                    draw_as_glow = false,
                    draw_as_light = false,
                    draw_as_shadow = false,
                    filename =
                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/steel-derrick-base.png",
                    frame_count = 1,
                    height = 320,
                    line_length = 1,
                    priority = "high",
                    repeat_count = 118,
                    scale = 0.5,
                    shift = { 0, 0 },
                    width = 192,
                    x = 576,
                    y = 0
                },
                {
                    animation_speed = 0.75,
                    draw_as_glow = false,
                    draw_as_light = false,
                    draw_as_shadow = false,
                    filename =
                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/steel-derrick-working.png",
                    frame_count = 60,
                    height = 256,
                    line_length = 10,
                    priority = "high",
                    run_mode = "forward-then-backward",
                    scale = 0.5,
                    shift = { 0.5, -0.5 },
                    width = 128,
                    x = 0,
                    y = 0
                }
            }
        }
    },
    status_colors = STATUS_COLORS,
    working_visualisations = {
        {
            align_to_waypoint = false,
            always_draw = true,
            animation = {
                animation_speed = 0.5,
                blend_mode = "additive-soft",
                draw_as_glow = true,
                draw_as_light = false,
                draw_as_shadow = false,
                filename =
                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/steel-derrick-working-glow.png",
                frame_count = 30,
                height = 64,
                line_length = 6,
                priority = "high",
                scale = 0.5,
                shift = { -1, -0.5 },
                width = 64,
                x = 0,
                y = 0
            },
            apply_tint = "status",
            light = {
                intensity = 0.333,
                shift = { -1, 0.75 },
                size = 1.5
            }
        }
    }
}

entity.output_fluid_box       = {
    volume = 1000,
    production_type = "output",
    pipe_connections = {
        {
            direction = defines.direction.north,
            positions = { { 0, -1 }, { 1, 0 }, { 0, 1 }, { -1, 0 } },
            flow_direction = "output"
        }
    },
    pipe_covers = PIPE_COVERS
}

data:extend({ entity })
