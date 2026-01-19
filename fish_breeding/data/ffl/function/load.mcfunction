# Fish Breeding Datapack - Initialization
# Triggered on datapack load, world reload, or /reload command

# Initialize scoreboard objectives
function ffl:init/scoreboards

# Set default configuration values
function ffl:init/config

# Schedule the first tick
schedule function ffl:tick 1t

# Announce to all players in chat
tellraw @a {"text":"==========================================","color":"aqua"}
tellraw @a [{"text":"  Fish Breeding","color":"gold","bold":true},{"text":" Datapack Loaded!","color":"green","bold":true}]
tellraw @a [{"text":"  Drop ","color":"gray"},{"text":"kelp","color":"green"},{"text":" near two fish to breed them","color":"gray"}]
tellraw @a [{"text":"  Right-click dolphins with ","color":"gray"},{"text":"tropical fish","color":"aqua"},{"text":" to breed (enable in config)","color":"gray"}]
tellraw @a [{"text":"  Use ","color":"gray"},{"text":"/function ffl:config/show_config","color":"yellow","clickEvent":{"action":"run_command","value":"/function ffl:config/show_config"},"hoverEvent":{"action":"show_text","value":"Click to show config"}},{"text":" for settings","color":"gray"}]
tellraw @a [{"text":"  Datapack v1.1 by KrakenKutlass and TechBrat","color":"dark_gray"}]
tellraw @a {"text":"==========================================","color":"aqua"}
