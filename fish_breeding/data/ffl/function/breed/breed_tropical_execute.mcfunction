# Fish Breeding - Execute Tropical Fish Breeding
# Spawns offspring with variant inheritance and applies effects

# Tag the first eligible tropical fish as parent1
execute as @e[type=minecraft:tropical_fish,distance=..5,tag=ffl.tracked,tag=!ffl.breeding,scores={ffl.breed_cooldown=0,ffl.mature_cooldown=0},limit=1,sort=nearest] run tag @s add ffl.parent1
execute as @e[tag=ffl.parent1] run tag @s add ffl.breeding

# Tag the second eligible tropical fish as parent2
execute as @e[type=minecraft:tropical_fish,distance=..5,tag=ffl.tracked,tag=!ffl.breeding,scores={ffl.breed_cooldown=0,ffl.mature_cooldown=0},limit=1,sort=nearest] run tag @s add ffl.parent2
execute as @e[tag=ffl.parent2] run tag @s add ffl.breeding

# Determine variant inheritance (80% parent, 20% random)
execute store result score #random ffl.temp run random value 1..100

# 80% chance to inherit from a parent
execute if score #random ffl.temp matches 1..80 run function ffl:tropical/inherit_variant

# 20% chance for random variant
execute if score #random ffl.temp matches 81..100 run function ffl:tropical/random_variant

# Set maturation cooldown on offspring
execute as @e[type=minecraft:tropical_fish,tag=ffl.newborn,limit=1] run scoreboard players operation @s ffl.mature_cooldown = #mature_cooldown ffl.config
execute as @e[type=minecraft:tropical_fish,tag=ffl.newborn,limit=1] run scoreboard players set @s ffl.breed_cooldown 0
tag @e[tag=ffl.newborn] remove ffl.newborn

# Apply breeding cooldown to parents
execute as @e[tag=ffl.parent1] run scoreboard players operation @s ffl.breed_cooldown = #breed_cooldown ffl.config
execute as @e[tag=ffl.parent2] run scoreboard players operation @s ffl.breed_cooldown = #breed_cooldown ffl.config

# Spawn heart particles at parent locations
execute at @e[tag=ffl.parent1] run particle heart ~ ~0.5 ~ 0.2 0.2 0.2 0 5
execute at @e[tag=ffl.parent2] run particle heart ~ ~0.5 ~ 0.2 0.2 0.2 0 5

# Spawn 1-3 XP orbs at kelp/offspring location
execute at @s run summon minecraft:experience_orb ~ ~ ~ {Value:1}
execute store result score #random ffl.temp run random value 1..100
execute if score #random ffl.temp matches 1..50 at @s run summon minecraft:experience_orb ~ ~ ~ {Value:1}
execute if score #random ffl.temp matches 1..33 at @s run summon minecraft:experience_orb ~ ~ ~ {Value:1}

# Mark kelp as used
tag @s add ffl.kelp_used

# Clean up parent tags
tag @e[tag=ffl.parent1] remove ffl.parent1
tag @e[tag=ffl.parent2] remove ffl.parent2
tag @e[tag=ffl.breeding] remove ffl.breeding
