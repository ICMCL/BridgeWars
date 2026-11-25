# 丢弃中间两列；move 自带源区清理，masked 不重写虚空，也不会在桥洞里留下旧方块。
$fill -1 $(y0) $(z0) 0 $(y1) $(z1) air
$clone -78 $(y0) $(z0) -2 $(y1) $(z1) -77 $(y0) $(z0) masked move
$clone 1 $(y0) $(z0) 77 $(y1) $(z1) 0 $(y0) $(z0) masked move
