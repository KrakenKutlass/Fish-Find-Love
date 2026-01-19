# Fish Breeding - Set Breeding Cooldown
# Usage: /function ffl:config/set_breed_cooldown {ticks:6000}
# Sets the breeding cooldown duration in ticks (20 ticks = 1 second)
#
# Reference values:
#   1 minute  = 1200 ticks
#   5 minutes = 6000 ticks (default)
#   10 minutes = 12000 ticks

# Set the cooldown value using macro
$scoreboard players set #breed_cooldown ffl.config $(ticks)

# Confirm the change
$tellraw @s [{"text":"[Fish Breeding] ","color":"green"},{"text":"Breeding cooldown set to ","color":"white"},{"text":"$(ticks)","color":"yellow"},{"text":" ticks","color":"white"}]
