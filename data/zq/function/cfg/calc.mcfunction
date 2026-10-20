# 把时间选项序号换算成秒
function zq:cfg/calc1 {k:"gap"}
function zq:cfg/calc1 {k:"full"}
function zq:cfg/calc1 {k:"bed"}
function zq:cfg/calc1 {k:"ps"}
function zq:cfg/calc1 {k:"pi"}
function zq:cfg/calc1 {k:"xs"}
function zq:cfg/calc1 {k:"xd"}
function zq:cfg/calc1 {k:"sd"}
# 关闭阶段的时间为 0；只累计开启阶段的等待时间
scoreboard players operation #m zq_var = #t_gap zq_var
execute if score #t_full zq_var matches 1.. run scoreboard players operation #t_full zq_var += #m zq_var
execute if score #t_full zq_var matches 1.. run scoreboard players operation #m zq_var = #t_full zq_var
execute if score #t_bed zq_var matches 1.. run scoreboard players operation #t_bed zq_var += #m zq_var
