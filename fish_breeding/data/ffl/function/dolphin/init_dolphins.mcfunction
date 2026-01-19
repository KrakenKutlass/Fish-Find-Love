# Dolphin Breeding - Initialize New Dolphins
# Tags newly spawned or loaded dolphins with breeding system tracking

# Initialize all untracked dolphins
execute as @e[type=minecraft:dolphin,tag=!ffl.tracked] run function ffl:dolphin/init_dolphin_single
