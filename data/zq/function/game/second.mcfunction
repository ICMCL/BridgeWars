scoreboard players add #sec zq_var 1
# 每 30 秒：每队 +1 金币；每人补 1 块牛肉排（最多 8）
scoreboard players operation #m zq_var = #sec zq_var
scoreboard players operation #m zq_var %= #30 zq_const
execute if score #m zq_var matches 0 if score #o_shop zq_var matches 1 run scoreboard players add #red zq_coin 1
execute if score #m zq_var matches 0 if score #o_shop zq_var matches 1 run scoreboard players add #blue zq_coin 1
execute if score #m zq_var matches 0 as @a[tag=zq_ingame,gamemode=adventure] run function zq:kit/refill {m:7,clr:'cooked_beef',it:'cooked_beef'}
# 建造者：每 10 秒补 1 个石砖（最多 16）
scoreboard players operation #m zq_var = #sec zq_var
scoreboard players operation #m zq_var %= #10 zq_const
execute if score #m zq_var matches 0 as @a[tag=zq_ingame,tag=!zq_carry,gamemode=adventure,scores={zq_cls=4}] run function zq:kit/refill {m:15,clr:'stone_bricks',it:'stone_bricks[can_place_on={blocks:"#zq:place_on"},tooltip_display={hidden_components:["minecraft:can_place_on"]}]'}
execute as @a[tag=zq_ingame,gamemode=adventure] run function zq:player/fx
# 远程：每 3 秒补 1 支箭
scoreboard players operation #m3 zq_var = #sec zq_var
scoreboard players operation #m3 zq_var %= #3 zq_const
execute as @a[tag=zq_ingame,gamemode=adventure] run function zq:kit/refill_slow

execute if score #o_bridge zq_var matches 1 if score #t_gap zq_var matches 1.. if score #sec zq_var = #t_gap zq_var run function zq:time/event {fn:"map/bridge_gap",msg:"间断桥出现了",c:"yellow"}
execute if score #o_bridge zq_var matches 1 if score #t_gap zq_var matches 1.. run function zq:time/warn {k:"gap",msg:"间断桥出现"}
execute if score #o_bridge zq_var matches 1 if score #t_full zq_var matches 1.. if score #sec zq_var = #t_full zq_var run function zq:time/event {fn:"map/bridge_full",msg:"桥已补全",c:"yellow"}
execute if score #o_bridge zq_var matches 1 if score #t_full zq_var matches 1.. run function zq:time/warn {k:"full",msg:"桥补全"}
execute if score #o_bridge zq_var matches 1 if score #t_bed zq_var matches 1.. if score #sec zq_var = #t_bed zq_var run function zq:time/event {fn:"map/bridge_bedrock",msg:"桥变成了基岩，再也拆不掉",c:"dark_red"}
execute if score #o_bridge zq_var matches 1 if score #t_bed zq_var matches 1.. run function zq:time/warn {k:"bed",msg:"桥变基岩"}
execute if score #o_pull zq_var matches 1 if score #sec zq_var >= #t_ps zq_var run function zq:time/pull_check
execute if score #o_pull zq_var matches 1 run function zq:time/warn {k:"ps",msg:"两岛开始靠近"}
execute if score #o_poison zq_var matches 1 if score #sec zq_var = #t_xs zq_var run function zq:time/poison_start
execute if score #o_poison zq_var matches 1 run function zq:time/warn {k:"xs",msg:"毒墙开始收拢"}
execute if score #pz zq_var matches 1 run function zq:time/poison_second
execute if score #o_sudden zq_var matches 1 if score #sec zq_var = #t_sd zq_var run function zq:time/sudden
execute if score #o_sudden zq_var matches 1 run function zq:time/warn {k:"sd",msg:"死斗（不再复活）"}
execute if score #sudden zq_var matches 1 run function zq:game/sudden_check
