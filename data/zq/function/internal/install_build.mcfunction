# 内部函数：install 的第二步（等区块加载完再建）。不要手动调用。
execute in minecraft:overworld run function zq:lobby/build
execute in zq:arena run function zq:map/build
execute in minecraft:overworld run setworldspawn -1 151 0
tag @a remove zq_seen
tellraw @a [{text:"[战桥] 安装完成！",color:"green"},{text:"大厅里站红/蓝区域选队，灰色区域 = 旁观；右键讲台改设置；按按钮开始。",color:"white"}]
