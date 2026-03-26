# Squid Breeding - Consume One Food Item from Stack
# Decrements item count by 1, or removes item entity if only 1 remains

# Store current count in score
execute store result score #squid_food_count ffl.temp run data get entity @s Item.count

# Subtract 1
scoreboard players remove #squid_food_count ffl.temp 1

# If count is now 0 or less, kill the item entity
execute if score #squid_food_count ffl.temp matches ..0 run kill @s

# If count is still positive, update the item's count
execute if score #squid_food_count ffl.temp matches 1.. store result entity @s Item.count int 1 run scoreboard players get #squid_food_count ffl.temp

# Remove the used tag so remaining items can be processed next tick
tag @s remove ffl.squid_food_used
