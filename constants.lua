MOD_NAME = "IR3_Assets_extended"
MOD_PATH = "__" .. MOD_NAME .. "__"

STATUS_COLORS = {
    disabled = { a = 1, b = 0.25, g = 0.25, r = 1 },
    full_output = { a = 1, b = 0.25, g = 0.625, r = 1 },
    idle = { a = 1, b = 1, g = 0.625, r = 0.25 },
    insufficient_input = { a = 1, b = 0.25, g = 0.625, r = 1 },
    low_power = { a = 1, b = 0.25, g = 0.25, r = 1 },
    no_minable_resources = { a = 1, b = 1, g = 0.625, r = 0.25 },
    no_power = { 0, 0, 0, 0 },
    working = { a = 1, b = 0.25, g = 1, r = 0.25 }
}

TINT_LEAD = { r = 0.7, g = 0.7, b = 0.7, a = 1 }
TINT_ZINC = { r = 0.6, g = 0.6, b = 0.8, a = 1 }

DEFAULT_RECIPE_TINT = {
    primary    = { r = 1, g = 0, b = 0, a = 1 },
    secondary  = { r = 1, g = 0, b = 0, a = 1 },
    tertiary   = { r = 0.75, g = 0, b = 0, a = 1 },
    quaternary = { r = 1, g = 0.5, b = 0.5, a = 1 }
}

PIPE_COVERS_IRON = {
    north = {
        layers = {
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-iron-cn.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 0, 1 },
                width = 180
            },
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-cn.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 0, 1 },
                width = 180,
                draw_as_shadow = true
            }
        }
    },
    east = {
        layers = {
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-iron-ce.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { -1, 0 },
                width = 180
            },
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-ce.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { -1, 0 },
                width = 180,
                draw_as_shadow = true
            }
        }
    },
    south = {
        layers = {
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-iron-cs.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 0, -1 },
                width = 180
            },
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-cs.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 0, -1 },
                width = 180,
                draw_as_shadow = true
            }
        }
    },
    west = {
        layers = {
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-iron-cw.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 1, 0 },
                width = 180
            },
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-cw.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 1, 0 },
                width = 180,
                draw_as_shadow = true
            }
        }
    }
}

PIPE_COVERS_COPPER = {
    north = {
        layers = {
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-copper-cn.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 0, 1 },
                width = 180
            },
            {
                draw_as_shadow = true,
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-cn.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 0, 1 },
                width = 180
            }
        }
    },
    east = {
        layers = {
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-copper-ce.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { -1, 0 },
                width = 180
            },
            {
                draw_as_shadow = true,
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-ce.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { -1, 0 },
                width = 180
            }
        }
    },
    south = {
        layers = {
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-copper-cs.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 0, -1 },
                width = 180
            },
            {
                draw_as_shadow = true,
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-cs.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 0, -1 },
                width = 180
            }
        }
    },
    west = {
        layers = {
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-copper-cw.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 1, 0 },
                width = 180
            },
            {
                draw_as_shadow = true,
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-cw.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 1, 0 },
                width = 180
            }
        }
    }
}

PIPE_COVERS_STEAM = {
    north = {
        layers = {
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-steam-cn.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 0, 1 },
                width = 180
            },
            {
                draw_as_shadow = true,
                filename =
                "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-steam-shadow-cn.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 0, 1 },
                width = 180
            }
        }
    },
    east = {
        layers = {
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-steam-ce.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { -1, 0 },
                width = 180
            },
            {
                draw_as_shadow = true,
                filename =
                "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-steam-shadow-ce.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { -1, 0 },
                width = 180
            }
        }
    },
    south = {
        layers = {
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-steam-cs.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 0, -1 },
                width = 180
            },
            {
                draw_as_shadow = true,
                filename =
                "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-steam-shadow-cs.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 0, -1 },
                width = 180
            }
        }
    },
    west = {
        layers = {
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-steam-cw.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 1, 0 },
                width = 180
            },
            {
                draw_as_shadow = true,
                filename =
                "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-steam-shadow-cw.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 1, 0 },
                width = 180
            }
        }
    }
}

PIPE_COVERS_AIR = {
    north = {
        layers = {
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-air-cn.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 0, 1 },
                width = 180
            },
            {
                draw_as_shadow = true,
                filename =
                "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-steam-shadow-cn.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 0, 1 },
                width = 180
            }
        }
    },
    east = {
        layers = {
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-air-ce.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { -1, 0 },
                width = 180
            },
            {
                draw_as_shadow = true,
                filename =
                "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-steam-shadow-ce.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { -1, 0 },
                width = 180
            }
        }
    },
    south = {
        layers = {
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-air-cs.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 0, -1 },
                width = 180
            },
            {
                draw_as_shadow = true,
                filename =
                "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-steam-shadow-cs.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 0, -1 },
                width = 180
            }
        }
    },
    west = {
        layers = {
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-air-cw.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 1, 0 },
                width = 180
            },
            {
                draw_as_shadow = true,
                filename =
                "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-steam-shadow-cw.png",
                height = 120,
                priority = "extra-high",
                scale = 0.5,
                shift = { 1, 0 },
                width = 180
            }
        }
    }
}

PIPE_PICTURES_STEAM_SMALL = {
    north = {
        filename =
        "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/small-assembler-pipe-pictures-steam.png",
        frame_count = 4,
        height = 128,
        line_length = 4,
        priority = "high",
        scale = 0.5,
        shift = { 0, 1 },
        width = 128,
        x = 0,
        y = 0
    },
    east = {
        filename =
        "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/small-assembler-pipe-pictures-steam.png",
        frame_count = 4,
        height = 128,
        line_length = 4,
        priority = "high",
        scale = 0.5,
        shift = { -1, 0 },
        width = 128,
        x = 128,
        y = 0
    },
    south = {
        filename =
        "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/small-assembler-pipe-pictures-steam.png",
        frame_count = 4,
        height = 128,
        line_length = 4,
        priority = "high",
        scale = 0.5,
        shift = { 0, -1 },
        width = 128,
        x = 256,
        y = 0
    },
    west = {
        filename =
        "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/small-assembler-pipe-pictures-steam.png",
        frame_count = 4,
        height = 128,
        line_length = 4,
        priority = "high",
        scale = 0.5,
        shift = { 1, 0 },
        width = 128,
        x = 384,
        y = 0
    }
}

PIPE_PICTURES_STEAM_DRILL = {
    north = {
        layers = {
            {
                draw_as_glow = false,
                draw_as_light = false,
                draw_as_shadow = false,
                filename =
                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/steam-drill-connectors-base.png",
                height = 120,
                priority = "high",
                scale = 0.5,
                shift = { 0.3125, 0.9375 },
                width = 120,
                x = 152,
                y = 0
            },
            {
                draw_as_glow = false,
                draw_as_light = false,
                draw_as_shadow = true,
                filename =
                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/steam-drill-connectors-shadow.png",
                height = 120,
                priority = "high",
                scale = 0.5,
                shift = { 0.5, 0.9375 },
                width = 120,
                x = 132,
                y = 0
            }
        }
    },
    east = {
        layers = {
            {
                draw_as_glow = false,
                draw_as_light = false,
                draw_as_shadow = false,
                filename =
                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/steam-drill-connectors-base.png",
                height = 80,
                priority = "high",
                scale = 0.5,
                shift = { -1.25, 0 },
                width = 160,
                x = 224,
                y = 152
            },
            {
                draw_as_glow = false,
                draw_as_light = false,
                draw_as_shadow = true,
                filename =
                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/steam-drill-connectors-shadow.png",
                height = 80,
                priority = "high",
                scale = 0.5,
                shift = { -0.75, 0 },
                width = 160,
                x = 224,
                y = 152
            }
        }
    },
    south = {
        layers = {
            {
                draw_as_glow = false,
                draw_as_light = false,
                draw_as_shadow = false,
                filename =
                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/steam-drill-connectors-base.png",
                height = 120,
                priority = "high",
                scale = 0.5,
                shift = { 0.3125, -0.9375 },
                width = 120,
                x = 152,
                y = 264
            },
            {
                draw_as_glow = false,
                draw_as_light = false,
                draw_as_shadow = true,
                filename =
                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/steam-drill-connectors-shadow.png",
                height = 120,
                priority = "high",
                scale = 0.5,
                shift = { 0.5, -0.9375 },
                width = 120,
                x = 132,
                y = 264
            }
        }
    },
    west = {
        layers = {
            {
                draw_as_glow = false,
                draw_as_light = false,
                draw_as_shadow = false,
                filename =
                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/steam-drill-connectors-base.png",
                height = 80,
                priority = "high",
                scale = 0.5,
                shift = { 1.25, 0 },
                width = 160,
                x = 0,
                y = 152
            },
            {
                draw_as_glow = false,
                draw_as_light = false,
                draw_as_shadow = true,
                filename =
                "__IndustrialRevolution3Assets4__/graphics/entities/machines/drills/steam-drill-connectors-shadow.png",
                height = 80,
                priority = "high",
                scale = 0.5,
                shift = { 1.75, 0 },
                width = 160,
                x = 0,
                y = 152
            }
        }
    }
}

PIPE_PICTURES_STEAM = {
    north = {
        filename =
        "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/standard-pipe-pictures-steam-north.png",
        height = 238,
        priority = "high",
        scale = 0.5,
        shift = { 0, 2 },
        width = 238,
    },
    east = {
        filename =
        "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/standard-pipe-pictures-steam-east.png",
        height = 238,
        priority = "high",
        scale = 0.5,
        shift = { -2, 0 },
        width = 238,
    },
    south = {
        layers = {
            {
                filename =
                "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/standard-pipe-pictures-steam-south.png",
                height = 238,
                priority = "high",
                scale = 0.5,
                shift = { 0, -2 },
                width = 238,
            },
            {
                draw_as_shadow = true,
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-steam-shadow-v.png",
                height = 120,
                priority = "high",
                scale = 0.5,
                shift = { 0, -1 },
                width = 180,
            }
        }
    },
    west = {
        filename =
        "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/standard-pipe-pictures-steam-west.png",
        height = 238,
        priority = "high",
        scale = 0.5,
        shift = { 2, 0 },
        width = 238,
    }
}

PIPE_PICTURES_COPPER = {
    east = {
        filename =
        "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/standard-pipe-pictures-copper-east.png",
        height = 238,
        priority = "high",
        scale = 0.5,
        shift = { -2, 0 },
        width = 238,
    },
    north = {
        filename =
        "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/standard-pipe-pictures-copper-north.png",
        height = 238,
        priority = "high",
        scale = 0.5,
        shift = { 0, 2 },
        width = 238,
    },
    south = {
        layers = {
            {
                filename =
                "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/standard-pipe-pictures-copper-south.png",
                height = 238,
                priority = "high",
                scale = 0.5,
                shift = { 0, -2 },
                width = 238,
            },
            {
                draw_as_shadow = true,
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-v.png",
                height = 120,
                priority = "high",
                scale = 0.5,
                shift = { 0, -1 },
                width = 180,
            }
        }
    },
    west = {
        filename =
        "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/standard-pipe-pictures-copper-west.png",
        height = 238,
        priority = "high",
        scale = 0.5,
        shift = { 2, 0 },
        width = 238,
    }
}

PIPE_PICTURES_IRON = {
    north = {
        filename =
        "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/standard-pipe-pictures-iron-north.png",
        height = 238,
        width = 238,
        scale = 0.5,
        shift = { 0, 2 },
        priority = "high",
    },

    east  = {
        filename =
        "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/standard-pipe-pictures-iron-east.png",
        height = 238,
        width = 238,
        scale = 0.5,
        shift = { -2, 0 },
        priority = "high",
    },

    south = {
        layers = {
            {
                filename =
                "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/standard-pipe-pictures-iron-south.png",
                height = 238,
                width = 238,
                scale = 0.5,
                shift = { 0, -2 },
                priority = "high",
            },
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-v.png",
                height = 120,
                width = 180,
                scale = 0.5,
                shift = { 0, -1 },
                priority = "high",
                draw_as_shadow = true,
            }
        }
    },

    west  = {
        filename =
        "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/standard-pipe-pictures-iron-west.png",
        height = 238,
        width = 238,
        scale = 0.5,
        shift = { 2, 0 },
        priority = "high",
    }
}

PIPE_PICTURES_STEEL = {
    north = {
        filename =
        "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/standard-pipe-pictures-steel-north.png",
        height = 238,
        width = 238,
        scale = 0.5,
        shift = { 0, 2 },
        priority = "high",
    },

    east  = {
        filename =
        "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/standard-pipe-pictures-steel-east.png",
        height = 238,
        width = 238,
        scale = 0.5,
        shift = { -2, 0 },
        priority = "high",
    },

    south = {
        layers = {
            {
                filename =
                "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/standard-pipe-pictures-steel-south.png",
                height = 238,
                width = 238,
                scale = 0.5,
                shift = { 0, -2 },
                priority = "high",
            },
            {
                filename = "__IndustrialRevolution3Assets2__/graphics/entities/pipes/pipe-shadow-v.png",
                height = 120,
                width = 180,
                scale = 0.5,
                shift = { 0, -1 },
                priority = "high",
                draw_as_shadow = true,
            }
        }
    },

    west  = {
        filename =
        "__IndustrialRevolution3Assets1__/graphics/entities/machines/assemblers/standard-pipe-pictures-steel-west.png",
        height = 238,
        width = 238,
        scale = 0.5,
        shift = { 2, 0 },
        priority = "high",
    }
}
