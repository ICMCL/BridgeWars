execute if entity @s[tag=zq_carry] run return 0
execute unless score @s zq_cls matches 4 if entity @s[team=red] run function zq:kit/refill_w with storage zq:t red
execute unless score @s zq_cls matches 4 if entity @s[team=blue] run function zq:kit/refill_w with storage zq:t blue
execute if score #m3 zq_var matches 0 if score @s zq_cls matches 2 run function zq:kit/refill {m:7,clr:'arrow',it:'arrow'}
execute if score #m5 zq_var matches 0 if score @s zq_cls matches 3 run function zq:kit/refill {m:4,clr:'arrow',it:'arrow'}
