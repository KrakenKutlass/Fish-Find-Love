# Squid Breeding - Handle Cod Use near Squid
# Triggered when player right-clicks (starts eating) cod

# Revoke advancement so it can trigger again
advancement revoke @s only ffl:player_use_cod_on_squid

# Only proceed if squid breeding is enabled
execute unless score #squids_breed ffl.config matches 1 run return 0

# Only proceed if there's an eligible squid nearby
execute unless entity @e[type=minecraft:squid,distance=..6,limit=1,tag=ffl.tracked,tag=!ffl.squid_love,scores={ffl.squid_cd=0}] run return 0

# Find the nearest adult squid that is tracked, not already in love, and not on cooldown
execute as @e[type=minecraft:squid,distance=..6,limit=1,sort=nearest,tag=ffl.tracked,tag=!ffl.squid_love,scores={ffl.squid_cd=0}] at @s run function ffl:squid/enter_love_mode

# If we successfully put a squid in love mode, consume one cod from player (unless in creative mode)
execute if entity @e[type=minecraft:squid,distance=..6,tag=ffl.squid_love,limit=1] unless entity @s[gamemode=creative] run function ffl:squid/consume_player_cod
