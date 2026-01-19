# Dolphin Breeding - Enter Love Mode
# Executed as and at a dolphin that was fed tropical fish

# Check if dolphin is adult (Age:0) - only adults can breed
execute unless data entity @s {Age:0} run return 0

# Tag dolphin as in love
tag @s add ffl.in_love

# Set love timer to 1200 ticks (60 seconds / 1 minute)
scoreboard players set @s ffl.love_timer 1200

# Show heart particles
particle heart ~ ~0.5 ~ 0.3 0.3 0.3 0 10

# Play happy dolphin sound
playsound minecraft:entity.dolphin.ambient_water neutral @a ~ ~ ~ 1.0 1.5
