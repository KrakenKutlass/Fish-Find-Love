# Dolphin Breeding - Breed from Love Mode
# Executed as and at a dolphin in love mode that found a partner

# Tag this dolphin as parent1 and breeding
tag @s add ffl.parent1
tag @s add ffl.breeding

# Find and tag the nearest other love-mode dolphin as parent2
execute as @e[type=minecraft:dolphin,tag=ffl.in_love,tag=!ffl.breeding,distance=0.1..3,limit=1,sort=nearest] run tag @s add ffl.parent2
execute as @e[tag=ffl.parent2] run tag @s add ffl.breeding

# Only proceed if we have both parents
execute unless entity @e[tag=ffl.parent2,limit=1] run tag @s remove ffl.breeding
execute unless entity @e[tag=ffl.parent2,limit=1] run tag @s remove ffl.parent1
execute unless entity @e[tag=ffl.parent2,limit=1] run return 0

# Spawn baby dolphin between the two parents
execute at @s positioned ~0.5 ~ ~0.5 run summon minecraft:dolphin ~ ~ ~ {Age:-24000,Tags:["ffl.tracked","ffl.newborn"]}

# Initialize baby
execute as @e[type=minecraft:dolphin,tag=ffl.newborn,limit=1] run scoreboard players set @s ffl.dolphin_cd 0
execute as @e[type=minecraft:dolphin,tag=ffl.newborn,limit=1] run tag @s remove ffl.newborn

# Apply breeding cooldown to both parents (5 minutes = 6000 ticks)
execute as @e[tag=ffl.parent1] run scoreboard players operation @s ffl.dolphin_cd = #dolphin_breed_cooldown ffl.config
execute as @e[tag=ffl.parent2] run scoreboard players operation @s ffl.dolphin_cd = #dolphin_breed_cooldown ffl.config

# Remove love mode from both parents
tag @e[tag=ffl.parent1] remove ffl.in_love
tag @e[tag=ffl.parent2] remove ffl.in_love
scoreboard players set @e[tag=ffl.parent1] ffl.love_timer 0
scoreboard players set @e[tag=ffl.parent2] ffl.love_timer 0

# Spawn heart particles at both parents
execute at @e[tag=ffl.parent1] run particle heart ~ ~0.5 ~ 0.2 0.2 0.2 0 10
execute at @e[tag=ffl.parent2] run particle heart ~ ~0.5 ~ 0.2 0.2 0.2 0 10

# Play breeding sound
playsound minecraft:entity.dolphin.eat neutral @a ~ ~ ~ 1.0 1.2

# Spawn XP orbs
summon experience_orb ~ ~ ~ {Value:1}
execute store result score #random ffl.temp run random value 1..100
execute if score #random ffl.temp matches 1..50 run summon experience_orb ~ ~ ~ {Value:1}
execute if score #random ffl.temp matches 1..33 run summon experience_orb ~ ~ ~ {Value:1}

# Clean up parent tags
tag @e[tag=ffl.parent1] remove ffl.parent1
tag @e[tag=ffl.parent2] remove ffl.parent2
tag @e[tag=ffl.breeding] remove ffl.breeding
