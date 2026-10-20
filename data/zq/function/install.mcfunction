# ===== 一次性安装 =====
gamerule keep_inventory true
gamerule immediate_respawn true
gamerule block_drops false
gamerule mob_griefing false
gamerule spawn_mobs false
gamerule spawn_phantoms false
gamerule advance_time false
gamerule advance_weather false
gamerule natural_health_regeneration true
gamerule show_advancement_messages false
gamerule send_command_feedback false
gamerule command_block_output false
gamerule respawn_radius 0
gamerule max_block_modifications 4000000
gamerule tnt_explodes true
difficulty easy
time set 6000
weather clear
execute in minecraft:overworld run forceload add -16 -16 15 15
execute in zq:arena run forceload add -80 -48 79 47
tellraw @a {text:"[战桥] 正在加载区块，2 秒后生成大厅和战场……",color:"gold"}
schedule function zq:internal/install_build 40t
