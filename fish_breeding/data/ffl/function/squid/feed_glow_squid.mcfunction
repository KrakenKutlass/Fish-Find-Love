# Squid Breeding - Feed Glow Squid with Glow Lichen
# Executed as and at a dropped glow lichen item entity

# Enter love mode for nearest eligible glow squid
execute as @e[type=minecraft:glow_squid,distance=..5,limit=1,sort=nearest,tag=ffl.tracked,tag=!ffl.squid_love,scores={ffl.squid_cd=0}] at @s run function ffl:squid/enter_love_mode

# Mark food as used if a glow squid entered love mode
execute if entity @e[type=minecraft:glow_squid,distance=..5,tag=ffl.squid_love,limit=1] run tag @s add ffl.squid_food_used
