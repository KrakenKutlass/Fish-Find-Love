# Fish Breeding - Enable Fish Breeding
# Usage: /function ffl:config/enable_fish_breeding

scoreboard players set #fish_breed ffl.config 1
tellraw @s [{"text":"Fish breeding ","color":"green"},{"text":"enabled","color":"yellow","bold":true}]
