# Fish Breeding - Execute Cod Breeding
# Spawns offspring and applies effects

# Tag the first eligible cod as parent1
execute as @e[type=minecraft:cod,distance=..5,tag=ffl.tracked,tag=!ffl.breeding,scores={ffl.breed_cooldown=0,ffl.mature_cooldown=0},limit=1,sort=nearest] run tag @s add ffl.parent1
execute as @e[tag=ffl.parent1] run tag @s add ffl.breeding

# Tag the second eligible cod as parent2
execute as @e[type=minecraft:cod,distance=..5,tag=ffl.tracked,tag=!ffl.breeding,scores={ffl.breed_cooldown=0,ffl.mature_cooldown=0},limit=1,sort=nearest] run tag @s add ffl.parent2
execute as @e[tag=ffl.parent2] run tag @s add ffl.breeding

# Spawn offspring at center of block to avoid suffocation
execute at @s align xyz run summon minecraft:cod ~0.5 ~0.5 ~0.5 {Tags:["ffl.tracked","ffl.juvenile","ffl.newborn"]}

# Set maturation cooldown on offspring
execute as @e[type=minecraft:cod,tag=ffl.newborn,limit=1] run scoreboard players operation @s ffl.mature_cooldown = #mature_cooldown ffl.config
execute as @e[type=minecraft:cod,tag=ffl.newborn,limit=1] run scoreboard players set @s ffl.breed_cooldown 0
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
