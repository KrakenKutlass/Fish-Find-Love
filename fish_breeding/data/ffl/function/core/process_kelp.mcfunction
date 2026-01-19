# Fish Breeding - Process Kelp Items
# Iterates through all dropped kelp items and triggers breeding checks

# Process each kelp item that hasn't been used yet
execute as @e[type=item,nbt={Item:{id:"minecraft:kelp"}},tag=!ffl.kelp_used] at @s run function ffl:breed/find_pairs

# Consume one kelp from each used stack (or remove if only 1)
execute as @e[type=item,tag=ffl.kelp_used] run function ffl:core/consume_kelp
