# 事件前 10 秒提醒
$scoreboard players operation #w zq_var = #t_$(k) zq_var
scoreboard players remove #w zq_var 10
$execute if score #sec zq_var = #w zq_var run tellraw @a [{text:"⚠ 10 秒后：",color:"gold"},{text:"$(msg)",color:"yellow"}]
