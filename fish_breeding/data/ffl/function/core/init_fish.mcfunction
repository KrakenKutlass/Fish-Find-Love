# Fish Breeding - Initialize New Fish
# Tags newly spawned or loaded fish with breeding system tracking

# Initialize all untracked breedable fish
execute as @e[type=#ffl:breedable_fish,tag=!ffl.tracked] run function ffl:core/init_fish_single
