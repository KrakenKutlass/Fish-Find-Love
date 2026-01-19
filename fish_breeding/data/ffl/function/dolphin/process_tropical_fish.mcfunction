# Dolphin Breeding - Process Tropical Fish Items
# Iterates through all dropped raw tropical fish items and triggers breeding checks

# Debug: Announce function is running
tellraw @a [{"text":"[DEBUG] process_tropical_fish called","color":"aqua"}]

# Only process if dolphin breeding is enabled
execute unless score #dolphins_breed ffl.config matches 1 run tellraw @a [{"text":"[DEBUG] Breeding disabled, exiting","color":"red"}]
execute unless score #dolphins_breed ffl.config matches 1 run return 0

tellraw @a [{"text":"[DEBUG] Breeding enabled, checking for items","color":"green"}]

# Process each tropical fish item that hasn't been used yet
execute as @e[type=item,nbt={Item:{id:"minecraft:tropical_fish"}},tag=!ffl.tropical_fish_used] at @s run tellraw @a [{"text":"[DEBUG] Found tropical fish item, calling find_dolphin_pairs","color":"yellow"}]
execute as @e[type=item,nbt={Item:{id:"minecraft:tropical_fish"}},tag=!ffl.tropical_fish_used] at @s run function ffl:dolphin/find_dolphin_pairs

# Consume one tropical fish from each used stack (or remove if only 1)
execute as @e[type=item,tag=ffl.tropical_fish_used] run function ffl:dolphin/consume_tropical_fish
