# Fish Breeding - Disable Fish Breeding
# Usage: /function ffl:config/disable_fish_breeding

scoreboard players set #fish_breed ffl.config 0
tellraw @s [{"text":"Fish breeding ","color":"red"},{"text":"disabled","color":"yellow","bold":true}]
