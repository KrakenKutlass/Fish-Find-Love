# Squid Breeding - Initialize New Squids and Glow Squids
# Tags newly spawned or loaded entities with breeding system tracking

execute as @e[type=minecraft:squid,tag=!ffl.tracked] run function ffl:squid/init_squid_single
execute as @e[type=minecraft:glow_squid,tag=!ffl.tracked] run function ffl:squid/init_squid_single
