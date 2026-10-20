# 结束扛旗：去掉减益，还原原来的物品
tag @s remove zq_carry
effect clear @s glowing
effect clear @s slowness
effect clear @s mining_fatigue
execute in zq:arena run function zq:inv/restore
