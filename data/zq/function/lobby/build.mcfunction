# 大厅：主世界 y=150，x -5..4，z -5..5
fill -6 150 -6 5 156 6 barrier hollow
fill -5 150 -5 4 150 5 white_stained_glass
fill -5 150 -1 -4 150 1 red_concrete
fill 3 150 -1 4 150 1 blue_concrete
fill -2 150 3 1 150 5 light_gray_concrete
kill @e[tag=zq_lobby]
summon text_display -0.5 153.4 -4.5 {Tags:["zq_lobby"],billboard:"center",text:[{text:"⚔ 战桥 ⚔\n",color:"gold",bold:true},{text:"站上 ",color:"white",bold:false},{text:"红色",color:"red",bold:false},{text:" / ",color:"white",bold:false},{text:"蓝色",color:"blue",bold:false},{text:" 区域选队，",color:"white",bold:false},{text:"灰色",color:"gray",bold:false},{text:" 区域旁观",color:"white",bold:false}]}
summon text_display -4.5 152 0.5 {Tags:["zq_lobby"],billboard:"center",text:{text:"红队",color:"red",bold:true}}
summon text_display 3.5 152 0.5 {Tags:["zq_lobby"],billboard:"center",text:{text:"蓝队",color:"blue",bold:true}}
summon text_display -0.5 152 4.5 {Tags:["zq_lobby"],billboard:"center",text:{text:"旁观（取消选队）",color:"gray",bold:true}}
# 开始按钮
setblock -2 151 -6 emerald_block
setblock -2 151 -5 stone_button[face=wall,facing=south]
summon text_display -1.5 152.3 -4.9 {Tags:["zq_lobby"],billboard:"center",text:{text:"▶ 开始游戏",color:"green",bold:true}}
# 设置讲台
setblock 1 151 -5 lectern[facing=south]
summon interaction 1.5 151 -4.5 {Tags:["zq_lobby","zq_cfgnpc"],width:1.1f,height:1.3f,response:1b}
summon text_display 1.5 152.6 -4.5 {Tags:["zq_lobby"],billboard:"center",text:{text:"⚙ 设置（右键）",color:"yellow",bold:true}}
