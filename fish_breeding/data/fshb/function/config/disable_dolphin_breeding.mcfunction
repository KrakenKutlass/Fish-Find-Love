# Dolphin Breeding - Disable Dolphin Breeding
# Usage: /function fshb:config/disable_dolphin_breeding
# Disables the dolphin breeding system

scoreboard players set #dolphins_breed fb.config 0
tellraw @s [{"text":"Dolphin breeding ","color":"red"},{"text":"disabled","color":"yellow","bold":true}]
