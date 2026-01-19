# Fish Breeding - Default Configuration
# Sets default configuration values using fake player scores
# Only sets defaults if config hasn't been initialized yet (preserves changes across reloads)

# Check if config has been initialized before
execute unless score #config_loaded ffl.config matches 1 run scoreboard players set #breed_cooldown ffl.config 6000
execute unless score #config_loaded ffl.config matches 1 run scoreboard players set #mature_cooldown ffl.config 36000
execute unless score #config_loaded ffl.config matches 1 run scoreboard players set #tick_frequency ffl.config 20
execute unless score #config_loaded ffl.config matches 1 run scoreboard players set #fish_breed ffl.config 1
execute unless score #config_loaded ffl.config matches 1 run scoreboard players set #dolphins_breed ffl.config 0
execute unless score #config_loaded ffl.config matches 1 run scoreboard players set #dolphin_breed_cooldown ffl.config 6000

# Mark config as loaded so it won't reset on future reloads
scoreboard players set #config_loaded ffl.config 1
