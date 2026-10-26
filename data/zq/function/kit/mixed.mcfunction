# 混合：石剑 + 普通弓 + 队伍色皮革帽 + 锁链胸甲、护腿、靴子 + 石镐
give @s stone_sword[custom_data={zq_kit:1b},unbreakable={}]
give @s bow[custom_data={zq_kit:1b},unbreakable={}]
give @s arrow 3
$function zq:kit/stone_pickaxe {enemy:"$(enemy)"}
item replace entity @s armor.chest with chainmail_chestplate[custom_data={zq_kit:1b},unbreakable={},enchantments={"zq:blast_guard":1},enchantment_glint_override=false,tooltip_display={hidden_components:["minecraft:enchantments"]}]
item replace entity @s armor.legs with chainmail_leggings[custom_data={zq_kit:1b},unbreakable={}]
item replace entity @s armor.feet with chainmail_boots[custom_data={zq_kit:1b},unbreakable={}]
