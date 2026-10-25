# 近战：铁剑 + 盾 + 铁甲 + 石镐
give @s iron_sword[custom_data={zq_kit:1b},enchantments={"minecraft:sharpness":1},unbreakable={}]
$function zq:kit/stone_pickaxe {enemy:"$(enemy)"}
execute unless items entity @s weapon.offhand * run item replace entity @s weapon.offhand with shield[custom_data={zq_kit:1b},unbreakable={}]
execute unless items entity @s weapon.offhand shield run give @s shield[custom_data={zq_kit:1b},unbreakable={}]
item replace entity @s armor.chest with iron_chestplate[custom_data={zq_kit:1b},unbreakable={},enchantments={"zq:blast_guard":1},enchantment_glint_override=false,tooltip_display={hidden_components:["minecraft:enchantments"]}]
