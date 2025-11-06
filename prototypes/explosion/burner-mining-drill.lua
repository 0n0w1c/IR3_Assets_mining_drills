data:extend({
    {
        name = "burner-mining-drill-explosion",
        type = "explosion",
        hidden_in_factoriopedia = true,
        animations = {
            animation_speed = 0.5,
            axially_symmetrical = false,
            direction_count = 1,
            draw_as_glow = true,
            frame_count = 57,
            height = 634,
            scale = 0.5,
            shift = { -1.40625, -2.84375 },
            stripes = {
                {
                    filename = "__base__/graphics/entity/massive-explosion/massive-explosion-1.png",
                    height_in_frames = 5,
                    width_in_frames = 6
                },
                {
                    filename = "__base__/graphics/entity/massive-explosion/massive-explosion-2.png",
                    height_in_frames = 5,
                    width_in_frames = 6
                }
            },
            width = 656
        },
        created_effect = {
            action_delivery = {
                target_effects = {
                    {
                        damage_type_filters = {
                            "fire",
                            "impact"
                        },
                        frame_speed = 1,
                        frame_speed_deviation = 0.1,
                        initial_height = 0.5,
                        initial_vertical_speed = 0.070000000000000009,
                        initial_vertical_speed_deviation = 0.1,
                        offset_deviation = {
                            { -0.5, -0.5 },
                            { 0.5,  0.5 }
                        },
                        particle_name = "trailing-copper-particle",
                        probability = 1,
                        repeat_count = 92,
                        speed_from_center = 0.1,
                        speed_from_center_deviation = 0.05,
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
                        initial_vertical_speed = 0.070000000000000009,
                        initial_vertical_speed_deviation = 0.1,
                        offset_deviation = {
                            { -0.5, -0.5 },
                            { 0.5,  0.5 }
                        },
                        particle_name = "trailing-iron-particle",
                        probability = 1,
                        repeat_count = 24,
                        speed_from_center = 0.1,
                        speed_from_center_deviation = 0.05,
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
                        initial_vertical_speed = 0.070000000000000009,
                        initial_vertical_speed_deviation = 0.1,
                        offset_deviation = {
                            { -0.5, -0.5 },
                            { 0.5,  0.5 }
                        },
                        particle_name = "trailing-wood-particle",
                        probability = 1,
                        repeat_count = 12,
                        speed_from_center = 0.1,
                        speed_from_center_deviation = 0.05,
                        type = "create-particle"
                    }
                },
                type = "instant"
            },
            type = "direct"
        },
        flags = { "not-on-map" },
        icons = {
            {
                icon = "__IndustrialRevolution3Assets1__/graphics/icons/64/burner-mining-drill.png",
                icon_mipmaps = 4,
                icon_size = 64
            },
            {
                icon = "__IndustrialRevolution3Assets1__/graphics/icons/64/heating-overlay.png",
                icon_mipmaps = 4,
                icon_size = 64,
                scale = 0.25,
                shift = { -8.5, 8.5 }
            }
        },
        localised_name = { "entity-name.burner-mining-drill" },
        sound = {
            aggregation = {
                max_count = 1,
                remove = true
            },
            audible_distance_modifier = 1.95,
            game_controller_vibration_data = {
                duration = 160,
                low_frequency_vibration_intensity = 0.9,
                play_for = "everything"
            },
            switch_vibration_data = {
                filename = "__base__/sound/fight/large-explosion.bnvib",
                gain = 0.6,
                play_for = "everything"
            },
            variations = {
                {
                    filename = "__base__/sound/fight/large-explosion-1.ogg",
                    volume = 1
                },
                {
                    filename = "__base__/sound/fight/large-explosion-2.ogg",
                    volume = 1
                }
            }
        }
    }
})
