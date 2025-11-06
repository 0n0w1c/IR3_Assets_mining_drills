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

local LIB = {}

local CIRCUIT_CONNECTOR_OFFSETS = {
    { variation = 4, main = { -10, -162 }, shadow = { 0, -152 } },
    { variation = 2, main = { 154, -5 },   shadow = { 164, 5 } },
    { variation = 0, main = { 10, 142 },   shadow = { 20, 152 } },
    { variation = 6, main = { -154, 5 },   shadow = { -144, 15 } },
}

function LIB.connector_vectors_for(footprint_dim)
    local offset_delta_px = ((5 - footprint_dim) / 2) * 64

    local function apply_direction_delta(dir_index, base_x, base_y)
        if dir_index == 1 then
            return base_x, base_y + offset_delta_px
        elseif dir_index == 2 then
            return base_x - offset_delta_px, base_y
        elseif dir_index == 3 then
            return base_x, base_y - offset_delta_px
        else
            return base_x + offset_delta_px, base_y
        end
    end

    local vectors = {}
    for dir_index, base in ipairs(CIRCUIT_CONNECTOR_OFFSETS) do
        local main_x, main_y     = apply_direction_delta(dir_index, base.main[1], base.main[2])
        local shadow_x, shadow_y = apply_direction_delta(dir_index, base.shadow[1], base.shadow[2])
        vectors[dir_index]       = {
            variation     = base.variation,
            main_offset   = util.by_pixel_hr(main_x, main_y),
            shadow_offset = util.by_pixel_hr(shadow_x, shadow_y),
            show_shadow   = true,
        }
    end
    return vectors
end

local function _scale_sheet(sheet, target_scale, shift_factor)
    if not sheet then return end
    if sheet.scale then sheet.scale = target_scale end
    if sheet.shift and type(sheet.shift) == "table" then
        sheet.shift = { sheet.shift[1] * shift_factor, sheet.shift[2] * shift_factor }
    end
end

function LIB.scale_animation(animation, target_scale, shift_factor)
    if not animation then return end

    if animation.layers then
        for _, layer in ipairs(animation.layers) do
            _scale_sheet(layer, target_scale, shift_factor)
        end
    else
        _scale_sheet(animation, target_scale, shift_factor)
    end
end

function LIB.scale_working_visualisation(vis, target_scale, shift_factor)
    if not vis then return end

    LIB.scale_animation(vis.animation, target_scale, shift_factor)
    LIB.scale_animation(vis.north_animation, target_scale, shift_factor)
    LIB.scale_animation(vis.east_animation, target_scale, shift_factor)
    LIB.scale_animation(vis.south_animation, target_scale, shift_factor)
    LIB.scale_animation(vis.west_animation, target_scale, shift_factor)

    if vis.light and vis.light.shift then
        local light_shift = vis.light.shift
        vis.light.shift = { light_shift[1] * shift_factor, light_shift[2] * shift_factor }
    end
end

function LIB.scale_drill_graphics(graphics_set, target_scale, shift_factor)
    local scaled = table.deepcopy(graphics_set)

    if scaled.animation then LIB.scale_animation(scaled.animation, target_scale, shift_factor) end
    if scaled.north_animation then LIB.scale_animation(scaled.north_animation, target_scale, shift_factor) end
    if scaled.east_animation then LIB.scale_animation(scaled.east_animation, target_scale, shift_factor) end
    if scaled.south_animation then LIB.scale_animation(scaled.south_animation, target_scale, shift_factor) end
    if scaled.west_animation then LIB.scale_animation(scaled.west_animation, target_scale, shift_factor) end

    if scaled.working_visualisations then
        for _, vis in ipairs(scaled.working_visualisations) do
            LIB.scale_working_visualisation(vis, target_scale, shift_factor)
        end
    end

    return scaled
end

return LIB
