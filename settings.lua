local hidden = true
if mods["space-age"] then
    hidden = false
end

data:extend({
    {
        type = "string-setting",
        name = "IR3-burner-drill-footprint",
        setting_type = "startup",
        allowed_values = { "2x2", "5x5" },
        default_value = "2x2",
        order = "a",
    },
    {
        type = "string-setting",
        name = "IR3-electric-drill-footprint",
        setting_type = "startup",
        allowed_values = { "3x3", "5x5" },
        default_value = "3x3",
        order = "a",
    },
    {
        type = "string-setting",
        name = "IR3-big-drill-footprint",
        setting_type = "startup",
        allowed_values = { "5x5", "7x7" },
        default_value = "5x5",
        order = "c",
        hidden = hidden
    },
    {
        type = "bool-setting",
        name = "IR3-steel-derrick",
        setting_type = "startup",
        default_value = false,
        order = "d",
    }
})
