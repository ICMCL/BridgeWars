# 有主人的火球爆炸属于 player_explosion，胸甲上的隐藏附魔对它免疫 → 只有击退
data merge entity @s {ExplosionPower:3b,acceleration_power:0.1d}
data modify entity @s Owner set from entity @a[tag=zq_thrower,limit=1] UUID
function zq:skill/aim
