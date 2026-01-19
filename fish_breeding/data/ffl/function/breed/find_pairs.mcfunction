# Fish Breeding - Find Valid Pairs
# Executed as and at a kelp item entity
# Searches for valid breeding pairs within 5 blocks

# Clear any leftover parent tags
tag @e[type=#ffl:breedable_fish,distance=..5] remove ffl.parent1
tag @e[type=#ffl:breedable_fish,distance=..5] remove ffl.parent2
tag @e[type=#ffl:breedable_fish,distance=..5] remove ffl.breeding

# Check each species in sequence - only first valid pair breeds
# Cod
execute if entity @e[type=minecraft:cod,distance=..5,tag=ffl.tracked,tag=!ffl.breeding,scores={ffl.breed_cooldown=0,ffl.mature_cooldown=0},limit=2] unless entity @e[tag=ffl.kelp_used,limit=1] run function ffl:breed/breed_cod

# Salmon
execute if entity @e[type=minecraft:salmon,distance=..5,tag=ffl.tracked,tag=!ffl.breeding,scores={ffl.breed_cooldown=0,ffl.mature_cooldown=0},limit=2] unless entity @e[tag=ffl.kelp_used,limit=1] run function ffl:breed/breed_salmon

# Pufferfish
execute if entity @e[type=minecraft:pufferfish,distance=..5,tag=ffl.tracked,tag=!ffl.breeding,scores={ffl.breed_cooldown=0,ffl.mature_cooldown=0},limit=2] unless entity @e[tag=ffl.kelp_used,limit=1] run function ffl:breed/breed_pufferfish

# Tropical Fish
execute if entity @e[type=minecraft:tropical_fish,distance=..5,tag=ffl.tracked,tag=!ffl.breeding,scores={ffl.breed_cooldown=0,ffl.mature_cooldown=0},limit=2] unless entity @e[tag=ffl.kelp_used,limit=1] run function ffl:breed/breed_tropical
