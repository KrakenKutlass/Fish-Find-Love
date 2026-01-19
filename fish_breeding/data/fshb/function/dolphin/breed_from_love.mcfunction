# Dolphin Breeding - Breed from Love Mode
# Executed as and at a dolphin in love mode that found a partner

# Tag this dolphin as parent1 and breeding
tag @s add db.parent1
tag @s add db.breeding

# Find and tag the nearest other love-mode dolphin as parent2
execute as @e[type=minecraft:dolphin,tag=db.in_love,tag=!db.breeding,distance=0.1..3,limit=1,sort=nearest] run tag @s add db.parent2
execute as @e[tag=db.parent2] run tag @s add db.breeding

# Only proceed if we have both parents
execute unless entity @e[tag=db.parent2,limit=1] run tag @s remove db.breeding
execute unless entity @e[tag=db.parent2,limit=1] run tag @s remove db.parent1
execute unless entity @e[tag=db.parent2,limit=1] run return 0

# Spawn baby dolphin between the two parents
execute at @s positioned ~0.5 ~ ~0.5 run summon minecraft:dolphin ~ ~ ~ {Age:-24000,Tags:["db.tracked","db.newborn"]}

# Initialize baby
execute as @e[type=minecraft:dolphin,tag=db.newborn,limit=1] run scoreboard players set @s db.breed_cooldown 0
execute as @e[type=minecraft:dolphin,tag=db.newborn,limit=1] run tag @s remove db.newborn

# Apply breeding cooldown to both parents (5 minutes = 6000 ticks)
execute as @e[tag=db.parent1] run scoreboard players operation @s db.breed_cooldown = #dolphin_breed_cooldown fb.config
execute as @e[tag=db.parent2] run scoreboard players operation @s db.breed_cooldown = #dolphin_breed_cooldown fb.config

# Remove love mode from both parents
tag @e[tag=db.parent1] remove db.in_love
tag @e[tag=db.parent2] remove db.in_love
scoreboard players set @e[tag=db.parent1] db.love_timer 0
scoreboard players set @e[tag=db.parent2] db.love_timer 0

# Spawn heart particles at both parents
execute at @e[tag=db.parent1] run particle heart ~ ~0.5 ~ 0.2 0.2 0.2 0 10
execute at @e[tag=db.parent2] run particle heart ~ ~0.5 ~ 0.2 0.2 0.2 0 10

# Play breeding sound
playsound minecraft:entity.dolphin.eat neutral @a ~ ~ ~ 1.0 1.2

# Spawn XP orbs
summon experience_orb ~ ~ ~ {Value:1}
execute store result score #random fb.temp run random value 1..100
execute if score #random fb.temp matches 1..50 run summon experience_orb ~ ~ ~ {Value:1}
execute if score #random fb.temp matches 1..33 run summon experience_orb ~ ~ ~ {Value:1}

# Clean up parent tags
tag @e[tag=db.parent1] remove db.parent1
tag @e[tag=db.parent2] remove db.parent2
tag @e[tag=db.breeding] remove db.breeding
