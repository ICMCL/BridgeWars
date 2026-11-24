# 仅刷新主世界大厅悬浮看板与讲台交互实体（保留 .mca 区块手工建筑改动）
kill @e[tag=zq_lobby]
summon text_display -0.5 153.4 -4.5 {Tags:["zq_lobby"],billboard:"center",text:[{text:"⚔ 战桥 ⚔\n",color:"gold",bold:true},{text:"站上 ",color:"white",bold:false},{text:"红色",color:"red",bold:false},{text:" / ",color:"white",bold:false},{text:"蓝色",color:"blue",bold:false},{text:" 区域选队，",color:"white",bold:false},{text:"灰色",color:"gray",bold:false},{text:" 区域旁观",color:"white",bold:false}]}
summon text_display -4.5 152 0.5 {Tags:["zq_lobby"],billboard:"center",text:{text:"红队",color:"red",bold:true}}
summon text_display 3.5 152 0.5 {Tags:["zq_lobby"],billboard:"center",text:{text:"蓝队",color:"blue",bold:true}}
summon text_display -0.5 152 4.5 {Tags:["zq_lobby"],billboard:"center",text:{text:"旁观（取消选队）",color:"gray",bold:true}}
summon text_display -1.5 152.3 -4.9 {Tags:["zq_lobby"],billboard:"center",text:{text:"▶ 开始游戏",color:"green",bold:true}}
summon interaction 1.5 151 -4.5 {Tags:["zq_lobby","zq_cfgnpc"],width:1.1f,height:1.3f,response:1b}
summon text_display 1.5 152.6 -4.5 {Tags:["zq_lobby"],billboard:"center",text:{text:"⚙ 设置（右键）",color:"yellow",bold:true}}
execute in minecraft:overworld run setworldspawn -1 151 0
