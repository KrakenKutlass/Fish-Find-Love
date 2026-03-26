# Squid Breeding - Breed from Love Mode
# Executed as and at a squid/glow squid in love mode that found a partner

# Tag this entity as parent1 and breeding
tag @s add ffl.parent1
tag @s add ffl.breeding

# Find and tag the nearest other love-mode entity of the same type as parent2
execute if entity @s[type=minecraft:squid] as @e[type=minecraft:squid,tag=ffl.squid_love,tag=!ffl.breeding,distance=0.1..3,limit=1,sort=nearest] run tag @s add ffl.parent2
execute if entity @s[type=minecraft:glow_squid] as @e[type=minecraft:glow_squid,tag=ffl.squid_love,tag=!ffl.breeding,distance=0.1..3,limit=1,sort=nearest] run tag @s add ffl.parent2
execute as @e[tag=ffl.parent2] run tag @s add ffl.breeding

# Only proceed if we have both parents
execute unless entity @e[tag=ffl.parent2,limit=1] run tag @s remove ffl.breeding
execute unless entity @e[tag=ffl.parent2,limit=1] run tag @s remove ffl.parent1
execute unless entity @e[tag=ffl.parent2,limit=1] run return 0

# Spawn baby of the correct type
execute if entity @s[type=minecraft:squid] at @s run summon minecraft:squid ~ ~ ~ {Age:-24000,Tags:["ffl.tracked","ffl.newborn"]}
execute if entity @s[type=minecraft:glow_squid] at @s run summon minecraft:glow_squid ~ ~ ~ {Age:-24000,Tags:["ffl.tracked","ffl.newborn"]}

# Initialize baby
execute as @e[tag=ffl.newborn,limit=1] run scoreboard players set @s ffl.squid_cd 0
execute as @e[tag=ffl.newborn,limit=1] run scoreboard players set @s ffl.squid_timer 0
execute as @e[tag=ffl.newborn,limit=1] run tag @s remove ffl.newborn

# Apply breeding cooldown to both parents
execute as @e[tag=ffl.parent1] run scoreboard players operation @s ffl.squid_cd = #squid_breed_cooldown ffl.config
execute as @e[tag=ffl.parent2] run scoreboard players operation @s ffl.squid_cd = #squid_breed_cooldown ffl.config

# Remove love mode from both parents
tag @e[tag=ffl.parent1] remove ffl.squid_love
tag @e[tag=ffl.parent2] remove ffl.squid_love
scoreboard players set @e[tag=ffl.parent1] ffl.squid_timer 0
scoreboard players set @e[tag=ffl.parent2] ffl.squid_timer 0

# Spawn heart particles at both parents
execute at @e[tag=ffl.parent1] run particle heart ~ ~0.5 ~ 0.2 0.2 0.2 0 10
execute at @e[tag=ffl.parent2] run particle heart ~ ~0.5 ~ 0.2 0.2 0.2 0 10

# Play breeding sound (type-specific)
execute if entity @e[tag=ffl.parent1,type=minecraft:squid,limit=1] run playsound minecraft:entity.squid.squirt neutral @a ~ ~ ~ 1.0 1.2
execute if entity @e[tag=ffl.parent1,type=minecraft:glow_squid,limit=1] run playsound minecraft:entity.glow_squid.squirt neutral @a ~ ~ ~ 1.0 1.2

# Spawn XP orbs
summon experience_orb ~ ~ ~ {Value:1}
execute store result score #random ffl.temp run random value 1..100
execute if score #random ffl.temp matches 1..50 run summon experience_orb ~ ~ ~ {Value:1}
execute if score #random ffl.temp matches 1..33 run summon experience_orb ~ ~ ~ {Value:1}

# Clean up parent tags
tag @e[tag=ffl.parent1] remove ffl.parent1
tag @e[tag=ffl.parent2] remove ffl.parent2
tag @e[tag=ffl.breeding] remove ffl.breeding
