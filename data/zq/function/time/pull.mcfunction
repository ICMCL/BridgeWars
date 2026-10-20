# 抽走中间 x=-1 和 x=0 两列，两边整体向中间平移 1 格（最多 20 次）
# 整块场地有 138 万方块，一次性 clone 会卡死；实体先一次性挪好，方块交给 pull_slice 分 14 帧搬
execute if score #p zq_var matches 20.. run return 0
execute if score #pbusy zq_var matches 1 run return 0
scoreboard players add #p zq_var 1
tag @e[x=-78,y=56,z=-45,dx=76,dy=99,dz=89] add zq_pl
tag @e[x=0,y=56,z=-45,dx=77,dy=99,dz=89,tag=!zq_pl] add zq_pr
execute as @e[tag=zq_pl] at @s run tp @s ~1 ~ ~
execute as @e[tag=zq_pr] at @s run tp @s ~-1 ~ ~
tag @e remove zq_pl
tag @e remove zq_pr
scoreboard players set #pbusy zq_var 1
scoreboard players set #psl zq_var 0
function zq:time/pull_slice
tellraw @a {text:"两座岛又靠近了 2 格……",color:"gray",italic:true}
