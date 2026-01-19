# Dolphin Breeding - Enable Dolphin Breeding
# Usage: /function ffl:config/enable_dolphin_breeding
# Enables the dolphin breeding system

scoreboard players set #dolphins_breed ffl.config 1
tellraw @s [{"text":"Dolphin breeding ","color":"green"},{"text":"enabled","color":"yellow","bold":true}]
