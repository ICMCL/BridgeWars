# 箱子商店放在出生点正中间，购买和免费换职业共用同一个容器
$summon chest_minecart $(x) 101 0.5 {Tags:["zq_m","zq_store_$(t)"],Invulnerable:1b,NoGravity:1b,CustomName:{text:"商店 / 免费换职业（存入物品会销毁）",color:"green"}}
$execute as @e[type=chest_minecart,tag=zq_store_$(t)] run function zq:shop/stock {team:"$(t)"}
