# Squid Breeding - Enter Love Mode
# Executed as and at a squid/glow squid that was fed its breeding item

# Check if entity is adult (Age:0) - only adults can breed
execute unless data entity @s {Age:0} run return 0

# Tag as in love
tag @s add ffl.squid_love

# Set love timer to 1200 ticks (60 seconds)
scoreboard players set @s ffl.squid_timer 1200

# Show heart particles
particle heart ~ ~0.5 ~ 0.3 0.3 0.3 0 10

# Play sound (type-specific)
execute if entity @s[type=minecraft:squid] run playsound minecraft:entity.squid.squirt neutral @a ~ ~ ~ 1.0 1.5
execute if entity @s[type=minecraft:glow_squid] run playsound minecraft:entity.glow_squid.ambient neutral @a ~ ~ ~ 1.0 1.5
