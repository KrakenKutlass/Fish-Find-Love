# Fish Breeding - Default Configuration
# Sets default configuration values using fake player scores
# Only sets defaults if config hasn't been initialized yet (preserves changes across reloads)

# Check if config has been initialized before
execute unless score #config_loaded fb.config matches 1 run scoreboard players set #breed_cooldown fb.config 6000
execute unless score #config_loaded fb.config matches 1 run scoreboard players set #mature_cooldown fb.config 36000
execute unless score #config_loaded fb.config matches 1 run scoreboard players set #tick_frequency fb.config 20
execute unless score #config_loaded fb.config matches 1 run scoreboard players set #fish_breed fb.config 1
execute unless score #config_loaded fb.config matches 1 run scoreboard players set #dolphins_breed fb.config 0
execute unless score #config_loaded fb.config matches 1 run scoreboard players set #dolphin_breed_cooldown fb.config 6000

# Mark config as loaded so it won't reset on future reloads
scoreboard players set #config_loaded fb.config 1
