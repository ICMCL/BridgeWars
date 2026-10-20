setblock -2 151 -5 stone_button[face=wall,facing=south]
execute if score #running zq_var matches 1 run return run tellraw @a {text:"游戏已经在进行中",color:"yellow"}
execute unless entity @a[team=red] run return run tellraw @a {text:"红队还没有人，无法开始",color:"red"}
execute unless entity @a[team=blue] run return run tellraw @a {text:"蓝队还没有人，无法开始",color:"red"}
function zq:game/start
