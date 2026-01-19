# Dolphin Breeding - Handle Tropical Fish Use on Dolphin
# Triggered when player right-clicks dolphin with tropical fish

# Revoke advancement so it can trigger again
advancement revoke @s only ffl:player_use_tropical_fish_on_dolphin

# Only proceed if dolphin breeding is enabled
execute unless score #dolphins_breed ffl.config matches 1 run return 0

# Find the nearest adult dolphin the player is looking at (within 6 blocks)
# Check if it's adult, tracked, not already in love, and not on cooldown
execute as @e[type=minecraft:dolphin,distance=..6,limit=1,sort=nearest,tag=ffl.tracked,tag=!ffl.in_love,scores={ffl.dolphin_cd=0}] at @s run function ffl:dolphin/enter_love_mode

# If we successfully put a dolphin in love mode, consume one tropical fish from player (unless in creative mode)
execute if entity @e[type=minecraft:dolphin,distance=..6,tag=ffl.in_love,limit=1] unless entity @s[gamemode=creative] run function ffl:dolphin/consume_player_tropical_fish
