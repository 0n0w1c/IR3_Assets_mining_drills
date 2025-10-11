local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

require("__base__/prototypes/entity/pipecovers")

data:extend({
    {
        type = "mining-drill",
        name = "electric-mining-drill",
        icon = "__base__/graphics/icons/electric-mining-drill.png",
        flags = { "placeable-neutral", "player-creation" },
        minable = { mining_time = 0.3, result = "electric-mining-drill" },
        max_health = 300,
        resource_categories = { "basic-solid" },
        corpse = "electric-mining-drill-remnants",
        dying_explosion = "electric-mining-drill-explosion",
        collision_box = { { -2.4, -2.4 }, { 2.4, 2.4 } },
        selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
        damaged_trigger_effect = hit_effects.entity(),
        input_fluid_box = {
            volume = 200,
            production_type = "input",

            pipe_connections = {
                { position = { -2, 0 }, direction = defines.direction.west },
                { position = { 2, 0 },  direction = defines.direction.east },
                { position = { 0, 2 },  direction = defines.direction.south },
            },

            pipe_covers = {
                east = {
                    layers = {
                        {
                            filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-iron-ce.png",
                            width = 180,
                            height = 120,
                            priority = "extra-high",
                            scale = 0.5,
                            shift = { -1, 0 }
                        },
                        {
                            draw_as_shadow = true,
                            filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-ce.png",
                            width = 180,
                            height = 120,
                            priority = "extra-high",
                            scale = 0.5,
                            shift = { 0, 0 }
                        }
                    }
                },
                north = {
                    layers = {
                        {
                            filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-iron-cn.png",
                            width = 180,
                            height = 120,
                            priority = "extra-high",
                            scale = 0.5,
                            shift = { 0, 1 }
                        },
                        {
                            draw_as_shadow = true,
                            filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-cn.png",
                            width = 180,
                            height = 120,
                            priority = "extra-high",
                            scale = 0.5,
                            shift = { 0, 0 }
                        }
                    }
                },
                south = {
                    layers = {
                        {
                            filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-iron-cs.png",
                            width = 180,
                            height = 120,
                            priority = "extra-high",
                            scale = 0.5,
                            shift = { 0, -1 }
                        },
                        {
                            draw_as_shadow = true,
                            filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-cs.png",
                            width = 180,
                            height = 120,
                            priority = "extra-high",
                            scale = 0.5,
                            shift = { 0, 0 }
                        }
                    }
                },
                west = {
                    layers = {
                        {
                            filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-iron-cw.png",
                            width = 180,
                            height = 120,
                            priority = "extra-high",
                            scale = 0.5,
                            shift = { 1, 0 }
                        },
                        {
                            draw_as_shadow = true,
                            filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-cw.png",
                            width = 180,
                            height = 120,
                            priority = "extra-high",
                            scale = 0.5,
                            shift = { 0, 0 }
                        }
                    }
                }
            }
        },

        working_sound =
        {
            sound = { filename = "__base__/sound/electric-mining-drill.ogg", volume = 1.0, advanced_volume_control = { attenuation = "exponential" } },
            max_sounds_per_prototype = 4,
            fade_in_ticks = 4,
            fade_out_ticks = 20
        },
        open_sound = sounds.drill_open,
        close_sound = sounds.drill_close,

        graphics_set = {
            status_colors = {
                disabled = { r = 1, g = 0.25, b = 0.25, a = 1 },
                full_output = { r = 1, g = 0.625, b = 0.25, a = 1 },
                idle = { r = 0.25, g = 0.625, b = 1, a = 1 },
                insufficient_input = { r = 1, g = 0.625, b = 0.25, a = 1 },
                low_power = { r = 1, g = 0.25, b = 0.25, a = 1 },
                no_minable_resources = { r = 0.25, g = 0.625, b = 1, a = 1 },
                no_power = { 0, 0, 0, 0 },
                working = { r = 0.25, g = 1, b = 0.25, a = 1 },
            },

            working_visualisations = {
                {
                    always_draw = true,
                    animation = {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-underlay-rail.png",
                        priority = "high",
                        width = 384,
                        height = 384,
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
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-underlay-north.png",
                                priority = "high",
                                width = 384,
                                height = 384,
                                frame_count = 1,
                                line_length = 1,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, 0 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-shadow.png",
                                priority = "high",
                                width = 384,
                                height = 224,
                                frame_count = 60,
                                line_length = 6,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 1, 0 },
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-base.png",
                                priority = "high",
                                width = 256,
                                height = 256,
                                frame_count = 60,
                                line_length = 10,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, -0.75 },
                            },
                        },
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
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-underlay-east.png",
                                priority = "high",
                                width = 384,
                                height = 384,
                                frame_count = 1,
                                line_length = 1,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, 0 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-shadow.png",
                                priority = "high",
                                width = 384,
                                height = 224,
                                frame_count = 60,
                                line_length = 6,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 1, 0 },
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-base.png",
                                priority = "high",
                                width = 256,
                                height = 256,
                                frame_count = 60,
                                line_length = 10,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, -0.75 },
                            },
                        },
                    },

                    south_animation = {
                        layers = (function()
                            return {
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
                                    draw_as_shadow = true,
                                },
                                {
                                    filename =
                                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-underlay-south.png",
                                    priority = "high",
                                    width = 384,
                                    height = 384,
                                    frame_count = 1,
                                    line_length = 1,
                                    repeat_count = 118,
                                    animation_speed = 0.5,
                                    scale = 0.5,
                                    shift = { 0, 0 },
                                },
                                {
                                    filename =
                                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-shadow.png",
                                    priority = "high",
                                    width = 384,
                                    height = 224,
                                    frame_count = 60,
                                    line_length = 6,
                                    run_mode = "forward-then-backward",
                                    animation_speed = 0.5,
                                    scale = 0.5,
                                    shift = { 1, 0 },
                                    draw_as_shadow = true,
                                },
                                {
                                    filename =
                                    "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-base.png",
                                    priority = "high",
                                    width = 256,
                                    height = 256,
                                    frame_count = 60,
                                    line_length = 10,
                                    run_mode = "forward-then-backward",
                                    animation_speed = 0.5,
                                    scale = 0.5,
                                    shift = { 0, -0.75 },
                                },
                            }
                        end)()
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
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-underlay-west.png",
                                priority = "high",
                                width = 384,
                                height = 384,
                                frame_count = 1,
                                line_length = 1,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, 0 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-shadow.png",
                                priority = "high",
                                width = 384,
                                height = 224,
                                frame_count = 60,
                                line_length = 6,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 1, 0 },
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-base.png",
                                priority = "high",
                                width = 256,
                                height = 256,
                                frame_count = 60,
                                line_length = 10,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, -0.75 },
                            },
                        },
                    },
                },

                {
                    align_to_waypoint = false,
                    always_draw = true,
                    animation = {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-working.png",
                        priority = "high",
                        width = 128,
                        height = 160,
                        frame_count = 118,
                        line_length = 10,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, -0.5 },
                        blend_mode = "additive-soft",
                        draw_as_glow = true,
                    },
                    apply_tint = "status",
                },
            },
        },

        wet_mining_graphics_set = {
            status_colors = {
                disabled = { r = 1, g = 0.25, b = 0.25, a = 1 },
                full_output = { r = 1, g = 0.625, b = 0.25, a = 1 },
                idle = { r = 0.25, g = 0.625, b = 1, a = 1 },
                insufficient_input = { r = 1, g = 0.625, b = 0.25, a = 1 },
                low_power = { r = 1, g = 0.25, b = 0.25, a = 1 },
                no_minable_resources = { r = 0.25, g = 0.625, b = 1, a = 1 },
                no_power = { 0, 0, 0, 0 },
                working = { r = 0.25, g = 1, b = 0.25, a = 1 },
            },

            working_visualisations = {
                {
                    always_draw = true,
                    animation = {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-underlay-rail.png",
                        priority = "high",
                        width = 384,
                        height = 384,
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
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-underlay-east.png",
                                priority = "high",
                                width = 384,
                                height = 384,
                                frame_count = 1,
                                line_length = 1,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, 0 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-shadow.png",
                                priority = "high",
                                width = 384,
                                height = 224,
                                frame_count = 60,
                                line_length = 6,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 1, 0 },
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-base.png",
                                priority = "high",
                                width = 256,
                                height = 256,
                                frame_count = 60,
                                line_length = 10,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, -0.75 },
                            },
                        }
                    },

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
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-underlay-north.png",
                                priority = "high",
                                width = 384,
                                height = 384,
                                frame_count = 1,
                                line_length = 1,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, 0 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-shadow.png",
                                priority = "high",
                                width = 384,
                                height = 224,
                                frame_count = 60,
                                line_length = 6,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 1, 0 },
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-base.png",
                                priority = "high",
                                width = 256,
                                height = 256,
                                frame_count = 60,
                                line_length = 10,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, -0.75 },
                            },
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
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-underlay-south.png",
                                priority = "high",
                                width = 384,
                                height = 384,
                                frame_count = 1,
                                line_length = 1,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, 0 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-shadow.png",
                                priority = "high",
                                width = 384,
                                height = 224,
                                frame_count = 60,
                                line_length = 6,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 1, 0 },
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-base.png",
                                priority = "high",
                                width = 256,
                                height = 256,
                                frame_count = 60,
                                line_length = 10,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, -0.75 },
                            },
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
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-underlay-west.png",
                                priority = "high",
                                width = 384,
                                height = 384,
                                frame_count = 1,
                                line_length = 1,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, 0 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-shadow.png",
                                priority = "high",
                                width = 384,
                                height = 224,
                                frame_count = 60,
                                line_length = 6,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 1, 0 },
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-base.png",
                                priority = "high",
                                width = 256,
                                height = 256,
                                frame_count = 60,
                                line_length = 10,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, -0.75 },
                            },
                        }
                    },
                },

                {
                    align_to_waypoint = false,
                    always_draw = true,
                    animation = {
                        filename =
                        "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-working.png",
                        priority = "high",
                        width = 128,
                        height = 160,
                        frame_count = 118,
                        line_length = 10,
                        animation_speed = 0.5,
                        scale = 0.5,
                        shift = { 0, -0.5 },
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
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-patch-east-shadow.png",
                                priority = "high",
                                width = 448,
                                height = 384,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0.5, 0 },
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-connector-north.png",
                                priority = "high",
                                width = 80,
                                height = 192,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, -1.5 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-connector-south.png",
                                priority = "high",
                                width = 80,
                                height = 192,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, 1.5 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-connector-west.png",
                                priority = "high",
                                width = 192,
                                height = 80,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { -1.5, 0 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-pipes-nw.png",
                                priority = "high",
                                width = 192,
                                height = 192,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { -1.5, -1.5 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-pipes-sw.png",
                                priority = "high",
                                width = 192,
                                height = 192,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { -1.5, 1.5 },
                            },
                        }
                    },

                    north_animation = {
                        layers = {
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-patch-north-shadow.png",
                                priority = "high",
                                width = 448,
                                height = 384,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0.5, 0 },
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-connector-south.png",
                                priority = "high",
                                width = 80,
                                height = 192,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, 1.5 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-connector-east.png",
                                priority = "high",
                                width = 192,
                                height = 80,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 1.5, 0 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-connector-west.png",
                                priority = "high",
                                width = 192,
                                height = 80,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { -1.5, 0 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-pipes-se.png",
                                priority = "high",
                                width = 192,
                                height = 192,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 1.5, 1.5 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-pipes-sw.png",
                                priority = "high",
                                width = 192,
                                height = 192,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { -1.5, 1.5 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-pipes-shadow-se.png",
                                priority = "high",
                                width = 64,
                                height = 128,
                                frame_count = 60,
                                line_length = 10,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 2, 1 },
                            },
                        }
                    },

                    south_animation = {
                        layers = {
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-patch-south-shadow.png",
                                priority = "high",
                                width = 448,
                                height = 384,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0.5, 0 },
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-connector-north.png",
                                priority = "high",
                                width = 80,
                                height = 192,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, -1.5 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-connector-east.png",
                                priority = "high",
                                width = 192,
                                height = 80,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 1.5, 0 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-connector-west.png",
                                priority = "high",
                                width = 192,
                                height = 80,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { -1.5, 0 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-pipes-ne.png",
                                priority = "high",
                                width = 192,
                                height = 192,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 1.5, -1.5 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-pipes-nw.png",
                                priority = "high",
                                width = 192,
                                height = 192,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { -1.5, -1.5 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-pipes-shadow-ne.png",
                                priority = "high",
                                width = 64,
                                height = 128,
                                frame_count = 60,
                                line_length = 10,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 2, -1 },
                            },
                        }
                    },

                    west_animation = {
                        layers = {
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-patch-west-shadow.png",
                                priority = "high",
                                width = 448,
                                height = 384,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0.5, 0 },
                                draw_as_shadow = true,
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-connector-north.png",
                                priority = "high",
                                width = 80,
                                height = 192,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, -1.5 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-connector-south.png",
                                priority = "high",
                                width = 80,
                                height = 192,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 0, 1.5 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-connector-east.png",
                                priority = "high",
                                width = 192,
                                height = 80,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 1.5, 0 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-pipes-ne.png",
                                priority = "high",
                                width = 192,
                                height = 192,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 1.5, -1.5 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-pipes-se.png",
                                priority = "high",
                                width = 192,
                                height = 192,
                                repeat_count = 118,
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 1.5, 1.5 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-pipes-shadow-ne.png",
                                priority = "high",
                                width = 64,
                                height = 128,
                                frame_count = 60,
                                line_length = 10,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 2, -1 },
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-pipes-shadow-se.png",
                                priority = "high",
                                width = 64,
                                height = 128,
                                frame_count = 60,
                                line_length = 10,
                                run_mode = "forward-then-backward",
                                animation_speed = 0.5,
                                scale = 0.5,
                                shift = { 2, 1 },
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
                                shift = { 0, -2 },
                                blend_mode = "additive-soft",
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-s.png",
                                priority = "high",
                                width = 128,
                                height = 128,
                                scale = 0.5,
                                shift = { 0, 2 },
                                blend_mode = "additive-soft",
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-w.png",
                                priority = "high",
                                width = 128,
                                height = 128,
                                scale = 0.5,
                                shift = { -2, 0 },
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
                                shift = { 2, 0 },
                                blend_mode = "additive-soft",
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-s.png",
                                priority = "high",
                                width = 128,
                                height = 128,
                                scale = 0.5,
                                shift = { 0, 2 },
                                blend_mode = "additive-soft",
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-w.png",
                                priority = "high",
                                width = 128,
                                height = 128,
                                scale = 0.5,
                                shift = { -2, 0 },
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
                                shift = { 0, -2 },
                                blend_mode = "additive-soft",
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-e.png",
                                priority = "high",
                                width = 128,
                                height = 128,
                                scale = 0.5,
                                shift = { 2, 0 },
                                blend_mode = "additive-soft",
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-w.png",
                                priority = "high",
                                width = 128,
                                height = 128,
                                scale = 0.5,
                                shift = { -2, 0 },
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
                                shift = { 0, -2 },
                                blend_mode = "additive-soft",
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-e.png",
                                priority = "high",
                                width = 128,
                                height = 128,
                                scale = 0.5,
                                shift = { 2, 0 },
                                blend_mode = "additive-soft",
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-base-s.png",
                                priority = "high",
                                width = 128,
                                height = 128,
                                scale = 0.5,
                                shift = { 0, 2 },
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
                                shift = { 0, -2 },
                                blend_mode = "additive",
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-s.png",
                                priority = "high",
                                width = 128,
                                height = 128,
                                scale = 0.5,
                                shift = { 0, 2 },
                                blend_mode = "additive",
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-w.png",
                                priority = "high",
                                width = 128,
                                height = 128,
                                scale = 0.5,
                                shift = { -2, 0 },
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
                                shift = { 2, 0 },
                                blend_mode = "additive",
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-s.png",
                                priority = "high",
                                width = 128,
                                height = 128,
                                scale = 0.5,
                                shift = { 0, 2 },
                                blend_mode = "additive",
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-w.png",
                                priority = "high",
                                width = 128,
                                height = 128,
                                scale = 0.5,
                                shift = { -2, 0 },
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
                                shift = { 0, -2 },
                                blend_mode = "additive",
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-e.png",
                                priority = "high",
                                width = 128,
                                height = 128,
                                scale = 0.5,
                                shift = { 2, 0 },
                                blend_mode = "additive",
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-w.png",
                                priority = "high",
                                width = 128,
                                height = 128,
                                scale = 0.5,
                                shift = { -2, 0 },
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
                                shift = { 0, -2 },
                                blend_mode = "additive",
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-e.png",
                                priority = "high",
                                width = 128,
                                height = 128,
                                scale = 0.5,
                                shift = { 2, 0 },
                                blend_mode = "additive",
                            },
                            {
                                filename =
                                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/iron-drill-window-flow-s.png",
                                priority = "high",
                                width = 128,
                                height = 128,
                                scale = 0.5,
                                shift = { 0, 2 },
                                blend_mode = "additive",
                            },
                        }
                    },
                },
            }
        },

        perceived_performance = { maximum = 30.0 },

        integration_patch =
        {
            north =
            {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-integration.png",
                width = 216,
                height = 218,
                shift = util.by_pixel(-1, 1),
                scale = 0.5
            },
            east =
            {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-integration.png",
                width = 236,
                height = 214,
                shift = util.by_pixel(3, 2),
                scale = 0.5
            },
            south =
            {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-integration.png",
                width = 214,
                height = 230,
                shift = util.by_pixel(0, 3),
                scale = 0.5
            },
            west =
            {
                priority = "high",
                filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-integration.png",
                width = 234,
                height = 214,
                shift = util.by_pixel(-4, 1),
                scale = 0.5
            }
        },

        mining_speed = 0.5,
        energy_source =
        {
            type = "electric",
            emissions_per_minute = { pollution = 10 },
            usage_priority = "secondary-input"
        },
        energy_usage = "90kW",
        resource_searching_radius = 2.49,
        vector_to_place_result = { 0, -2.85 },
        module_slots = 3,
        radius_visualisation_picture =
        {
            filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
            width = 10,
            height = 10
        },
        monitor_visualization_tint = { 78, 173, 255 },
        fast_replaceable_group = "mining-drill",

        circuit_wire_max_distance = default_circuit_wire_max_distance,
        circuit_connector = {
            -- north
            {
                sprites = {
                    connector_main = {
                        filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04a-base-sequence.png",
                        priority = "low",
                        width = 52,
                        height = 50,
                        scale = 0.5,
                        x = 208,
                        y = 0,
                        shift = { -0.15625, -2.5 },
                    },
                    wire_pins = {
                        filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04c-wire-sequence.png",
                        priority = "low",
                        width = 62,
                        height = 58,
                        scale = 0.5,
                        x = 248,
                        y = 0,
                        shift = { -0.15625, -2.53125 },
                    },
                    led_blue = {
                        filename =
                        "__base__/graphics/entity/circuit-connector/ccm-universal-04e-blue-LED-on-sequence.png",
                        priority = "low",
                        draw_as_glow = true,
                        width = 60,
                        height = 60,
                        scale = 0.5,
                        x = 240,
                        y = 0,
                        shift = { -0.15625, -2.53125 },
                    },
                    led_blue_off = {
                        filename =
                        "__base__/graphics/entity/circuit-connector/ccm-universal-04f-blue-LED-off-sequence.png",
                        priority = "low",
                        width = 46,
                        height = 44,
                        scale = 0.5,
                        x = 184,
                        y = 0,
                        shift = { -0.15625, -2.53125 },
                    },
                    led_green = {
                        filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04h-green-LED-sequence.png",
                        priority = "low",
                        draw_as_glow = true,
                        width = 48,
                        height = 46,
                        scale = 0.5,
                        x = 192,
                        y = 0,
                        shift = { -0.15625, -2.53125 },
                    },
                    led_red = {
                        filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04i-red-LED-sequence.png",
                        priority = "low",
                        draw_as_glow = true,
                        width = 48,
                        height = 46,
                        scale = 0.5,
                        x = 192,
                        y = 0,
                        shift = { -0.15625, -2.53125 },
                    },
                    led_light = { intensity = 0, size = 0.9 },
                    blue_led_light_offset = { 0.078125, -2.671875 },
                    red_green_led_light_offset = { -0.078125, -2.671875 },
                },
                points = {
                    wire = {
                        red   = { -0.125, -2.875 },
                        green = { 0.140625, -2.875 },
                    },
                    shadow = {
                        red   = { 0.21875, -2.59375 },
                        green = { 0.46875, -2.578125 },
                    },
                },
            },

            -- east
            {
                sprites = {
                    connector_main = {
                        filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04a-base-sequence.png",
                        priority = "low",
                        width = 52,
                        height = 50,
                        scale = 0.5,
                        x = 104,
                        y = 0,
                        shift = { 2.40625, -0.046875 },
                    },
                    wire_pins = {
                        filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04c-wire-sequence.png",
                        priority = "low",
                        width = 62,
                        height = 58,
                        scale = 0.5,
                        x = 124,
                        y = 0,
                        shift = { 2.40625, -0.078125 },
                    },
                    led_blue = {
                        filename =
                        "__base__/graphics/entity/circuit-connector/ccm-universal-04e-blue-LED-on-sequence.png",
                        priority = "low",
                        draw_as_glow = true,
                        width = 60,
                        height = 60,
                        scale = 0.5,
                        x = 120,
                        y = 0,
                        shift = { 2.40625, -0.078125 },
                    },
                    led_blue_off = {
                        filename =
                        "__base__/graphics/entity/circuit-connector/ccm-universal-04f-blue-LED-off-sequence.png",
                        priority = "low",
                        width = 46,
                        height = 44,
                        scale = 0.5,
                        x = 92,
                        y = 0,
                        shift = { 2.40625, -0.078125 },
                    },
                    led_green = {
                        filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04h-green-LED-sequence.png",
                        priority = "low",
                        draw_as_glow = true,
                        width = 48,
                        height = 46,
                        scale = 0.5,
                        x = 96,
                        y = 0,
                        shift = { 2.40625, -0.078125 },
                    },
                    led_red = {
                        filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04i-red-LED-sequence.png",
                        priority = "low",
                        draw_as_glow = true,
                        width = 48,
                        height = 46,
                        scale = 0.5,
                        x = 96,
                        y = 0,
                        shift = { 2.40625, -0.078125 },
                    },
                    led_light = { intensity = 0, size = 0.9 },
                    blue_led_light_offset = { 2.4375, -0.046875 },
                    red_green_led_light_offset = { 2.4375, -0.15625 },
                },
                points = {
                    wire = {
                        red   = { 2.6875, -0.1875 },
                        green = { 2.75, 0.0 },
                    },
                    shadow = {
                        red   = { 2.984375, 0.078125 },
                        green = { 3.0625, 0.28125 },
                    },
                },
            },

            -- south
            {
                sprites = {
                    connector_main = {
                        filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04a-base-sequence.png",
                        priority = "low",
                        width = 52,
                        height = 50,
                        scale = 0.5,
                        x = 0,
                        y = 0,
                        shift = { 0.15625, 2.25 },
                    },
                    wire_pins = {
                        filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04c-wire-sequence.png",
                        priority = "low",
                        width = 62,
                        height = 58,
                        scale = 0.5,
                        x = 0,
                        y = 0,
                        shift = { 0.15625, 2.21875 },
                    },
                    led_blue = {
                        filename =
                        "__base__/graphics/entity/circuit-connector/ccm-universal-04e-blue-LED-on-sequence.png",
                        priority = "low",
                        draw_as_glow = true,
                        width = 60,
                        height = 60,
                        scale = 0.5,
                        x = 0,
                        y = 0,
                        shift = { 0.15625, 2.21875 },
                    },
                    led_blue_off = {
                        filename =
                        "__base__/graphics/entity/circuit-connector/ccm-universal-04f-blue-LED-off-sequence.png",
                        priority = "low",
                        width = 46,
                        height = 44,
                        scale = 0.5,
                        x = 0,
                        y = 0,
                        shift = { 0.15625, 2.21875 },
                    },
                    led_green = {
                        filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04h-green-LED-sequence.png",
                        priority = "low",
                        draw_as_glow = true,
                        width = 48,
                        height = 46,
                        scale = 0.5,
                        x = 0,
                        y = 0,
                        shift = { 0.15625, 2.21875 },
                    },
                    led_red = {
                        filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04i-red-LED-sequence.png",
                        priority = "low",
                        draw_as_glow = true,
                        width = 48,
                        height = 46,
                        scale = 0.5,
                        x = 0,
                        y = 0,
                        shift = { 0.15625, 2.21875 },
                    },
                    led_light = { intensity = 0, size = 0.9 },
                    blue_led_light_offset = { -0.0625, 2.109375 },
                    red_green_led_light_offset = { 0.09375, 2.109375 },
                },
                points = {
                    wire = {
                        red   = { 0.140625, 2.421875 },
                        green = { -0.09375, 2.421875 },
                    },
                    shadow = {
                        red   = { 0.375, 2.625 },
                        green = { 0.15625, 2.640625 },
                    },
                },
            },

            -- west
            {
                sprites = {
                    connector_main = {
                        filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04a-base-sequence.png",
                        priority = "low",
                        width = 52,
                        height = 50,
                        scale = 0.5,
                        x = 312,
                        y = 0,
                        shift = { -2.40625, 0.109375 },
                    },
                    wire_pins = {
                        filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04c-wire-sequence.png",
                        priority = "low",
                        width = 62,
                        height = 58,
                        scale = 0.5,
                        x = 372,
                        y = 0,
                        shift = { -2.40625, 0.078125 },
                    },
                    led_blue = {
                        filename =
                        "__base__/graphics/entity/circuit-connector/ccm-universal-04e-blue-LED-on-sequence.png",
                        priority = "low",
                        draw_as_glow = true,
                        width = 60,
                        height = 60,
                        scale = 0.5,
                        x = 360,
                        y = 0,
                        shift = { -2.40625, 0.078125 },
                    },
                    led_blue_off = {
                        filename =
                        "__base__/graphics/entity/circuit-connector/ccm-universal-04f-blue-LED-off-sequence.png",
                        priority = "low",
                        width = 46,
                        height = 44,
                        scale = 0.5,
                        x = 276,
                        y = 0,
                        shift = { -2.40625, 0.078125 },
                    },
                    led_green = {
                        filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04h-green-LED-sequence.png",
                        priority = "low",
                        draw_as_glow = true,
                        width = 48,
                        height = 46,
                        scale = 0.5,
                        x = 288,
                        y = 0,
                        shift = { -2.40625, 0.078125 },
                    },
                    led_red = {
                        filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04i-red-LED-sequence.png",
                        priority = "low",
                        draw_as_glow = true,
                        width = 48,
                        height = 46,
                        scale = 0.5,
                        x = 288,
                        y = 0,
                        shift = { -2.40625, 0.078125 },
                    },
                    led_light = { intensity = 0, size = 0.9 },
                    blue_led_light_offset = { -2.421875, -0.21875 },
                    red_green_led_light_offset = { -2.421875, -0.09375 },
                },
                points = {
                    wire = {
                        red   = { -2.75, -0.046875 },
                        green = { -2.671875, -0.25 },
                    },
                    shadow = {
                        red   = { -2.46875, 0.203125 },
                        green = { -2.375, 0.015625 },
                    },
                },
            },
        }
    }
})
