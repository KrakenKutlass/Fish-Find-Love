# Fish Find Love - Show Configuration
# Usage: /function ffl:config/show_config

tellraw @s {"text":"=== Fish Find Love Configuration ===","color":"gold"}

tellraw @s {"text":"","color":"white"}

execute if score #fish_breed ffl.config matches 1 run tellraw @s [{"text":"Fish Breeding:    ","color":"white"},{"text":"[ENABLED]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function ffl:config/toggle_fish_breeding"},"hoverEvent":{"action":"show_text","value":"Click to toggle"}}]
execute if score #fish_breed ffl.config matches 0 run tellraw @s [{"text":"Fish Breeding:    ","color":"white"},{"text":"[DISABLED]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function ffl:config/toggle_fish_breeding"},"hoverEvent":{"action":"show_text","value":"Click to toggle"}}]

execute if score #dolphins_breed ffl.config matches 1 run tellraw @s [{"text":"Dolphin Breeding: ","color":"white"},{"text":"[ENABLED]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function ffl:config/toggle_dolphin_breeding"},"hoverEvent":{"action":"show_text","value":"Click to toggle"}}]
execute if score #dolphins_breed ffl.config matches 0 run tellraw @s [{"text":"Dolphin Breeding: ","color":"white"},{"text":"[DISABLED]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function ffl:config/toggle_dolphin_breeding"},"hoverEvent":{"action":"show_text","value":"Click to toggle"}}]

execute if score #squids_breed ffl.config matches 1 run tellraw @s [{"text":"Squid Breeding:   ","color":"white"},{"text":"[ENABLED]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function ffl:config/toggle_squid_breeding"},"hoverEvent":{"action":"show_text","value":"Click to toggle"}}]
execute if score #squids_breed ffl.config matches 0 run tellraw @s [{"text":"Squid Breeding:   ","color":"white"},{"text":"[DISABLED]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function ffl:config/toggle_squid_breeding"},"hoverEvent":{"action":"show_text","value":"Click to toggle"}}]

tellraw @s {"text":"","color":"white"}
tellraw @s {"text":"===================================","color":"gold"}
