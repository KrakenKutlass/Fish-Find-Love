# Squid Breeding - Enable Squid Breeding
# Usage: /function ffl:config/enable_squid_breeding

scoreboard players set #squids_breed ffl.config 1
tellraw @s [{"text":"Squid breeding ","color":"green"},{"text":"enabled","color":"yellow","bold":true}]
