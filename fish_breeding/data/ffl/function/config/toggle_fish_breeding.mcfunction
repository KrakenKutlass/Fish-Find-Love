execute store result score #temp ffl.temp run scoreboard players get #fish_breed ffl.config
execute if score #temp ffl.temp matches 0 run scoreboard players set #fish_breed ffl.config 1
execute if score #temp ffl.temp matches 1 run scoreboard players set #fish_breed ffl.config 0
function ffl:config/show_config
