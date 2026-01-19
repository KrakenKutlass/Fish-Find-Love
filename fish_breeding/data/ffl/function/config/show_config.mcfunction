# Fish Breeding - Show Configuration
# Usage: /function ffl:config/show_config
# Displays current configuration values in chat

tellraw @s {"text":"=== Fish Breeding Configuration ===","color":"gold"}

tellraw @s {"text":"","color":"white"}

# Display fish breeding status (clickable to toggle - OP only)
execute if score #fish_breed ffl.config matches 1 run tellraw @s [{"text":"Fish Breeding: ","color":"white"},{"text":"[ENABLED]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function ffl:config/toggle_fish_and_show"},"hoverEvent":{"action":"show_text","value":"Click to toggle"}}]
execute if score #fish_breed ffl.config matches 0 run tellraw @s [{"text":"Fish Breeding: ","color":"white"},{"text":"[DISABLED]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function ffl:config/toggle_fish_and_show"},"hoverEvent":{"action":"show_text","value":"Click to toggle"}}]

tellraw @s {"text":"","color":"white"}

# Display breeding cooldown
execute store result storage ffl:display breed_cooldown int 1 run scoreboard players get #breed_cooldown ffl.config
tellraw @s [{"text":"Breeding Cooldown: ","color":"white"},{"score":{"name":"#breed_cooldown","objective":"ffl.config"},"color":"yellow"},{"text":" ticks","color":"gray"}]

# Display maturation cooldown
execute store result storage ffl:display mature_cooldown int 1 run scoreboard players get #mature_cooldown ffl.config
tellraw @s [{"text":"Maturation Cooldown: ","color":"white"},{"score":{"name":"#mature_cooldown","objective":"ffl.config"},"color":"yellow"},{"text":" ticks","color":"gray"}]

# Display tick frequency
execute store result storage ffl:display tick_frequency int 1 run scoreboard players get #tick_frequency ffl.config
tellraw @s [{"text":"Tick Frequency: ","color":"white"},{"score":{"name":"#tick_frequency","objective":"ffl.config"},"color":"yellow"},{"text":" ticks","color":"gray"}]

tellraw @s {"text":"","color":"white"}

# Display dolphin breeding status (clickable to toggle - OP only)
execute if score #dolphins_breed ffl.config matches 1 run tellraw @s [{"text":"Dolphin Breeding: ","color":"white"},{"text":"[ENABLED]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function ffl:config/toggle_and_show"},"hoverEvent":{"action":"show_text","value":"Click to toggle"}}]
execute if score #dolphins_breed ffl.config matches 0 run tellraw @s [{"text":"Dolphin Breeding: ","color":"white"},{"text":"[DISABLED]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/function ffl:config/toggle_and_show"},"hoverEvent":{"action":"show_text","value":"Click to toggle"}}]

# Display dolphin breeding cooldown (if enabled)
execute if score #dolphins_breed ffl.config matches 1 store result storage ffl:display dolphin_breed_cooldown int 1 run scoreboard players get #dolphin_breed_cooldown ffl.config
execute if score #dolphins_breed ffl.config matches 1 run tellraw @s [{"text":"Dolphin Breed Cooldown: ","color":"white"},{"score":{"name":"#dolphin_breed_cooldown","objective":"ffl.config"},"color":"yellow"},{"text":" ticks","color":"gray"}]

tellraw @s {"text":"===================================","color":"gold"}
