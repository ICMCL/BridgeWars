execute store result score #icons zq_var run function zq:shop/has_icon {icon:'barrier[custom_data~{zq_shop:1}]'}
execute if score #icons zq_var matches 0 run return 0
execute unless entity @s[tag=zq_ingame,tag=!zq_carry,gamemode=adventure] run return run function zq:shop/reject_icons
execute if entity @s[team=red] if entity @e[type=chest_minecart,tag=zq_store_red,distance=..5] run return run function zq:shop/scan {team:"red"}
execute if entity @s[team=blue] if entity @e[type=chest_minecart,tag=zq_store_blue,distance=..5] run return run function zq:shop/scan {team:"blue"}
function zq:shop/reject_icons
