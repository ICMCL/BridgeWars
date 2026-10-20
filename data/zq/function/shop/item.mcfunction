# 通用购买：p=价格 n=数量 it=物品（give 用的完整写法）
$scoreboard players set #price zq_var $(p)
function zq:shop/pay
$execute if score #ok zq_var matches 1 run give @s $(it) $(n)
