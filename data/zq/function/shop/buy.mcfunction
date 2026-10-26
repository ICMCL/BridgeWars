scoreboard players operation #b zq_var = @s zq_buy
scoreboard players set @s zq_buy 0
execute unless entity @s[tag=zq_ingame,tag=!zq_carry,gamemode=adventure] run return run tellraw @s {text:"只有参战且未扛旗的玩家能购买。",color:"red"}
execute unless score #o_shop zq_var matches 1.. run return run tellraw @s {text:"本局商店已关闭。",color:"red"}
execute unless entity @s[team=red] unless entity @s[team=blue] run return run tellraw @s {text:"请先加入队伍。",color:"red"}
execute if entity @s[team=red] at @s unless entity @e[type=chest_minecart,tag=zq_store_red,distance=..5] run return run tellraw @s {text:"请在自家箱子商店 5 格内购买。",color:"red"}
execute if entity @s[team=blue] at @s unless entity @e[type=chest_minecart,tag=zq_store_blue,distance=..5] run return run tellraw @s {text:"请在自家箱子商店 5 格内购买。",color:"red"}
# 伤害药水
execute if score #b zq_var matches 1 run function zq:shop/item {p:6,n:1,it:'splash_potion[potion_contents={potion:"minecraft:strong_harming"}]'}
# 消除方块箭 ×3
execute if score #b zq_var matches 2 run function zq:shop/item {p:5,n:3,it:'tipped_arrow[potion_contents={custom_color:11141290},item_name={text:"消除方块箭",color:"light_purple"},lore=[{text:"耐久 10，击中后向前钻穿方块",color:"gray",italic:false},{text:"混凝土/玻璃/史莱姆 1 · 石砖 3 · 原木 10",color:"gray",italic:false},{text:"基地和岛屿本体打不穿",color:"gray",italic:false}],custom_data={zq:"erase"}]'}
# 烈焰弹
execute if score #b zq_var matches 3 run function zq:shop/item {p:2,n:1,it:'carrot_on_a_stick[item_model="minecraft:fire_charge",item_name={text:"烈焰弹（右键发射）",color:"gold"},custom_data={zq:"fireball"}]'}
# 隐身药水
execute if score #b zq_var matches 4 run function zq:shop/item {p:8,n:1,it:'potion[potion_contents={potion:"minecraft:invisibility"}]'}
# 炸弹
execute if score #b zq_var matches 5 run function zq:shop/item {p:6,n:1,it:'carrot_on_a_stick[item_model="minecraft:tnt",item_name={text:"炸弹（右键投掷）",color:"red"},custom_data={zq:"bomb"}]'}
# 不死图腾
execute if score #b zq_var matches 6 run function zq:shop/item {p:6,n:1,it:'totem_of_undying'}
# 脚下生桥
execute if score #b zq_var matches 8 run function zq:shop/item {p:5,n:1,it:'carrot_on_a_stick[item_model="minecraft:glass",item_name={text:"脚下生桥（右键）",color:"aqua"},custom_data={zq:"foot"}]'}
# 自救平台
execute if score #b zq_var matches 9 run function zq:shop/item {p:4,n:1,it:'carrot_on_a_stick[item_model="minecraft:slime_block",item_name={text:"自救平台（右键）",color:"green"},custom_data={zq:"plat"}]'}
# 原木 ×8
execute if score #b zq_var matches 12 run function zq:shop/item {p:6,n:8,it:'oak_log[can_place_on={blocks:"#zq:place_on"},tooltip_display={hidden_components:["minecraft:can_place_on"]}]'}
execute if score #b zq_var matches 21 run function zq:shop/up {o:"zq_up_str",max:2,base:15,name:"力量"}
execute if score #b zq_var matches 22 run function zq:shop/up {o:"zq_up_res",max:2,base:15,name:"防御"}
execute if score #b zq_var matches 23 run function zq:shop/up {o:"zq_up_spd",max:2,base:10,name:"速度"}
execute if score #b zq_var matches 24 run function zq:shop/up {o:"zq_up_jmp",max:2,base:6,name:"跳跃"}
execute if score #b zq_var matches 25 run function zq:shop/up {o:"zq_up_rsp",max:5,base:5,name:"复活-1秒"}
