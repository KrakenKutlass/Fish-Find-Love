# Dolphin Breeding - Check for Love Mode Pairs
# Checks if two dolphins in love mode are near each other

# Only proceed if dolphin breeding is enabled
execute unless score #dolphins_breed ffl.config matches 1 run return 0

# For each dolphin in love mode, check if there's another love-mode dolphin within 3 blocks
execute as @e[type=minecraft:dolphin,tag=ffl.in_love,tag=!ffl.breeding] at @s if entity @e[type=minecraft:dolphin,tag=ffl.in_love,tag=!ffl.breeding,distance=0.1..3,limit=1] run function ffl:dolphin/breed_from_love
