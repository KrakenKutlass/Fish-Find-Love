# Squid Breeding - Process Dropped Squid Food
# Checks for dropped cod near squids and glow lichen near glow squids

# Process dropped cod for squids
execute as @e[type=item,nbt={Item:{id:"minecraft:cod"}},tag=!ffl.squid_food_used] at @s if entity @e[type=minecraft:squid,distance=..5,tag=ffl.tracked,tag=!ffl.squid_love,scores={ffl.squid_cd=0}] run function ffl:squid/feed_squid_cod

# Process dropped glow lichen for glow squids
execute as @e[type=item,nbt={Item:{id:"minecraft:glow_lichen"}},tag=!ffl.squid_food_used] at @s if entity @e[type=minecraft:glow_squid,distance=..5,tag=ffl.tracked,tag=!ffl.squid_love,scores={ffl.squid_cd=0}] run function ffl:squid/feed_glow_squid

# Consume used food items
execute as @e[type=item,tag=ffl.squid_food_used] run function ffl:squid/consume_squid_food
