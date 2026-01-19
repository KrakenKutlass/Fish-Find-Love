# Fish Breeding - Breed Cod
# Executed as and at a kelp item entity

# Count eligible cod within 5 blocks (returns actual count, not boolean)
execute store result score #fish_count ffl.temp if entity @e[type=minecraft:cod,distance=..5,tag=ffl.tracked,tag=!ffl.breeding,scores={ffl.breed_cooldown=0,ffl.mature_cooldown=0}]

# Only proceed if at least 2 eligible fish
execute if score #fish_count ffl.temp matches 2.. run function ffl:breed/breed_cod_execute
