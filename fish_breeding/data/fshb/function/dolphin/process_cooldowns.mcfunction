# Dolphin Breeding - Process Cooldowns
# Decrements active breeding cooldown timers for all tracked dolphins

# Only process if dolphin breeding is enabled
execute unless score #dolphins_breed fb.config matches 1 run return 0

# Decrement breeding cooldowns
execute as @e[type=minecraft:dolphin,tag=db.tracked,scores={db.breed_cooldown=1..}] run scoreboard players operation @s db.breed_cooldown -= #tick_frequency fb.config

# Clamp negative breeding cooldowns to 0
execute as @e[type=minecraft:dolphin,scores={db.breed_cooldown=..-1}] run scoreboard players set @s db.breed_cooldown 0

# Decrement love timers
execute as @e[type=minecraft:dolphin,tag=db.in_love,scores={db.love_timer=1..}] run scoreboard players operation @s db.love_timer -= #tick_frequency fb.config

# Remove love mode when timer expires
execute as @e[type=minecraft:dolphin,tag=db.in_love,scores={db.love_timer=..0}] run tag @s remove db.in_love
execute as @e[type=minecraft:dolphin,scores={db.love_timer=..-1}] run scoreboard players set @s db.love_timer 0
