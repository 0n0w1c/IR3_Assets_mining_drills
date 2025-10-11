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
        name = "IR3-big-drill-footprint",
        setting_type = "startup",
        allowed_values = { "5x5", "7x7" },
        default_value = "5x5",
        order = "b",
        hidden = hidden
    }
})
