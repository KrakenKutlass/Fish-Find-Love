# Dolphin Breeding - Consume Tropical Fish from Player
# Removes one tropical fish from the player's hand after feeding a dolphin

# Check mainhand first
execute if items entity @s weapon.mainhand tropical_fish run item modify entity @s weapon.mainhand ffl:decrease_count

# If not in mainhand, check offhand
execute unless items entity @s weapon.mainhand tropical_fish if items entity @s weapon.offhand tropical_fish run item modify entity @s weapon.offhand ffl:decrease_count
