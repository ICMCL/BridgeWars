$item replace entity @s armor.head with leather_helmet[custom_data={zq_kit:1b},dyed_color=$(c),unbreakable={}]
$execute unless score @s zq_cls matches 2 run item replace entity @s armor.chest with leather_chestplate[custom_data={zq_kit:1b},dyed_color=$(c),unbreakable={},enchantments={"zq:blast_guard":1},enchantment_glint_override=false,tooltip_display={hidden_components:["minecraft:enchantments"]}]
$execute unless score @s zq_cls matches 2 run item replace entity @s armor.legs with leather_leggings[custom_data={zq_kit:1b},dyed_color=$(c),unbreakable={}]
$execute unless score @s zq_cls matches 2 run item replace entity @s armor.feet with leather_boots[custom_data={zq_kit:1b},dyed_color=$(c),unbreakable={}]
scoreboard players reset @s zq_mred
scoreboard players reset @s zq_mblue
$execute if score @s zq_cls matches 1 run function zq:kit/melee with storage zq:t $(team)
$execute if score @s zq_cls matches 2 run function zq:kit/ranged with storage zq:t $(team)
$execute if score @s zq_cls matches 3 run function zq:kit/mixed with storage zq:t $(team)
$execute if score @s zq_cls matches 4 run function zq:kit/builder with storage zq:t $(team)
$execute unless score @s zq_cls matches 4 run give @s $(wi) 16
