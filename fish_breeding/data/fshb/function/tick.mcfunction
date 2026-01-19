# Fish Breeding - Main Tick Function
# Orchestrates all breeding system operations on a scheduled cycle

# Reschedule self based on tick_frequency configuration
execute store result storage fshb:temp tick_delay int 1 run scoreboard players get #tick_frequency fb.config
schedule function fshb:tick 20t replace

# Fish Breeding System (only if enabled)
execute if score #fish_breed fb.config matches 1 run function fshb:core/init_fish
execute if score #fish_breed fb.config matches 1 run function fshb:core/process_cooldowns
execute if score #fish_breed fb.config matches 1 if entity @e[type=item,limit=1,nbt={Item:{id:"minecraft:kelp"}}] run function fshb:core/process_kelp

# Dolphin Breeding System (only if enabled)
execute if score #dolphins_breed fb.config matches 1 run function fshb:dolphin/init_dolphins
execute if score #dolphins_breed fb.config matches 1 run function fshb:dolphin/process_cooldowns
execute if score #dolphins_breed fb.config matches 1 if entity @e[type=minecraft:dolphin,tag=db.in_love,limit=1] run function fshb:dolphin/check_love_pairs
