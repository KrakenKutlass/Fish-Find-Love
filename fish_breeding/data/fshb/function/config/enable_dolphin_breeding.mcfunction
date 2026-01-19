# Dolphin Breeding - Enable Dolphin Breeding
# Usage: /function fshb:config/enable_dolphin_breeding
# Enables the dolphin breeding system

scoreboard players set #dolphins_breed fb.config 1
tellraw @s [{"text":"Dolphin breeding ","color":"green"},{"text":"enabled","color":"yellow","bold":true}]
