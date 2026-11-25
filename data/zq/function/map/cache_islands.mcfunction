# unless blocks 不能跨维度比较。只在开局或 /reload 后把保护层复制到战场底部，避开移岛范围。
fill -46 -64 -4 -30 -61 4 air
fill 29 -64 -4 45 -61 4 air
execute store success score #islands_cached zq_var run clone from minecraft:overworld -46 137 -4 -30 140 4 to zq:arena -46 -64 -4 filtered #zq:island force
execute unless score #islands_cached zq_var matches 1 run return 0
execute store success score #islands_cached zq_var run clone from minecraft:overworld 29 137 -4 45 140 4 to zq:arena 29 -64 -4 filtered #zq:island force
