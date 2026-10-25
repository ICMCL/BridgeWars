# 箱子商店放在原商人的位置，购买和免费换职业共用同一个容器
$summon chest_minecart $(x) 101 0.5 {Tags:["zq_m","zq_store_$(t)"],Invulnerable:1b,NoGravity:1b,CustomName:{text:"商店 / 免费换职业（取出图标，请勿存物）",color:"green"}}
$execute as @e[type=chest_minecart,tag=zq_store_$(t)] run function zq:shop/stock {team:"$(t)"}
