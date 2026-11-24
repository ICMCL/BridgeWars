# 大厅：主世界 y=150，x -5..4，z -5..5
fill -6 150 -6 5 156 6 barrier hollow
fill -5 150 -5 4 150 5 white_stained_glass
fill -5 150 -1 -4 150 1 red_concrete
fill 3 150 -1 4 150 1 blue_concrete
fill -2 150 3 1 150 5 light_gray_concrete
# 开始按钮与设置讲台方块
setblock -2 151 -6 emerald_block
setblock -2 151 -5 stone_button[face=wall,facing=south]
setblock 1 151 -5 lectern[facing=south]
function zq:lobby/entities
