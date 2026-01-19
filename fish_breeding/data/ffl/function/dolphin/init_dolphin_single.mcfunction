# Dolphin Breeding - Initialize Single Dolphin
# Applied to each untracked dolphin to set up breeding system tracking

# Mark as tracked
tag @s add ffl.tracked

# Set breeding cooldown to 0 (ready to breed)
# Note: We don't use mature_cooldown for dolphins - they use vanilla Age mechanics
scoreboard players set @s ffl.dolphin_cd 0
