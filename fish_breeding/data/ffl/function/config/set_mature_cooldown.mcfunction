# Fish Breeding - Set Maturation Cooldown
# Usage: /function ffl:config/set_mature_cooldown {ticks:36000}
# Sets the maturation cooldown duration for juvenile fish in ticks
#
# Reference values:
#   10 minutes = 12000 ticks
#   20 minutes = 24000 ticks
#   30 minutes = 36000 ticks (default)

# Set the cooldown value using macro
$scoreboard players set #mature_cooldown ffl.config $(ticks)

# Confirm the change
$tellraw @s [{"text":"[Fish Breeding] ","color":"green"},{"text":"Maturation cooldown set to ","color":"white"},{"text":"$(ticks)","color":"yellow"},{"text":" ticks","color":"white"}]
