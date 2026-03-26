# Squid Breeding - Consume Glow Lichen from Player
# Removes one glow lichen from the player's hand after feeding a glow squid

# Check mainhand first
execute if items entity @s weapon.mainhand glow_lichen run item modify entity @s weapon.mainhand ffl:decrease_count

# If not in mainhand, check offhand
execute unless items entity @s weapon.mainhand glow_lichen if items entity @s weapon.offhand glow_lichen run item modify entity @s weapon.offhand ffl:decrease_count
