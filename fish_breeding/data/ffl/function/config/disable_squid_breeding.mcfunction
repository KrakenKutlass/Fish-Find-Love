# Squid Breeding - Disable Squid Breeding
# Usage: /function ffl:config/disable_squid_breeding

scoreboard players set #squids_breed ffl.config 0
tellraw @s [{"text":"Squid breeding ","color":"red"},{"text":"disabled","color":"yellow","bold":true}]
