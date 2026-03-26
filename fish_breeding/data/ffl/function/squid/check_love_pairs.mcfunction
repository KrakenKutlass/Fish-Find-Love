# Squid Breeding - Check for Love Mode Pairs
# Squids only breed with squids, glow squids only with glow squids

# Only proceed if squid breeding is enabled
execute unless score #squids_breed ffl.config matches 1 run return 0

# Check squid pairs
execute as @e[type=minecraft:squid,tag=ffl.squid_love,tag=!ffl.breeding] at @s if entity @e[type=minecraft:squid,tag=ffl.squid_love,tag=!ffl.breeding,distance=0.1..3,limit=1] run function ffl:squid/breed_from_love

# Check glow squid pairs
execute as @e[type=minecraft:glow_squid,tag=ffl.squid_love,tag=!ffl.breeding] at @s if entity @e[type=minecraft:glow_squid,tag=ffl.squid_love,tag=!ffl.breeding,distance=0.1..3,limit=1] run function ffl:squid/breed_from_love
