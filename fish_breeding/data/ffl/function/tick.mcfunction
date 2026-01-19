# Fish Breeding - Main Tick Function
# Orchestrates all breeding system operations on a scheduled cycle

# Reschedule self based on tick_frequency configuration
execute store result storage ffl:temp tick_delay int 1 run scoreboard players get #tick_frequency ffl.config
schedule function ffl:tick 20t replace

# Fish Breeding System (only if enabled)
execute if score #fish_breed ffl.config matches 1 run function ffl:core/init_fish
execute if score #fish_breed ffl.config matches 1 run function ffl:core/process_cooldowns
execute if score #fish_breed ffl.config matches 1 if entity @e[type=item,limit=1,nbt={Item:{id:"minecraft:kelp"}}] run function ffl:core/process_kelp

# Dolphin Breeding System (only if enabled)
execute if score #dolphins_breed ffl.config matches 1 run function ffl:dolphin/init_dolphins
execute if score #dolphins_breed ffl.config matches 1 run function ffl:dolphin/process_cooldowns
execute if score #dolphins_breed ffl.config matches 1 if entity @e[type=minecraft:dolphin,tag=ffl.in_love,limit=1] run function ffl:dolphin/check_love_pairs
