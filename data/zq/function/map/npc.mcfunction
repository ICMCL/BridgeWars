# 商人：村民负责外观，外面套一个交互实体接收右键
$summon villager $(x) 101 0.5 {Tags:["zq_m","zq_npc"],NoAI:1b,NoGravity:1b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b,CustomName:{text:"商店在旁边的箱子矿车",color:"green",bold:true},CustomNameVisible:1b,VillagerData:{profession:"minecraft:weaponsmith",type:"minecraft:plains",level:5},Rotation:[$(r)f,0f]}
$summon interaction $(x) 101 0.5 {Tags:["zq_m","zq_shop","zq_shop_$(t)"],width:1.2f,height:2.2f,response:1b}
$summon chest_minecart $(x) 101 2.5 {Tags:["zq_m","zq_store_$(t)"],Invulnerable:1b,NoGravity:1b,CustomName:{text:"商店：取出图标购买（请勿存物）",color:"green"}}
$execute as @e[type=chest_minecart,tag=zq_store_$(t)] run function zq:shop/stock {team:"$(t)"}
