# 毒圈：两侧的毒墙沿 z 方向向中间收拢，最后只剩 z=-1..1 三格宽的长条（桥所在的那条线）
scoreboard players set #pz zq_var 1
scoreboard players set #R zq_var 650
function zq:time/poison_store
title @a times 5 40 10
title @a subtitle {text:"毒墙从两侧收拢！待在紫色墙之间",color:"dark_purple"}
title @a title ""
