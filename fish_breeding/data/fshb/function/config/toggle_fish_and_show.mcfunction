# Fish Breeding - Toggle and Show Config
# Toggles fish breeding and immediately displays updated config

# Store current state
execute store result score #temp fb.temp run scoreboard players get #fish_breed fb.config

# Toggle the value
execute if score #temp fb.temp matches 0 run scoreboard players set #fish_breed fb.config 1
execute if score #temp fb.temp matches 1 run scoreboard players set #fish_breed fb.config 0

# Show updated config
function fshb:config/show_config
