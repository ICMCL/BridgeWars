tag @s add zq_out
gamemode spectator @s
execute in zq:arena run tp @s -0.5 125 0.5 90 50
tellraw @a [{selector:"@s"},{text:" 出局了",color:"gray"}]
