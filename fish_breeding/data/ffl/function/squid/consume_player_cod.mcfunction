# Squid Breeding - Consume Cod from Player
# Removes one cod from the player's hand after feeding a squid

# Check mainhand first
execute if items entity @s weapon.mainhand cod run item modify entity @s weapon.mainhand ffl:decrease_count

# If not in mainhand, check offhand
execute unless items entity @s weapon.mainhand cod if items entity @s weapon.offhand cod run item modify entity @s weapon.offhand ffl:decrease_count
