# Squid Breeding - Process Cooldowns
# Decrements active breeding cooldown timers for all tracked squids and glow squids

# Only process if squid breeding is enabled
execute unless score #squids_breed ffl.config matches 1 run return 0

# Decrement breeding cooldowns (both types share the same scoreboard, no collision)
execute as @e[type=minecraft:squid,tag=ffl.tracked,scores={ffl.squid_cd=1..}] run scoreboard players operation @s ffl.squid_cd -= #tick_frequency ffl.config
execute as @e[type=minecraft:glow_squid,tag=ffl.tracked,scores={ffl.squid_cd=1..}] run scoreboard players operation @s ffl.squid_cd -= #tick_frequency ffl.config

# Clamp negative breeding cooldowns to 0
execute as @e[type=minecraft:squid,scores={ffl.squid_cd=..-1}] run scoreboard players set @s ffl.squid_cd 0
execute as @e[type=minecraft:glow_squid,scores={ffl.squid_cd=..-1}] run scoreboard players set @s ffl.squid_cd 0

# Decrement love timers
execute as @e[type=minecraft:squid,tag=ffl.squid_love,scores={ffl.squid_timer=1..}] run scoreboard players operation @s ffl.squid_timer -= #tick_frequency ffl.config
execute as @e[type=minecraft:glow_squid,tag=ffl.squid_love,scores={ffl.squid_timer=1..}] run scoreboard players operation @s ffl.squid_timer -= #tick_frequency ffl.config

# Remove love mode when timer expires
execute as @e[type=minecraft:squid,tag=ffl.squid_love,scores={ffl.squid_timer=..0}] run tag @s remove ffl.squid_love
execute as @e[type=minecraft:glow_squid,tag=ffl.squid_love,scores={ffl.squid_timer=..0}] run tag @s remove ffl.squid_love
execute as @e[type=minecraft:squid,scores={ffl.squid_timer=..-1}] run scoreboard players set @s ffl.squid_timer 0
execute as @e[type=minecraft:glow_squid,scores={ffl.squid_timer=..-1}] run scoreboard players set @s ffl.squid_timer 0
