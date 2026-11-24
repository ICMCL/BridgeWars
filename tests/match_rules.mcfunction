# Headless vanilla 26.3 GameTest assertions for Bridge Wars (`zq:`) on pre-built `.mca` world
scoreboard players set #errors zq_var 0

# Ensure zero-install world_boot has run
execute unless score #lobby_synced zq_var matches 1 in minecraft:overworld run function zq:internal/world_boot

# 1. Verify Overworld lobby (y=150) & static flanking island templates (y=137..141) from `.mca`
execute in minecraft:overworld unless block 0 150 0 white_stained_glass run scoreboard players add #errors zq_var 1
execute in minecraft:overworld unless block -2 151 -6 emerald_block run scoreboard players add #errors zq_var 1
execute in minecraft:overworld unless block 1 151 -5 lectern run scoreboard players add #errors zq_var 1
execute in minecraft:overworld unless block -4 150 0 red_concrete run scoreboard players add #errors zq_var 1
execute in minecraft:overworld unless block 3 150 0 blue_concrete run scoreboard players add #errors zq_var 1
execute in minecraft:overworld unless block -43 140 0 gold_block run scoreboard players add #errors zq_var 1
execute in minecraft:overworld unless block -43 141 0 red_banner run scoreboard players add #errors zq_var 1
execute in minecraft:overworld unless block 42 140 0 gold_block run scoreboard players add #errors zq_var 1
execute in minecraft:overworld unless block 42 141 0 blue_banner run scoreboard players add #errors zq_var 1
execute in minecraft:overworld unless entity @e[type=interaction,tag=zq_cfgnpc] run scoreboard players add #errors zq_var 1

# 2. Verify custom dimension `zq:arena` pre-built `.mca` chunks (y=97..101 islands + stash chest)
execute in zq:arena unless block 0 20 0 chest run scoreboard players add #errors zq_var 1
execute in zq:arena unless block -35 100 0 red_glazed_terracotta run scoreboard players add #errors zq_var 1
execute in zq:arena unless block 34 100 0 blue_glazed_terracotta run scoreboard players add #errors zq_var 1
execute in zq:arena unless block -43 100 0 gold_block run scoreboard players add #errors zq_var 1
execute in zq:arena unless block 42 100 0 gold_block run scoreboard players add #errors zq_var 1

# 3. Verify bridge preview modes & match start / stop lifecycle
scoreboard players set #o_bridge zq_var 2
function zq:lobby/preview
execute in minecraft:overworld unless block 0 140 0 stone_bricks run scoreboard players add #errors zq_var 1

function zq:game/start
execute unless score #running zq_var matches 1 run scoreboard players add #errors zq_var 1
execute unless score #red zq_coin matches 5 run scoreboard players add #errors zq_var 1
execute unless score #blue zq_coin matches 5 run scoreboard players add #errors zq_var 1
execute in zq:arena unless block 0 100 0 stone_bricks run scoreboard players add #errors zq_var 1
execute in zq:arena unless entity @e[type=marker,tag=zq_flag_red] run scoreboard players add #errors zq_var 1
execute in zq:arena unless entity @e[type=marker,tag=zq_flag_blue] run scoreboard players add #errors zq_var 1
execute in zq:arena unless entity @e[type=chest_minecart,tag=zq_m] run scoreboard players add #errors zq_var 1

function zq:game/stop
execute unless score #running zq_var matches 0 run scoreboard players add #errors zq_var 1
function zq:cfg/defaults_rules
function zq:cfg/calc
function zq:lobby/preview
execute in minecraft:overworld unless block 0 140 0 air run scoreboard players add #errors zq_var 1
