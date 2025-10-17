VECTORS = {
    { variation = 4, main_offset = util.by_pixel_hr(-10, -162), shadow_offset = util.by_pixel_hr(0, -152),  show_shadow = true },
    { variation = 2, main_offset = util.by_pixel_hr(154, -5),   shadow_offset = util.by_pixel_hr(164, 5),   show_shadow = true },
    { variation = 0, main_offset = util.by_pixel_hr(10, 142),   shadow_offset = util.by_pixel_hr(20, 152),  show_shadow = true },
    { variation = 6, main_offset = util.by_pixel_hr(-154, 5),   shadow_offset = util.by_pixel_hr(-144, 15), show_shadow = true },
}

STATUS_COLORS = {
    disabled             = { r = 1, g = 0.25, b = 0.25, a = 1 },
    full_output          = { r = 1, g = 0.625, b = 0.25, a = 1 },
    idle                 = { r = 0.25, g = 0.625, b = 1, a = 1 },
    insufficient_input   = { r = 1, g = 0.625, b = 0.25, a = 1 },
    low_power            = { r = 1, g = 0.25, b = 0.25, a = 1 },
    no_minable_resources = { r = 0.25, g = 0.625, b = 1, a = 1 },
    no_power             = { r = 0, g = 0, b = 0, a = 0 },
    working              = { r = 0.25, g = 1, b = 0.25, a = 1 },
}

PIPE_COVERS = {
    north = {
        layers = {
            { filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-iron-cn.png",   height = 120, priority = "extra-high", scale = 0.5, width = 180, shift = { 0, 1 } },
            { filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-cn.png", height = 120, priority = "extra-high", scale = 0.5, width = 180, shift = { 0, 1 }, draw_as_shadow = true }
        }
    },

    east = {
        layers = {
            { filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-iron-ce.png",   height = 120, priority = "extra-high", scale = 0.5, width = 180, shift = { -1, 0 } },
            { filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-ce.png", height = 120, priority = "extra-high", scale = 0.5, width = 180, shift = { -1, 0 }, draw_as_shadow = true }
        }
    },

    south = {
        layers = {
            { filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-iron-cs.png",   height = 120, priority = "extra-high", scale = 0.5, width = 180, shift = { 0, -1 } },
            { filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-cs.png", height = 120, priority = "extra-high", scale = 0.5, width = 180, shift = { 0, -1 }, draw_as_shadow = true }
        }
    },

    west = {
        layers = {
            { filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-iron-cw.png",   height = 120, priority = "extra-high", scale = 0.5, width = 180, shift = { 1, 0 } },
            { filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-cw.png", height = 120, priority = "extra-high", scale = 0.5, width = 180, shift = { 1, 0 }, draw_as_shadow = true }
        }
    }
}

local M = {}

local function _scale_sheet(sheet, s, k)
    if not sheet then return end
    if sheet.scale then sheet.scale = s end
    if sheet.shift and type(sheet.shift) == "table" then
        sheet.shift = { sheet.shift[1] * k, sheet.shift[2] * k }
    end
end

function M.scale_animation(anim, s, k)
    if not anim then return end
    if anim.layers then
        for _, layer in ipairs(anim.layers) do _scale_sheet(layer, s, k) end
    else
        _scale_sheet(anim, s, k)
    end
end

function M.scale_working_visualisation(wv, s, k)
    if not wv then return end
    M.scale_animation(wv.animation, s, k)
    M.scale_animation(wv.north_animation, s, k)
    M.scale_animation(wv.east_animation, s, k)
    M.scale_animation(wv.south_animation, s, k)
    M.scale_animation(wv.west_animation, s, k)
    if wv.light and wv.light.shift then
        local sh = wv.light.shift
        wv.light.shift = { sh[1] * k, sh[2] * k }
    end
end

function M.scale_drill_graphics(gs, s, k)
    local out = table.deepcopy(gs)
    if out.animation then M.scale_animation(out.animation, s, k) end
    if out.north_animation then M.scale_animation(out.north_animation, s, k) end
    if out.east_animation then M.scale_animation(out.east_animation, s, k) end
    if out.south_animation then M.scale_animation(out.south_animation, s, k) end
    if out.west_animation then M.scale_animation(out.west_animation, s, k) end
    if out.working_visualisations then
        for _, wv in ipairs(out.working_visualisations) do
            M.scale_working_visualisation(wv, s, k)
        end
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
        for _, key in ipairs({ "connector_main", "connector_shadow", "wire_pins", "wire_pins_shadow", "led_blue", "led_blue_off", "led_green", "led_red" }) do
            local spr = entry.sprites[key]
            if spr and spr.shift then shift_pair(spr.shift, dx, dy) end
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

function M.scaled_circuit_connector(base_circuit_connector, is_full, delta)
    if is_full then return base_circuit_connector end

    local cc = table.deepcopy(base_circuit_connector)

    shift_connector_entry(cc[1], 0, delta)
    shift_connector_entry(cc[2], -delta, 0)
    shift_connector_entry(cc[3], 0, -delta)
    shift_connector_entry(cc[4], delta, 0)

    return cc
end

return M
