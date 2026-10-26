scoreboard objectives add zq_var dummy
scoreboard objectives add zq_const dummy
scoreboard objectives add zq_coin dummy
scoreboard objectives add zq_up_str dummy
scoreboard objectives add zq_up_res dummy
scoreboard objectives add zq_up_spd dummy
scoreboard objectives add zq_up_jmp dummy
scoreboard objectives add zq_up_rsp dummy
scoreboard objectives add zq_dc dummy
scoreboard objectives add zq_resp dummy
scoreboard objectives add zq_cls dummy
scoreboard objectives add zq_foot dummy
scoreboard objectives add zq_timer dummy
scoreboard objectives add zq_tmp dummy
scoreboard objectives add zq_gid dummy
scoreboard objectives add zq_id dummy
scoreboard objectives add zq_dx dummy
scoreboard objectives add zq_dy dummy
scoreboard objectives add zq_dz dummy
scoreboard objectives add zq_still dummy
scoreboard objectives add zq_pick trigger
scoreboard objectives add zq_buy trigger
scoreboard objectives add zq_cfg trigger
scoreboard objectives add zq_set trigger
scoreboard objectives add zq_time trigger
scoreboard objectives add zq_death deathCount
scoreboard objectives add zq_kill playerKillCount
scoreboard objectives add zq_use minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add zq_left minecraft.custom:minecraft.leave_game
scoreboard objectives add zq_mred minecraft.mined:minecraft.red_banner
scoreboard objectives add zq_mblue minecraft.mined:minecraft.blue_banner
scoreboard objectives add zq_side dummy {text:"⚔ 战桥 ⚔",color:"gold",bold:true}
scoreboard players set #2 zq_const 2
scoreboard players set #3 zq_const 3
scoreboard players set #4 zq_const 4
scoreboard players set #5 zq_const 5
scoreboard players set #10 zq_const 10
scoreboard players set #20 zq_const 20
scoreboard players set #30 zq_const 30
scoreboard players set #100 zq_const 100
scoreboard players set #-1 zq_const -1

# 默认设置（只在没设置过时写入）
data modify storage zq:cfg tab set value {gap:[60, 120, 180, 300, 480, 0],full:[120, 240, 360, 600, 900, 0],bed:[240, 360, 600, 900, 1800, 0],ps:[30, 60, 120, 300, 600],pi:[10, 20, 30, 60, 120],xs:[180, 300, 600, 900, 1500],xd:[60, 120, 180, 300, 600],sd:[300, 480, 720, 1200, 1800]}
# 两岛靠近：整块场地切成 14 片分帧搬运，核心层（岛面所在）排在最前
data modify storage zq:cfg pslice set value [{y0:94,y1:112,z0:-12,z1:11},{y0:94,y1:112,z0:-45,z1:-13},{y0:94,y1:112,z0:12,z1:44},{y0:86,y1:93,z0:-45,z1:44},{y0:78,y1:85,z0:-45,z1:44},{y0:70,y1:77,z0:-45,z1:44},{y0:62,y1:69,z0:-45,z1:44},{y0:56,y1:61,z0:-45,z1:44},{y0:113,y1:120,z0:-45,z1:44},{y0:121,y1:128,z0:-45,z1:44},{y0:129,y1:136,z0:-45,z1:44},{y0:137,y1:144,z0:-45,z1:44},{y0:145,y1:150,z0:-45,z1:44},{y0:151,y1:155,z0:-45,z1:44}]
execute unless score #o_bridge zq_var matches 0..2 run function zq:cfg/defaults_rules
execute unless score #i_gap zq_var matches 0..5 run scoreboard players set #i_gap zq_var 2
execute unless score #i_full zq_var matches 0..5 run scoreboard players set #i_full zq_var 2
execute unless score #i_bed zq_var matches 0..5 run scoreboard players set #i_bed zq_var 2
execute unless score #i_ps zq_var matches 0..4 run scoreboard players set #i_ps zq_var 2
execute unless score #i_pi zq_var matches 0..4 run scoreboard players set #i_pi zq_var 2
execute unless score #i_xs zq_var matches 0..4 run scoreboard players set #i_xs zq_var 2
execute unless score #i_xd zq_var matches 0..4 run scoreboard players set #i_xd zq_var 2
execute unless score #i_sd zq_var matches 0..4 run scoreboard players set #i_sd zq_var 2
function zq:cfg/calc
execute unless score #running zq_var matches 0.. run scoreboard players set #running zq_var 0

# 大厅两侧的预览岛兼作保护模板，更新时也要加载；等区块就绪后迁移旧模板
execute in minecraft:overworld run forceload add -48 -16 47 15
schedule function zq:map/migrate_templates 40t replace

team add red {text:"红队",color:"red"}
team add blue {text:"蓝队",color:"blue"}
team modify red color red
team modify blue color blue
team modify red friendlyFire false
team modify blue friendlyFire false
team modify red prefix {text:"[红] ",color:"red"}
team modify blue prefix {text:"[蓝] ",color:"blue"}
data modify storage zq:t red set value {team:'red',name:'红队',color:'red',c:16711680,enemy:'blue',ename:'蓝队',wi:'red_concrete[can_place_on={blocks:"#zq:place_on"},tooltip_display={hidden_components:["minecraft:can_place_on"]}]',ti:'red_terracotta[can_place_on={blocks:"#zq:place_on"},tooltip_display={hidden_components:["minecraft:can_place_on"]}]'}
data modify storage zq:t blue set value {team:'blue',name:'蓝队',color:'blue',c:3949738,enemy:'red',ename:'红队',wi:'blue_concrete[can_place_on={blocks:"#zq:place_on"},tooltip_display={hidden_components:["minecraft:can_place_on"]}]',ti:'blue_terracotta[can_place_on={blocks:"#zq:place_on"},tooltip_display={hidden_components:["minecraft:can_place_on"]}]'}
function zq:cfg/templates
# 更新旧版商店：移除村民和挡住箱子的交互实体，现有箱子由游戏 tick 归位
execute in zq:arena run kill @e[type=villager,tag=zq_npc]
execute in zq:arena run kill @e[type=interaction,tag=zq_shop]
# 刷新旧版商店方块和职业图标，商店 tick 会补回新图标
execute in zq:arena as @e[type=chest_minecart,tag=zq_store_red] if items entity @s container.9 *[custom_data~{zq_shop:1,buy:10,team:"red"}] run item replace entity @s container.9 with air
execute in zq:arena as @e[type=chest_minecart,tag=zq_store_blue] if items entity @s container.9 *[custom_data~{zq_shop:1,buy:10,team:"blue"}] run item replace entity @s container.9 with air
execute in zq:arena as @e[type=chest_minecart,tag=zq_store_red] if items entity @s container.10 *[custom_data~{zq_shop:1,buy:11,team:"red"}] run item replace entity @s container.10 with air
execute in zq:arena as @e[type=chest_minecart,tag=zq_store_blue] if items entity @s container.10 *[custom_data~{zq_shop:1,buy:11,team:"blue"}] run item replace entity @s container.10 with air
execute in zq:arena as @e[type=chest_minecart,tag=zq_store_red] if items entity @s container.11 *[custom_data~{zq_shop:1,buy:12,team:"red"}] run item replace entity @s container.11 with air
execute in zq:arena as @e[type=chest_minecart,tag=zq_store_blue] if items entity @s container.11 *[custom_data~{zq_shop:1,buy:12,team:"blue"}] run item replace entity @s container.11 with air
execute in zq:arena as @e[type=chest_minecart,tag=zq_store_red] if items entity @s container.19 *[custom_data~{zq_shop:1,buy:31,team:"red"}] run item replace entity @s container.19 with air
execute in zq:arena as @e[type=chest_minecart,tag=zq_store_blue] if items entity @s container.19 *[custom_data~{zq_shop:1,buy:31,team:"blue"}] run item replace entity @s container.19 with air
execute in zq:arena as @e[type=chest_minecart,tag=zq_store_red] if items entity @s container.21 *[custom_data~{zq_shop:1,buy:33,team:"red"}] run item replace entity @s container.21 with air
execute in zq:arena as @e[type=chest_minecart,tag=zq_store_blue] if items entity @s container.21 *[custom_data~{zq_shop:1,buy:33,team:"blue"}] run item replace entity @s container.21 with air
execute in zq:arena as @e[type=chest_minecart,tag=zq_store_red] if items entity @s container.22 *[custom_data~{zq_shop:1,buy:34,team:"red"}] run item replace entity @s container.22 with air
execute in zq:arena as @e[type=chest_minecart,tag=zq_store_blue] if items entity @s container.22 *[custom_data~{zq_shop:1,buy:34,team:"blue"}] run item replace entity @s container.22 with air
scoreboard players display name r_coin zq_side {text:"红队金币",color:"red"}
scoreboard players display name b_coin zq_side {text:"蓝队金币",color:"blue"}
scoreboard players display name time zq_side {text:"已进行(秒)",color:"gray"}
tellraw @a [{text:"[战桥] ",color:"gold"},{text:"数据包已加载。第一次使用请输入 ",color:"white"},{text:"/function zq:install",color:"aqua",click_event:{action:"suggest_command",command:"/function zq:install"}}]
