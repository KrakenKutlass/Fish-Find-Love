# Dolphin Breeding - Execute Dolphin Breeding
# Spawns baby dolphin and applies effects

tellraw @a [{"text":"[DEBUG] breed_dolphin_execute called","color":"green"}]

# Tag the first eligible dolphin as parent1
# Age check: Only select dolphins with Age >= 0 (adults)
execute as @e[type=minecraft:dolphin,distance=..5,tag=db.tracked,tag=!db.breeding,scores={db.breed_cooldown=0},limit=1,sort=nearest] run tellraw @a [{"text":"[DEBUG] Checking first dolphin Age","color":"white"}]
execute as @e[type=minecraft:dolphin,distance=..5,tag=db.tracked,tag=!db.breeding,scores={db.breed_cooldown=0},limit=1,sort=nearest] if data entity @s {Age:0} run tag @s add db.parent1
execute as @e[type=minecraft:dolphin,distance=..5,tag=db.tracked,tag=!db.breeding,scores={db.breed_cooldown=0},limit=1,sort=nearest] if data entity @s {Age:0} run tellraw @a [{"text":"[DEBUG] Parent1 tagged","color":"green"}]
execute as @e[tag=db.parent1] run tag @s add db.breeding

# Tag the second eligible dolphin as parent2
# Age check: Only select dolphins with Age >= 0 (adults)
execute as @e[type=minecraft:dolphin,distance=..5,tag=db.tracked,tag=!db.breeding,scores={db.breed_cooldown=0},limit=1,sort=nearest] run tellraw @a [{"text":"[DEBUG] Checking second dolphin Age","color":"white"}]
execute as @e[type=minecraft:dolphin,distance=..5,tag=db.tracked,tag=!db.breeding,scores={db.breed_cooldown=0},limit=1,sort=nearest] if data entity @s {Age:0} run tag @s add db.parent2
execute as @e[type=minecraft:dolphin,distance=..5,tag=db.tracked,tag=!db.breeding,scores={db.breed_cooldown=0},limit=1,sort=nearest] if data entity @s {Age:0} run tellraw @a [{"text":"[DEBUG] Parent2 tagged","color":"green"}]
execute as @e[tag=db.parent2] run tag @s add db.breeding

# Check if we have both parents
execute store result score #parent_count fb.temp if entity @e[tag=db.breeding]
tellraw @a [{"text":"[DEBUG] Parents selected: ","color":"white"},{"score":{"name":"#parent_count","objective":"fb.temp"},"color":"gold"}]

# Spawn baby dolphin at center of block to avoid suffocation
# Baby dolphins use vanilla Age mechanics (Age:-24000 means 20 minutes to grow)
execute at @s align xyz run summon minecraft:dolphin ~0.5 ~0.5 ~0.5 {Age:-24000,Tags:["db.tracked","db.newborn"]}

# Set breeding cooldown to 0 on baby (babies are exempt from breeding via Age check)
execute as @e[type=minecraft:dolphin,tag=db.newborn,limit=1] run scoreboard players set @s db.breed_cooldown 0
tag @e[tag=db.newborn] remove db.newborn

# Apply breeding cooldown to parents (5 minutes = 6000 ticks)
execute as @e[tag=db.parent1] run scoreboard players operation @s db.breed_cooldown = #dolphin_breed_cooldown fb.config
execute as @e[tag=db.parent2] run scoreboard players operation @s db.breed_cooldown = #dolphin_breed_cooldown fb.config

# Spawn heart particles at parent locations
execute at @e[tag=db.parent1] run particle heart ~ ~0.5 ~ 0.2 0.2 0.2 0 5
execute at @e[tag=db.parent2] run particle heart ~ ~0.5 ~ 0.2 0.2 0.2 0 5

# Play breeding sound
execute at @s run playsound minecraft:entity.dolphin.eat neutral @a ~ ~ ~ 1.0 1.2

# Spawn 1-3 XP orbs at tropical fish/offspring location
execute at @s run summon minecraft:experience_orb ~ ~ ~ {Value:1}
execute store result score #random fb.temp run random value 1..100
execute if score #random fb.temp matches 1..50 at @s run summon minecraft:experience_orb ~ ~ ~ {Value:1}
execute if score #random fb.temp matches 1..33 at @s run summon minecraft:experience_orb ~ ~ ~ {Value:1}

# Mark tropical fish as used
tag @s add db.tropical_fish_used

# Clean up parent tags
tag @e[tag=db.parent1] remove db.parent1
tag @e[tag=db.parent2] remove db.parent2
tag @e[tag=db.breeding] remove db.breeding
