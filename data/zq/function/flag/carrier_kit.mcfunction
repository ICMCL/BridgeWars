# 扛旗装备：头戴敌方旗帜，只有旗帜、少量方块和牛肉排
$item replace entity @s armor.head with $(enemy)_banner
$item replace entity @s armor.chest with leather_chestplate[dyed_color=$(c),unbreakable={},enchantments={"zq:blast_guard":1},enchantment_glint_override=false,tooltip_display={hidden_components:["minecraft:enchantments"]}]
$item replace entity @s armor.legs with leather_leggings[dyed_color=$(c),unbreakable={}]
$item replace entity @s armor.feet with leather_boots[dyed_color=$(c),unbreakable={}]
$item replace entity @s hotbar.0 with carrot_on_a_stick[item_model="minecraft:$(enemy)_banner",item_name={text:"$(ename)旗帜 —— 带回自家旗台！",color:"$(enemy)"},custom_data={zq_flag:1b}]
$give @s $(wi) 24
function zq:kit/steak {n:2}
