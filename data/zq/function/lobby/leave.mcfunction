team leave @s
tellraw @a [{selector:"@s"},{text:" 变成了旁观者",color:"gray"}]
execute if score #running zq_var matches 1 run function zq:player/watch
