# 混合：石剑 + 普通弓 + 锁链胸甲 + 铁镐
give @s stone_sword[custom_data={zq_kit:1b},unbreakable={}]
give @s bow[custom_data={zq_kit:1b},unbreakable={}]
give @s arrow 3
give @s iron_pickaxe[custom_data={zq_kit:1b},unbreakable={},can_break={blocks:"#zq:breakable"},tool={default_mining_speed:1.0,damage_per_block:0,rules:[{blocks:"#zq:cost1",speed:9.0,correct_for_drops:true},{blocks:"#zq:cost2",speed:2.5,correct_for_drops:true},{blocks:"#zq:cost3",speed:1.5,correct_for_drops:true},{blocks:"#zq:cost5",speed:1.5,correct_for_drops:true},{blocks:"#zq:cost10",speed:0.5,correct_for_drops:true}]},tooltip_display={hidden_components:["minecraft:can_break"]}]
item replace entity @s armor.chest with chainmail_chestplate[custom_data={zq_kit:1b},unbreakable={},enchantments={"zq:blast_guard":1},enchantment_glint_override=false,tooltip_display={hidden_components:["minecraft:enchantments"]}]
