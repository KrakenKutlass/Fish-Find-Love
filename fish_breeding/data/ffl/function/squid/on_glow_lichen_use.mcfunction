# Squid Breeding - Handle Glow Lichen Use on Glow Squid
# Triggered when player right-clicks a glow squid with glow lichen

# Revoke advancement so it can trigger again
advancement revoke @s only ffl:player_use_glow_lichen_on_glow_squid

# Only proceed if squid breeding is enabled
execute unless score #squids_breed ffl.config matches 1 run return 0

# Find the nearest adult glow squid that is tracked, not already in love, and not on cooldown
execute as @e[type=minecraft:glow_squid,distance=..6,limit=1,sort=nearest,tag=ffl.tracked,tag=!ffl.squid_love,scores={ffl.squid_cd=0}] at @s run function ffl:squid/enter_love_mode

# If we successfully put a glow squid in love mode, consume one glow lichen from player (unless in creative mode)
execute if entity @e[type=minecraft:glow_squid,distance=..6,tag=ffl.squid_love,limit=1] unless entity @s[gamemode=creative] run function ffl:squid/consume_player_glow_lichen
