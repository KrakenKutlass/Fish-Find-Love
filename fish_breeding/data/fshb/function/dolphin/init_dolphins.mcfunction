# Dolphin Breeding - Initialize New Dolphins
# Tags newly spawned or loaded dolphins with breeding system tracking

# Initialize all untracked dolphins
execute as @e[type=minecraft:dolphin,tag=!db.tracked] run function fshb:dolphin/init_dolphin_single
