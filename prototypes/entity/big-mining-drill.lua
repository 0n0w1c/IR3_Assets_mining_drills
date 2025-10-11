local hit_effects      = require("__base__/prototypes/entity/hit-effects")
local sounds           = require("__base__/prototypes/entity/sounds")

local footprint        = settings.startup["IR3-big-drill-footprint"]
    and settings.startup["IR3-big-drill-footprint"].value or "5x5"
local is7              = (footprint == "7x7")

local BASE_SCALE       = 0.5
local SPRITE_SCALE     = is7 and BASE_SCALE or (BASE_SCALE * (5 / 7))
local SHIFT_FACTOR     = is7 and 1 or (5 / 7)

local half_extent      = is7 and 3.5 or 2.5
local connection_shift = half_extent - 0.5
local selection_box    = {
    { -half_extent, -half_extent },
    { half_extent,  half_extent }
}
local collision_box    = {
    { -(half_extent - 0.1), -(half_extent - 0.1) },
    { (half_extent - 0.1),  (half_extent - 0.1) }
}
local vector_to_place  = -(half_extent + 0.35)

local function scale_sheet(sheet)
    if not sheet then return end
    if sheet.scale then sheet.scale = SPRITE_SCALE end
    if sheet.shift and type(sheet.shift) == "table" then
        sheet.shift = { sheet.shift[1] * SHIFT_FACTOR, sheet.shift[2] * SHIFT_FACTOR }
    end
end

local function scale_animation(anim)
    if not anim then return end
    if anim.layers then
        for _, layer in ipairs(anim.layers) do scale_sheet(layer) end
    else
        scale_sheet(anim)
    end
end

local function scale_working_visualization(working_visualization)
    if not working_visualization then return end
    scale_animation(working_visualization.animation)
    scale_animation(working_visualization.north_animation)
    scale_animation(working_visualization.east_animation)
    scale_animation(working_visualization.south_animation)
    scale_animation(working_visualization.west_animation)
    if working_visualization.light and working_visualization.light.shift then
        local s = working_visualization.light.shift
        working_visualization.light.shift = { s[1] * SHIFT_FACTOR, s[2] * SHIFT_FACTOR }
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
        for _, working_visualization in ipairs(out.working_visualisations) do scale_working_visualization(
            working_visualization) end
    end
    return out
end

local function shift_pair(p, dx, dy)
    if p then
        p[1] = p[1] + dx; p[2] = p[2] + dy
    end
end

local function shift_connector_entry(entry, dx, dy)
    if entry.sprites then
        for _, key in ipairs({ "connector_main", "wire_pins", "led_blue", "led_blue_off", "led_green", "led_red" }) do
            local s = entry.sprites[key]; if s and s.shift then shift_pair(s.shift, dx, dy) end
        end
        shift_pair(entry.sprites.blue_led_light_offset, dx, dy)
        shift_pair(entry.sprites.red_green_led_light_offset, dx, dy)
    end
    if entry.points then
        if entry.points.wire then
            shift_pair(entry.points.wire.red, dx, dy)
            shift_pair(entry.points.wire.green, dx, dy)
        end
        if entry.points.shadow then
            shift_pair(entry.points.shadow.red, dx, dy)
            shift_pair(entry.points.shadow.green, dx, dy)
        end
    end
end

local function scaled_circuit_connector(base_cc)
    if is7 then return base_cc end
    local cc = table.deepcopy(base_cc)

    shift_connector_entry(cc[1], 0, 1)
    shift_connector_entry(cc[2], -1, 0)
    shift_connector_entry(cc[3], 0, -1)
    shift_connector_entry(cc[4], 1, 0)
    return cc
end

local base_circuit_connector = {
    -- north
    {
        sprites = {
            connector_main             = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04a-base-sequence.png", priority = "low", width = 52, height = 50, scale = 0.5, x = 208, y = 0, shift = { -0.15625, -3.5 } },
            wire_pins                  = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04c-wire-sequence.png", priority = "low", width = 62, height = 58, scale = 0.5, x = 248, y = 0, shift = { -0.15625, -3.5 } },
            led_blue                   = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04e-blue-LED-on-sequence.png", priority = "low", draw_as_glow = true, width = 60, height = 60, scale = 0.5, x = 240, y = 0, shift = { -0.15625, -3.53125 } },
            led_blue_off               = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04f-blue-LED-off-sequence.png", priority = "low", width = 46, height = 44, scale = 0.5, x = 184, y = 0, shift = { -0.15625, -3.53125 } },
            led_green                  = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04h-green-LED-sequence.png", priority = "low", draw_as_glow = true, width = 48, height = 46, scale = 0.5, x = 192, y = 0, shift = { -0.15625, -3.53125 } },
            led_red                    = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04i-red-LED-sequence.png", priority = "low", draw_as_glow = true, width = 48, height = 46, scale = 0.5, x = 192, y = 0, shift = { -0.15625, -3.53125 } },
            led_light                  = { intensity = 0, size = 0.9 },
            blue_led_light_offset      = { 0.078125, -3.671875 },
            red_green_led_light_offset = { -0.078125, -3.671875 },
        },
        points = {
            wire   = { red = { -0.125, -3.875 }, green = { 0.140625, -3.875 } },
            shadow = { red = { 0.21875, -3.59375 }, green = { 0.46875, -3.578125 } },
        },
    },

    -- east
    {
        sprites = {
            connector_main             = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04a-base-sequence.png", priority = "low", width = 52, height = 50, scale = 0.5, x = 104, y = 0, shift = { 3.40625, -0.046875 } },
            wire_pins                  = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04c-wire-sequence.png", priority = "low", width = 62, height = 58, scale = 0.5, x = 124, y = 0, shift = { 3.40625, -0.078125 } },
            led_blue                   = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04e-blue-LED-on-sequence.png", priority = "low", draw_as_glow = true, width = 60, height = 60, scale = 0.5, x = 120, y = 0, shift = { 3.40625, -0.078125 } },
            led_blue_off               = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04f-blue-LED-off-sequence.png", priority = "low", width = 46, height = 44, scale = 0.5, x = 92, y = 0, shift = { 3.40625, -0.078125 } },
            led_green                  = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04h-green-LED-sequence.png", priority = "low", draw_as_glow = true, width = 48, height = 46, scale = 0.5, x = 96, y = 0, shift = { 3.40625, -0.078125 } },
            led_red                    = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04i-red-LED-sequence.png", priority = "low", draw_as_glow = true, width = 48, height = 46, scale = 0.5, x = 96, y = 0, shift = { 3.40625, -0.078125 } },
            led_light                  = { intensity = 0, size = 0.9 },
            blue_led_light_offset      = { 3.4375, -0.046875 },
            red_green_led_light_offset = { 3.4375, -0.15625 },
        },
        points = {
            wire   = { red = { 3.6875, -0.1875 }, green = { 3.75, 0 } },
            shadow = { red = { 3.984375, 0.078125 }, green = { 4.0625, 0.28125 } },
        },
    },

    -- south
    {
        sprites = {
            connector_main             = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04a-base-sequence.png", priority = "low", width = 52, height = 50, scale = 0.5, x = 0, y = 0, shift = { 0.15625, 3.25 } },
            wire_pins                  = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04c-wire-sequence.png", priority = "low", width = 62, height = 58, scale = 0.5, x = 0, y = 0, shift = { 0.15625, 3.21875 } },
            led_blue                   = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04e-blue-LED-on-sequence.png", priority = "low", draw_as_glow = true, width = 60, height = 60, scale = 0.5, x = 0, y = 0, shift = { 0.15625, 3.21875 } },
            led_blue_off               = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04f-blue-LED-off-sequence.png", priority = "low", width = 46, height = 44, scale = 0.5, x = 0, y = 0, shift = { 0.15625, 3.21875 } },
            led_green                  = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04h-green-LED-sequence.png", priority = "low", draw_as_glow = true, width = 48, height = 46, scale = 0.5, x = 0, y = 0, shift = { 0.15625, 3.21875 } },
            led_red                    = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04i-red-LED-sequence.png", priority = "low", draw_as_glow = true, width = 48, height = 46, scale = 0.5, x = 0, y = 0, shift = { 0.15625, 3.21875 } },
            led_light                  = { intensity = 0, size = 0.9 },
            blue_led_light_offset      = { -0.0625, 3.109375 },
            red_green_led_light_offset = { 0.09375, 3.109375 },
        },
        points = {
            wire   = { red = { 0.140625, 3.421875 }, green = { -0.09375, 3.421875 } },
            shadow = { red = { 0.375, 3.3125 }, green = { 0.15625, 3.328125 } },
        },
    },

    -- west
    {
        sprites = {
            connector_main             = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04a-base-sequence.png", priority = "low", width = 52, height = 50, scale = 0.5, x = 312, y = 0, shift = { -3.40625, 0.109375 } },
            wire_pins                  = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04c-wire-sequence.png", priority = "low", width = 62, height = 58, scale = 0.5, x = 372, y = 0, shift = { -3.40625, 0.078125 } },
            led_blue                   = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04e-blue-LED-on-sequence.png", priority = "low", draw_as_glow = true, width = 60, height = 60, scale = 0.5, x = 360, y = 0, shift = { -3.40625, 0.078125 } },
            led_blue_off               = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04f-blue-LED-off-sequence.png", priority = "low", width = 46, height = 44, scale = 0.5, x = 276, y = 0, shift = { -3.40625, 0.078125 } },
            led_green                  = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04h-green-LED-sequence.png", priority = "low", draw_as_glow = true, width = 48, height = 46, scale = 0.5, x = 288, y = 0, shift = { -3.40625, 0.078125 } },
            led_red                    = { filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04i-red-LED-sequence.png", priority = "low", draw_as_glow = true, width = 48, height = 46, scale = 0.5, x = 288, y = 0, shift = { -3.40625, 0.078125 } },
            led_light                  = { intensity = 0, size = 0.9 },
            blue_led_light_offset      = { -3.421875, -0.21875 },
            red_green_led_light_offset = { -3.421875, -0.09375 },
        },
        points = {
            wire   = { red = { -3.75, -0.046875 }, green = { -3.671875, -0.25 } },
            shadow = { red = { -3.46875, 0.203125 }, green = { -3.375, 0.015625 } },
        },
    },
}

data:extend({
    {
        type = "mining-drill",
        name = "big-mining-drill",
        icon = "__IndustrialRevolution3Assets1__/graphics/icons/64/chrome-drill.png",
        flags = { "placeable-neutral", "player-creation" },
        minable = { mining_time = 0.3, result = "big-mining-drill" },
        max_health = 300,
        resource_categories = { "basic-solid", "hard-solid" },
        corpse = "big-mining-drill-remnants",
        dying_explosion = "big-mining-drill-explosion",

        collision_box = collision_box,
        selection_box = selection_box,
        drawing_box_vertical_extension = 1,

        damaged_trigger_effect = hit_effects.entity(),
        heating_energy = "200kW",
        resource_drain_rate_percent = 50,
        drops_full_belt_stacks = true,

        input_fluid_box = {
            volume = 200,
            production_type = "input",
            pipe_connections = {
                { position = { -connection_shift, 0 }, direction = defines.direction.west },
                { position = { connection_shift, 0 },  direction = defines.direction.east },
                { position = { 0, connection_shift },  direction = defines.direction.south },
            },
            pipe_covers = {
                east  = {
                    layers = {
                        { filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-iron-ce.png",   width = 180, height = 120, priority = "extra-high", scale = 0.5, shift = { -1, 0 } },
                        { filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-ce.png", width = 180, height = 120, priority = "extra-high", scale = 0.5, shift = { -1, 0 }, draw_as_shadow = true },
                    }
                },
                north = {
                    layers = {
                        { filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-iron-cn.png",   width = 180, height = 120, priority = "extra-high", scale = 0.5, shift = { 0, 1 } },
                        { filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-cn.png", width = 180, height = 120, priority = "extra-high", scale = 0.5, shift = { 0, 1 }, draw_as_shadow = true },
                    }
                },
                south = {
                    layers = {
                        { filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-iron-cs.png",   width = 180, height = 120, priority = "extra-high", scale = 0.5, shift = { 0, -1 } },
                        { filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-cs.png", width = 180, height = 120, priority = "extra-high", scale = 0.5, shift = { 0, -1 }, draw_as_shadow = true },
                    }
                },
                west  = {
                    layers = {
                        { filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-iron-cw.png",   width = 180, height = 120, priority = "extra-high", scale = 0.5, shift = { 1, 0 } },
                        { filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-cw.png", width = 180, height = 120, priority = "extra-high", scale = 0.5, shift = { 1, 0 }, draw_as_shadow = true },
                    }
                },
            }
        },

        open_sound = sounds.drill_open,
        close_sound = sounds.drill_close,


        graphics_set = scale_drill_graphics({
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
                        draw_as_glow = false,
                        draw_as_light = false,
                        draw_as_shadow = false,
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
                                draw_as_glow = false,
                                draw_as_light = false,
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
                                draw_as_glow = false,
                                draw_as_light = false,
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
                                draw_as_glow = false,
                                draw_as_light = false,
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
                                draw_as_glow = false,
                                draw_as_light = false,
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
                                draw_as_glow = false,
                                draw_as_light = false,
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
                                draw_as_glow = false,
                                draw_as_light = false,
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
                                draw_as_glow = false,
                                draw_as_light = false,
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
                                draw_as_glow = false,
                                draw_as_light = false,
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
                                draw_as_glow = false,
                                draw_as_light = false,
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
                                draw_as_glow = false,
                                draw_as_light = false,
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
                                draw_as_glow = false,
                                draw_as_light = false,
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
                                draw_as_glow = false,
                                draw_as_light = false,
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
                                draw_as_glow = false,
                                draw_as_light = false,
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
                                draw_as_glow = false,
                                draw_as_light = false,
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
                                draw_as_glow = false,
                                draw_as_light = false,
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
                                draw_as_glow = false,
                                draw_as_light = false,
                            },
                        }
                    },
                },

                {
                    align_to_waypoint = false,
                    always_draw = true,
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
                        draw_as_light = false,
                        draw_as_shadow = false,
                    },
                    apply_tint = "status",
                },
            },
        }),

        wet_mining_graphics_set = scale_drill_graphics({
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
                        draw_as_glow = false,
                        draw_as_light = false,
                        draw_as_shadow = false,
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
                        draw_as_light = false,
                        draw_as_shadow = false,
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
        }),

        working_sound = {
            fade_in_ticks = 10,
            fade_out_ticks = 30,
            sound = { filename = "__IndustrialRevolution3Assets1__/sound/heavy-drill.ogg", volume = 1 }
        },

        perceived_performance = { maximum = 30.0 },
        mining_speed = 2.5,
        energy_source = { type = "electric", emissions_per_minute = { pollution = 40 }, usage_priority = "secondary-input" },
        energy_usage = "300kW",

        resource_searching_radius = 6.49,
        vector_to_place_result = { 0, vector_to_place },

        module_slots = 4,
        radius_visualisation_picture = {
            filename = "__space-age__/graphics/entity/big-mining-drill/big-mining-drill-radius-visualization.png",
            width = 10,
            height = 10
        },
        monitor_visualization_tint = { r = 78, g = 173, b = 255 },
        fast_replaceable_group = "big-mining-drill",

        circuit_wire_max_distance = default_circuit_wire_max_distance,
        circuit_connector = scaled_circuit_connector(base_circuit_connector)
    }
})
