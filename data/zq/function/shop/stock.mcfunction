execute unless data entity @s {CustomName:{text:"商店 / 免费换职业（存入物品会销毁）",color:"green"}} run data modify entity @s CustomName set value {text:"商店 / 免费换职业（存入物品会销毁）",color:"green"}
function zq:shop/clean
$function zq:shop/icon {team:"$(team)",slot:0,id:1,model:"splash_potion",name:"伤害药水 II · 6 金币",desc:"喷溅型瞬间伤害 II"}
$function zq:shop/icon {team:"$(team)",slot:1,id:2,model:"tipped_arrow",name:"消除方块箭 ×3 · 5 金币",desc:"耐久 10，向前钻穿玩家方块"}
$function zq:shop/icon {team:"$(team)",slot:2,id:3,model:"fire_charge",name:"烈焰弹 · 2 金币",desc:"右键发射，只击退，不破坏方块"}
$function zq:shop/icon {team:"$(team)",slot:3,id:4,model:"potion",name:"隐身药水 · 8 金币",desc:"3 分钟隐身，盔甲仍可见"}
$function zq:shop/icon {team:"$(team)",slot:4,id:5,model:"tnt",name:"TNT 炸弹 · 6 金币",desc:"1.5 秒引爆，破坏玩家方块，不破坏岛屿"}
$function zq:shop/icon {team:"$(team)",slot:5,id:6,model:"totem_of_undying",name:"不死图腾 · 6 金币",desc:"手持抵挡一次致命伤害"}
$function zq:shop/icon {team:"$(team)",slot:6,id:8,model:"glass",name:"脚下生桥 · 5 金币",desc:"5 秒内脚下生成玻璃；扛旗时不可用"}
$function zq:shop/icon {team:"$(team)",slot:7,id:9,model:"slime_block",name:"自救平台 · 4 金币",desc:"生成 5×5 史莱姆平台，10 秒消失"}
$function zq:shop/icon {team:"$(team)",slot:9,id:10,model:"stone_bricks",name:"石砖 ×16 · 2 金币",desc:"石镐挖 1.5 秒"}
$function zq:shop/icon {team:"$(team)",slot:10,id:11,model:"end_stone",name:"末地石 ×16 · 4 金币",desc:"石镐挖 3 秒"}
$function zq:shop/icon {team:"$(team)",slot:11,id:12,model:"oak_log",name:"原木 ×8 · 6 金币",desc:"任何镐子都要挖 6 秒"}
$function zq:shop/stock_up {team:"$(team)",slot:13,id:21,model:"iron_sword",name:"队伍力量升级",o:"zq_up_str",max:2,base:15}
$function zq:shop/stock_up {team:"$(team)",slot:14,id:22,model:"iron_chestplate",name:"队伍防御升级",o:"zq_up_res",max:2,base:15}
$function zq:shop/stock_up {team:"$(team)",slot:15,id:23,model:"sugar",name:"队伍速度升级",o:"zq_up_spd",max:2,base:10}
$function zq:shop/stock_up {team:"$(team)",slot:16,id:24,model:"rabbit_foot",name:"队伍跳跃升级",o:"zq_up_jmp",max:2,base:6}
$function zq:shop/stock_up {team:"$(team)",slot:17,id:25,model:"clock",name:"队伍复活 -1 秒",o:"zq_up_rsp",max:5,base:5}
$function zq:shop/icon {team:"$(team)",slot:19,id:31,model:"iron_sword",name:"换职业：近战（免费）",desc:"铁剑、盾牌、队伍色皮革帽、铁胸甲（保护I）、铁护腿、铁靴"}
$function zq:shop/icon {team:"$(team)",slot:20,id:32,model:"bow",name:"换职业：远程（免费）",desc:"冲击弓（击退I·无限）、快弩，只穿队伍色皮革帽"}
$function zq:shop/icon {team:"$(team)",slot:21,id:33,model:"stone_sword",name:"换职业：混合（免费）",desc:"石剑、普通弓、队伍色皮革帽、锁链胸甲、锁链护腿、锁链靴，箭矢上限5"}
$function zq:shop/icon {team:"$(team)",slot:22,id:34,model:"iron_pickaxe",name:"换职业：建造者（免费）",desc:"建造者镐、队伍色皮革套装，方块补充"}
