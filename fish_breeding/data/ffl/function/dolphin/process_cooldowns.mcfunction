# Dolphin Breeding - Process Cooldowns
# Decrements active breeding cooldown timers for all tracked dolphins

# Only process if dolphin breeding is enabled
execute unless score #dolphins_breed ffl.config matches 1 run return 0

# Decrement breeding cooldowns
execute as @e[type=minecraft:dolphin,tag=ffl.tracked,scores={ffl.dolphin_cd=1..}] run scoreboard players operation @s ffl.dolphin_cd -= #tick_frequency ffl.config

# Clamp negative breeding cooldowns to 0
execute as @e[type=minecraft:dolphin,scores={ffl.dolphin_cd=..-1}] run scoreboard players set @s ffl.dolphin_cd 0

# Decrement love timers
execute as @e[type=minecraft:dolphin,tag=ffl.in_love,scores={ffl.love_timer=1..}] run scoreboard players operation @s ffl.love_timer -= #tick_frequency ffl.config

# Remove love mode when timer expires
execute as @e[type=minecraft:dolphin,tag=ffl.in_love,scores={ffl.love_timer=..0}] run tag @s remove ffl.in_love
execute as @e[type=minecraft:dolphin,scores={ffl.love_timer=..-1}] run scoreboard players set @s ffl.love_timer 0
