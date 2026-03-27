# Fish Find Love - Show Configuration
# Usage: /function ffl:config/show_config

tellraw @s {"text":"=== Fish Find Love Configuration ===","color":"gold"}

tellraw @s {"text":"","color":"white"}

execute if score #fish_breed ffl.config matches 1 run tellraw @s [{"text":"Fish Breeding:    ","color":"white"},{"text":"[ENABLED]","color":"green","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/function ffl:config/toggle_fish_breeding"}}]
execute if score #fish_breed ffl.config matches 0 run tellraw @s [{"text":"Fish Breeding:    ","color":"white"},{"text":"[DISABLED]","color":"red","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/function ffl:config/toggle_fish_breeding"}}]

execute if score #dolphins_breed ffl.config matches 1 run tellraw @s [{"text":"Dolphin Breeding: ","color":"white"},{"text":"[ENABLED]","color":"green","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/function ffl:config/toggle_dolphin_breeding"}}]
execute if score #dolphins_breed ffl.config matches 0 run tellraw @s [{"text":"Dolphin Breeding: ","color":"white"},{"text":"[DISABLED]","color":"red","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/function ffl:config/toggle_dolphin_breeding"}}]

execute if score #squids_breed ffl.config matches 1 run tellraw @s [{"text":"Squid Breeding:   ","color":"white"},{"text":"[ENABLED]","color":"green","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/function ffl:config/toggle_squid_breeding"}}]
execute if score #squids_breed ffl.config matches 0 run tellraw @s [{"text":"Squid Breeding:   ","color":"white"},{"text":"[DISABLED]","color":"red","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/function ffl:config/toggle_squid_breeding"}}]

tellraw @s {"text":"","color":"white"}
tellraw @s {"text":"===================================","color":"gold"}
