# Dolphin Breeding - Consume One Tropical Fish from Stack
# Decrements tropical fish count by 1, or removes item if only 1 remains

# Store current count in score
execute store result score #tropical_fish_count ffl.temp run data get entity @s Item.count

# Subtract 1
scoreboard players remove #tropical_fish_count ffl.temp 1

# If count is now 0 or less, kill the item
execute if score #tropical_fish_count ffl.temp matches ..0 run kill @s

# If count is still positive, update the item's count
execute if score #tropical_fish_count ffl.temp matches 1.. store result entity @s Item.count int 1 run scoreboard players get #tropical_fish_count ffl.temp

# Remove the used tag (item is now processed)
tag @s remove ffl.tropical_fish_used
