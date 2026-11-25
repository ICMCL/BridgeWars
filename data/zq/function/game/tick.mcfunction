# 在 zq:arena 维度执行
scoreboard players add #t zq_var 1
scoreboard players operation #m20 zq_var = #t zq_var
scoreboard players operation #m20 zq_var %= #20 zq_const
scoreboard players operation #m4 zq_var = #t zq_var
scoreboard players operation #m4 zq_var %= #4 zq_const

execute as @e[type=player,scores={zq_death=1..}] at @s run function zq:player/death
execute as @a[scores={zq_kill=1..}] run function zq:player/kill
execute as @a[scores={zq_resp=1..}] run function zq:player/resp_tick
# 掉下岛面 40 格（y<60）开始快速掉血；飞出场地边界也掉血
execute if score #m4 zq_var matches 0 as @a[tag=zq_ingame,gamemode=adventure,x=-200,y=-100,z=-200,dx=400,dy=159,dz=400] run damage @s 6 minecraft:out_of_world
execute if score #m4 zq_var matches 0 as @a[tag=zq_ingame,gamemode=adventure] at @s unless entity @s[x=-78,y=0,z=-40,dx=155,dy=150,dz=79] run damage @s 4 minecraft:outside_border

execute as @e[type=tnt,tag=zq_bomb] at @s if data entity @s {fuse:1s} run function zq:skill/bomb_blast
function zq:map/protect
function zq:flag/tick
execute as @e[type=chest_minecart,tag=zq_store_red] at @e[type=marker,tag=zq_spawn_red,limit=1] unless entity @s[distance=..0.05] run tp @s ~ ~ ~
execute as @e[type=chest_minecart,tag=zq_store_blue] at @e[type=marker,tag=zq_spawn_blue,limit=1] unless entity @s[distance=..0.05] run tp @s ~ ~ ~
execute as @e[type=chest_minecart,tag=zq_m] run function zq:shop/clean
execute if score #m4 zq_var matches 0 as @e[type=chest_minecart,tag=zq_store_red] run function zq:shop/stock {team:"red"}
execute if score #m4 zq_var matches 2 as @e[type=chest_minecart,tag=zq_store_blue] run function zq:shop/stock {team:"blue"}
execute as @e[type=arrow,tag=!zq_chk] run function zq:arrow/check
execute as @e[type=arrow,tag=zq_erase] at @s run function zq:arrow/tick
execute as @a[scores={zq_foot=1..},gamemode=adventure] at @s run function zq:skill/foot_tick
execute as @e[type=marker,tag=zq_plat] at @s run function zq:skill/plat_tick
scoreboard players operation #m10 zq_var = #t zq_var
scoreboard players operation #m10 zq_var %= #10 zq_const
execute if score #m10 zq_var matches 0 as @a[tag=zq_ingame,tag=!zq_carry,gamemode=adventure,scores={zq_cls=4},team=red] run function zq:kit/refill_b with storage zq:t red
execute if score #m10 zq_var matches 0 as @a[tag=zq_ingame,tag=!zq_carry,gamemode=adventure,scores={zq_cls=4},team=blue] run function zq:kit/refill_b with storage zq:t blue
execute if score #pz zq_var matches 1 run function zq:time/poison_tick

scoreboard players operation r_coin zq_side = #red zq_coin
scoreboard players operation b_coin zq_side = #blue zq_coin
execute if score #o_shop zq_var matches 0 run scoreboard players reset r_coin zq_side
execute if score #o_shop zq_var matches 0 run scoreboard players reset b_coin zq_side
scoreboard players operation time zq_side = #sec zq_var
execute if score #m20 zq_var matches 0 if score #o_shop zq_var matches 1.. run title @a[team=red,gamemode=adventure] actionbar [{text:"队伍金币 ",color:"gold"},{score:{name:"#red",objective:"zq_coin"},color:"yellow"},{text:"   右键出生点正中间的箱子购买 / 换职业",color:"gray"}]
execute if score #m20 zq_var matches 0 if score #o_shop zq_var matches 1.. run title @a[team=blue,gamemode=adventure] actionbar [{text:"队伍金币 ",color:"gold"},{score:{name:"#blue",objective:"zq_coin"},color:"yellow"},{text:"   右键出生点正中间的箱子购买 / 换职业",color:"gray"}]
execute if score #m20 zq_var matches 0 run function zq:game/second
