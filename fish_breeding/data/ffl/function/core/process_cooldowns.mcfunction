# Fish Breeding - Process Cooldowns
# Decrements active cooldown timers for all tracked fish

# Decrement breeding cooldowns
execute as @e[type=#ffl:breedable_fish,tag=ffl.tracked,scores={ffl.breed_cooldown=1..}] run scoreboard players operation @s ffl.breed_cooldown -= #tick_frequency ffl.config

# Decrement maturation cooldowns
execute as @e[type=#ffl:breedable_fish,tag=ffl.tracked,scores={ffl.mature_cooldown=1..}] run scoreboard players operation @s ffl.mature_cooldown -= #tick_frequency ffl.config

# Clamp negative breeding cooldowns to 0
execute as @e[type=#ffl:breedable_fish,scores={ffl.breed_cooldown=..-1}] run scoreboard players set @s ffl.breed_cooldown 0

# Clamp negative maturation cooldowns to 0 and remove juvenile tag
execute as @e[type=#ffl:breedable_fish,tag=ffl.juvenile,scores={ffl.mature_cooldown=..0}] run tag @s remove ffl.juvenile
execute as @e[type=#ffl:breedable_fish,scores={ffl.mature_cooldown=..-1}] run scoreboard players set @s ffl.mature_cooldown 0
