execute unless entity @a[team=red,tag=zq_ingame,tag=!zq_out] unless entity @a[team=blue,tag=zq_ingame,tag=!zq_out] run return run function zq:game/draw
execute unless entity @a[team=red,tag=zq_ingame,tag=!zq_out] run return run function zq:game/win with storage zq:t blue
execute unless entity @a[team=blue,tag=zq_ingame,tag=!zq_out] run return run function zq:game/win with storage zq:t red
