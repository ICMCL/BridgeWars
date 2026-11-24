# ===== 绑定 .mca 存档自动初始化（即开即玩，保留主世界手工建筑修改） =====
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

execute in minecraft:overworld run forceload add -48 -16 47 15
execute in zq:arena run forceload add -80 -48 79 47
execute in minecraft:overworld run function zq:lobby/entities
execute in minecraft:overworld run function zq:lobby/preview
scoreboard players set #lobby_synced zq_var 1
