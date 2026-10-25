# 从旧版固定模板迁移，不读取可能已被爆炸破坏或搬动的实战岛屿
execute in zq:arena if block -46 -57 -4 crimson_planks if block 29 -57 -4 warped_planks run return run function zq:map/templates {y0:-60,y1:-57}
function zq:lobby/preview
