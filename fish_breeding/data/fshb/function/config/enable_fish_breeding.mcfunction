# Fish Breeding - Enable Fish Breeding
# Usage: /function fshb:config/enable_fish_breeding

scoreboard players set #fish_breed fb.config 1
tellraw @s [{"text":"Fish breeding ","color":"green"},{"text":"enabled","color":"yellow","bold":true}]
