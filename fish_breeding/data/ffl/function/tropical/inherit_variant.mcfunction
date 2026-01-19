# Fish Breeding - Inherit Tropical Fish Variant
# Copies the Variant NBT from a randomly selected parent to the offspring

# Randomly select which parent to inherit from (50/50 chance)
execute store result score #parent_select ffl.temp run random value 1..2

# Get the variant from parent1 or parent2
execute if score #parent_select ffl.temp matches 1 run function ffl:tropical/inherit_from_parent1
execute if score #parent_select ffl.temp matches 2 run function ffl:tropical/inherit_from_parent2
