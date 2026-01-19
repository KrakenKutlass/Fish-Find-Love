# Fish Breeding - Inherit Variant from Parent 2
# Stores parent2's variant in storage and calls macro to summon offspring

# Store parent2's Variant in storage (capital V for NBT path)
execute as @e[tag=ffl.parent2,limit=1] run data modify storage ffl:temp variant set from entity @s Variant

# Call macro function to summon offspring with the inherited variant
function ffl:tropical/summon_with_variant with storage ffl:temp
