# Squid Breeding - Toggle Squid Breeding
# Usage: /function ffl:config/toggle_squid_breeding

execute store result score #temp ffl.temp run scoreboard players get #squids_breed ffl.config

execute if score #temp ffl.temp matches 0 run scoreboard players set #squids_breed ffl.config 1
execute if score #temp ffl.temp matches 0 run tellraw @s [{"text":"Squid breeding ","color":"green"},{"text":"enabled","color":"yellow","bold":true}]

execute if score #temp ffl.temp matches 1 run scoreboard players set #squids_breed ffl.config 0
execute if score #temp ffl.temp matches 1 run tellraw @s [{"text":"Squid breeding ","color":"red"},{"text":"disabled","color":"yellow","bold":true}]
