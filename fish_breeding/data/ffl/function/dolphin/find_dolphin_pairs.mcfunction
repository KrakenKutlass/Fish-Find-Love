# Dolphin Breeding - Find Valid Dolphin Pairs
# Executed as and at a tropical fish item entity
# Searches for valid breeding pairs within 5 blocks

tellraw @a [{"text":"[DEBUG] find_dolphin_pairs called at item position","color":"light_purple"}]

# Clear any leftover parent tags
tag @e[type=minecraft:dolphin,distance=..5] remove ffl.parent1
tag @e[type=minecraft:dolphin,distance=..5] remove ffl.parent2
tag @e[type=minecraft:dolphin,distance=..5] remove ffl.breeding

# Count dolphins nearby
execute store result score #nearby_dolphins ffl.temp if entity @e[type=minecraft:dolphin,distance=..5]
tellraw @a [{"text":"[DEBUG] Dolphins within 5 blocks: ","color":"white"},{"score":{"name":"#nearby_dolphins","objective":"ffl.temp"},"color":"gold"}]

# Count tracked dolphins
execute store result score #tracked_dolphins ffl.temp if entity @e[type=minecraft:dolphin,distance=..5,tag=ffl.tracked]
tellraw @a [{"text":"[DEBUG] Tracked dolphins: ","color":"white"},{"score":{"name":"#tracked_dolphins","objective":"ffl.temp"},"color":"gold"}]

# Count eligible dolphins (without age check for now)
execute store result score #eligible_dolphins ffl.temp if entity @e[type=minecraft:dolphin,distance=..5,tag=ffl.tracked,tag=!ffl.breeding,scores={ffl.dolphin_cd=0}]
tellraw @a [{"text":"[DEBUG] Eligible dolphins (no age check): ","color":"white"},{"score":{"name":"#eligible_dolphins","objective":"ffl.temp"},"color":"gold"}]

# Check if tropical fish is already used
execute if entity @e[tag=ffl.tropical_fish_used,limit=1] run tellraw @a [{"text":"[DEBUG] Tropical fish already used!","color":"red"}]
execute unless entity @e[tag=ffl.tropical_fish_used,limit=1] run tellraw @a [{"text":"[DEBUG] Tropical fish not used yet","color":"green"}]

# Check if dolphin condition passes
execute if entity @e[type=minecraft:dolphin,distance=..5,tag=ffl.tracked,tag=!ffl.breeding,scores={ffl.dolphin_cd=0},limit=2] run tellraw @a [{"text":"[DEBUG] Dolphin condition PASSED","color":"green"}]
execute unless entity @e[type=minecraft:dolphin,distance=..5,tag=ffl.tracked,tag=!ffl.breeding,scores={ffl.dolphin_cd=0},limit=2] run tellraw @a [{"text":"[DEBUG] Dolphin condition FAILED","color":"red"}]

# Check for dolphins ready to breed:
# - Must be tracked (initialized in system)
# - Must not be currently breeding (tag check)
# - Must have no breeding cooldown (score check)
# - Age check will be done inside breed_dolphin_execute
# - Need at least 2 dolphins meeting criteria
# - Only proceed if tropical fish hasn't been used yet
execute if entity @e[type=minecraft:dolphin,distance=..5,tag=ffl.tracked,tag=!ffl.breeding,scores={ffl.dolphin_cd=0},limit=2] unless entity @e[tag=ffl.tropical_fish_used,limit=1] run tellraw @a [{"text":"[DEBUG] Calling breed_dolphin","color":"green"}]
execute if entity @e[type=minecraft:dolphin,distance=..5,tag=ffl.tracked,tag=!ffl.breeding,scores={ffl.dolphin_cd=0},limit=2] unless entity @e[tag=ffl.tropical_fish_used,limit=1] run function ffl:dolphin/breed_dolphin
