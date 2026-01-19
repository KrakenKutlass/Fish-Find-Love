# Dolphin Breeding - Toggle and Show Config
# Toggles dolphin breeding and immediately displays updated config

# Store current state
execute store result score #temp fb.temp run scoreboard players get #dolphins_breed fb.config

# Toggle the value
execute if score #temp fb.temp matches 0 run scoreboard players set #dolphins_breed fb.config 1
execute if score #temp fb.temp matches 1 run scoreboard players set #dolphins_breed fb.config 0

# Show updated config
function fshb:config/show_config
