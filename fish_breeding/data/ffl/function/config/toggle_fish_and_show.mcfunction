# Fish Breeding - Toggle and Show Config
# Toggles fish breeding and immediately displays updated config

# Store current state
execute store result score #temp ffl.temp run scoreboard players get #fish_breed ffl.config

# Toggle the value
execute if score #temp ffl.temp matches 0 run scoreboard players set #fish_breed ffl.config 1
execute if score #temp ffl.temp matches 1 run scoreboard players set #fish_breed ffl.config 0

# Show updated config
function ffl:config/show_config
