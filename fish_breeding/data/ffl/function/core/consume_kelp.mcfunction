# Fish Breeding - Consume One Kelp from Stack
# Decrements kelp count by 1, or removes item if only 1 remains

# Store current count in score
execute store result score #kelp_count ffl.temp run data get entity @s Item.count

# Subtract 1
scoreboard players remove #kelp_count ffl.temp 1

# If count is now 0 or less, kill the item
execute if score #kelp_count ffl.temp matches ..0 run kill @s

# If count is still positive, update the item's count
execute if score #kelp_count ffl.temp matches 1.. store result entity @s Item.count int 1 run scoreboard players get #kelp_count ffl.temp

# Remove the used tag (item is now processed)
tag @s remove ffl.kelp_used
