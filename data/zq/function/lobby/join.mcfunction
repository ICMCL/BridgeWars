$team join $(team) @s
$tellraw @a [{selector:"@s"},{text:" 加入了 ",color:"white"},{text:"$(name)",color:"$(color)"}]
execute if score #running zq_var matches 1 if score #sudden zq_var matches 1 run return run tellraw @s {text:"已进入死斗，下一局再进场",color:"gray"}
execute if score #running zq_var matches 1 run function zq:player/enter
