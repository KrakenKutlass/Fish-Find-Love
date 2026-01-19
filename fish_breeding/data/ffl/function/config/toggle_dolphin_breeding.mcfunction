# Dolphin Breeding - Toggle Dolphin Breeding
# Usage: /function ffl:config/toggle_dolphin_breeding
# Toggles the dolphin breeding system on/off

# Store current state
execute store result score #temp ffl.temp run scoreboard players get #dolphins_breed ffl.config

# If currently disabled (0), enable it (set to 1)
execute if score #temp ffl.temp matches 0 run scoreboard players set #dolphins_breed ffl.config 1
execute if score #temp ffl.temp matches 0 run tellraw @s [{"text":"Dolphin breeding ","color":"green"},{"text":"enabled","color":"yellow","bold":true}]

# If currently enabled (1), disable it (set to 0)
execute if score #temp ffl.temp matches 1 run scoreboard players set #dolphins_breed ffl.config 0
execute if score #temp ffl.temp matches 1 run tellraw @s [{"text":"Dolphin breeding ","color":"red"},{"text":"disabled","color":"yellow","bold":true}]
