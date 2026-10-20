# @s = 刚生成的弹体，执行朝向 = 玩家视线；Motion = 视线方向 1 格/tick
execute anchored feet positioned 0.0 0.0 0.0 positioned ^ ^ ^1 summon marker run tag @s add zq_vec
data modify entity @s Motion set from entity @e[type=marker,tag=zq_vec,limit=1] Pos
kill @e[type=marker,tag=zq_vec]
