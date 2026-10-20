# 纯远程：三种弓 + 铁镐，没有近战武器
give @s bow[custom_data={zq_kit:1b},item_name={text:"长弓（力量II）",color:"aqua"},enchantments={"minecraft:power":2,"minecraft:infinity":1},unbreakable={}]
give @s bow[custom_data={zq_kit:1b},item_name={text:"冲击弓（击退I）",color:"aqua"},lore=[{text:"要消耗箭矢，每 3 秒自动补 1 支（上限 8）",color:"gray",italic:false}],enchantments={"minecraft:punch":1},unbreakable={}]
give @s crossbow[custom_data={zq_kit:1b},item_name={text:"快弩（快速装填I）",color:"aqua"},lore=[{text:"要消耗箭矢",color:"gray",italic:false}],enchantments={"minecraft:quick_charge":1},unbreakable={}]
give @s arrow 8
give @s iron_pickaxe[custom_data={zq_kit:1b},unbreakable={},can_break={blocks:"#zq:breakable"},tool={default_mining_speed:1.0,damage_per_block:0,rules:[{blocks:"#zq:cost1",speed:9.0,correct_for_drops:true},{blocks:"#zq:cost2",speed:2.5,correct_for_drops:true},{blocks:"#zq:cost3",speed:1.5,correct_for_drops:true},{blocks:"#zq:cost5",speed:1.5,correct_for_drops:true},{blocks:"#zq:cost10",speed:0.5,correct_for_drops:true}]},tooltip_display={hidden_components:["minecraft:can_break"]}]
