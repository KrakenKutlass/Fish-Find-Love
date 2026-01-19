# Fish Breeding - Set Tick Frequency
# Usage: /function ffl:config/set_tick_frequency {ticks:20}
# Sets the interval between processing cycles in ticks
#
# Performance impact:
#   1 tick   = 0.05 seconds (maximum responsiveness, highest CPU)
#   10 ticks = 0.5 seconds (good responsiveness, moderate CPU)
#   20 ticks = 1 second (balanced, default)
#   40 ticks = 2 seconds (reduced responsiveness, lower CPU)

# Set the frequency value using macro
$scoreboard players set #tick_frequency ffl.config $(ticks)

# Confirm the change
$tellraw @s [{"text":"[Fish Breeding] ","color":"green"},{"text":"Tick frequency set to ","color":"white"},{"text":"$(ticks)","color":"yellow"},{"text":" ticks","color":"white"}]
