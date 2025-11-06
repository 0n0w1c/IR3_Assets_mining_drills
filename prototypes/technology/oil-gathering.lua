local technology = data.raw.technology["oil-gathering"]

if technology then
  table.insert(technology.effects, { type = "unlock-recipe", recipe = "steel-derrick" })
end
