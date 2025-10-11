local hit_effects               = require("__base__/prototypes/entity/hit-effects")
local sounds                    = require("__base__/prototypes/entity/sounds")

local footprint                 = settings.startup["IR3-burner-drill-footprint"]
    and settings.startup["IR3-burner-drill-footprint"].value or "2x2"
local is5                       = (footprint == "5x5")

local BASE_SCALE                = 0.5
local SPRITE_SCALE              = is5 and BASE_SCALE or (BASE_SCALE * 0.4)
local SHIFT_FACTOR              = is5 and 1 or 0.4

local half_extent               = is5 and 2.5 or 1.0
local selection_box             = { { -half_extent, -half_extent }, { half_extent, half_extent } }
local collision_box             = { { -(half_extent - 0.1), -(half_extent - 0.1) }, { (half_extent - 0.1), (half_extent - 0.1) } }

local vector_to_place           = { -0.5, -(half_extent + 0.35) }
local resource_searching_radius = is5 and 2.49 or 1
local smoke_shift               = is5 and -1.65 or -0.8

if is5 then
    vector_to_place = { 0, -(half_extent + 0.35) }
end

local function scale_shift(sheet)
    if not sheet then return end
    if sheet.scale then sheet.scale = SPRITE_SCALE end
    if sheet.shift then
        sheet.shift = { sheet.shift[1] * SHIFT_FACTOR, sheet.shift[2] * SHIFT_FACTOR }
    end
end

local function scale_animation(anim)
    if not anim then return end
    if anim.layers then
        for _, layer in ipairs(anim.layers) do scale_shift(layer) end
    else
        scale_shift(anim)
    end
end

local function scale_working_visualisation(wv)
    if not wv then return end
    scale_animation(wv.animation)
    scale_animation(wv.north_animation)
    scale_animation(wv.east_animation)
    scale_animation(wv.south_animation)
    scale_animation(wv.west_animation)
    if wv.light and wv.light.shift then
        local s = wv.light.shift
        wv.light.shift = { s[1] * SHIFT_FACTOR, s[2] * SHIFT_FACTOR }
    end
end

local function scale_drill_graphics(gs)
    local out = table.deepcopy(gs)
    if out.animation then scale_animation(out.animation) end
    if out.north_animation then scale_animation(out.north_animation) end
    if out.east_animation then scale_animation(out.east_animation) end
    if out.south_animation then scale_animation(out.south_animation) end
    if out.west_animation then scale_animation(out.west_animation) end
    if out.working_visualisations then
        for _, wv in ipairs(out.working_visualisations) do scale_working_visualisation(wv) end
    end
    return out
end

local function shift_pair(p, dx, dy)
    if p then
        p[1] = p[1] + dx; p[2] = p[2] + dy
    end
end

local function shift_connector_entry(entry, dx, dy)
    if not entry then return end
    if entry.sprites then
        for _, k in ipairs({ "connector_main", "wire_pins", "led_blue", "led_blue_off", "led_green", "led_red" }) do
            local s = entry.sprites[k]; if s and s.shift then shift_pair(s.shift, dx, dy) end
        end
        shift_pair(entry.sprites.blue_led_light_offset, dx, dy)
        shift_pair(entry.sprites.red_green_led_light_offset, dx, dy)
    end
    if entry.points then
        if entry.points.wire then
            shift_pair(entry.points.wire.red, dx, dy); shift_pair(entry.points.wire.green, dx, dy)
        end
        if entry.points.shadow then
            shift_pair(entry.points.shadow.red, dx, dy); shift_pair(entry.points.shadow.green, dx, dy)
        end
    end
end

local function scaled_circuit_connector(base_cc)
    if is5 then return base_cc end
    local cc = table.deepcopy(base_cc)
    -- 1=north, 2=east, 3=south, 4=west
    shift_connector_entry(cc[1], 0, 1.5)
    shift_connector_entry(cc[2], -1.5, 0)
    shift_connector_entry(cc[3], 0, -1.5)
    shift_connector_entry(cc[4], 1.5, 0)
    return cc
end

data:extend({
    {
        type = "mining-drill",
        name = "burner-mining-drill",
        icon = "__IndustrialRevolution3Assets1__/graphics/icons/64/burner-mining-drill.png",
        flags = { "placeable-neutral", "player-creation" },
        resource_categories = { "basic-solid" },
        minable = { mining_time = 0.3, result = "burner-mining-drill" },
        max_health = 150,
        corpse = "burner-mining-drill-remnants",
        dying_explosion = "burner-mining-drill-explosion",
        collision_box = collision_box,
        selection_box = selection_box,
        damaged_trigger_effect = hit_effects.entity(),
        mining_speed = 0.25,
        working_sound =
        {
            sound = sound_variations("__base__/sound/burner-mining-drill", 2, 0.6,
                volume_multiplier("tips-and-tricks", 0.8)),
            fade_in_ticks = 4,
            fade_out_ticks = 20
        },
        open_sound = sounds.drill_open,
        close_sound = sounds.drill_close,
        allowed_effects = {},
        energy_source = {
            type = "burner",
            effectivity = 1,
            fuel_categories = { "chemical" },
            fuel_inventory_size = 1,

            emissions_per_minute = { pollution = 15 },

            light_flicker = {
                color = { r = 0, g = 0, b = 0, a = 0 }
            },

            smoke = {
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
        },
        energy_usage = "150kW",
        graphics_set = scale_drill_graphics({
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
        }),
        monitor_visualization_tint = { 78, 173, 255 },
        resource_searching_radius = resource_searching_radius,
        radius_visualisation_picture = {
            filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
            height = 10,
            width = 10
        },
        vector_to_place_result = vector_to_place,
        fast_replaceable_group = "mining-drill",

        circuit_wire_max_distance = default_circuit_wire_max_distance,
        circuit_connector = scaled_circuit_connector({
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
        })
    }
})
