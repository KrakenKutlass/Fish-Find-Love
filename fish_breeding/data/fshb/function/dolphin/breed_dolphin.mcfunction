# Dolphin Breeding - Breed Dolphins
# Executed as and at a tropical fish item entity

tellraw @a [{"text":"[DEBUG] breed_dolphin called","color":"gold"}]

# Count eligible dolphins within 5 blocks
# Must be tracked, not breeding, no cooldown (age check done in execute later)
execute store result score #dolphin_count fb.temp if entity @e[type=minecraft:dolphin,distance=..5,tag=db.tracked,tag=!db.breeding,scores={db.breed_cooldown=0}]

tellraw @a [{"text":"[DEBUG] Final dolphin count: ","color":"white"},{"score":{"name":"#dolphin_count","objective":"fb.temp"},"color":"gold"}]

# Only proceed if at least 2 eligible adult dolphins
execute if score #dolphin_count fb.temp matches 2.. run tellraw @a [{"text":"[DEBUG] Count >= 2, calling breed_dolphin_execute","color":"green"}]
execute if score #dolphin_count fb.temp matches 2.. run function fshb:dolphin/breed_dolphin_execute
execute unless score #dolphin_count fb.temp matches 2.. run tellraw @a [{"text":"[DEBUG] Count < 2, not breeding","color":"red"}]
