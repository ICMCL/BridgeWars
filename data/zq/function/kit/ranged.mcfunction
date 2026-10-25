# 纯远程：冲击弓 + 快弩 + 石镐，盔甲只有队伍色皮革帽
give @s bow[custom_data={zq_kit:1b},item_name={text:"冲击弓（击退I·无限）",color:"aqua"},enchantments={"minecraft:punch":1,"minecraft:infinity":1},unbreakable={}]
give @s crossbow[custom_data={zq_kit:1b},item_name={text:"快弩（快速装填I）",color:"aqua"},lore=[{text:"要消耗箭矢",color:"gray",italic:false}],enchantments={"minecraft:quick_charge":1},unbreakable={}]
give @s arrow 8
$function zq:kit/stone_pickaxe {enemy:"$(enemy)"}
