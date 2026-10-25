# 混合：石剑 + 普通弓 + 锁链胸甲 + 石镐
give @s stone_sword[custom_data={zq_kit:1b},unbreakable={}]
give @s bow[custom_data={zq_kit:1b},unbreakable={}]
give @s arrow 3
$function zq:kit/stone_pickaxe {enemy:"$(enemy)"}
item replace entity @s armor.chest with chainmail_chestplate[custom_data={zq_kit:1b},unbreakable={},enchantments={"zq:blast_guard":1},enchantment_glint_override=false,tooltip_display={hidden_components:["minecraft:enchantments"]}]
