# 换职业：收回旧职业装备和白给的方块，发新装备（商店买的东西保留）
clear @s *[custom_data~{zq_kit:1b}]
clear @s arrow
clear @s red_concrete
clear @s blue_concrete
clear @s red_terracotta
clear @s blue_terracotta
execute if entity @s[team=red] run function zq:kit/give with storage zq:t red
execute if entity @s[team=blue] run function zq:kit/give with storage zq:t blue
execute at @s run playsound minecraft:item.armor.equip_iron master @s
