# 箭矢补给：每次 1 支，上限 8；远程每 3 秒、混合每 5 秒调用
execute store result score #n zq_var run clear @s arrow 0
execute if score #n zq_var matches ..7 run give @s arrow 1
