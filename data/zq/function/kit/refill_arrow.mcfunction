# 箭矢只给冲击弓和快弩用（长弓带无限），所以补给要慢：每 3 秒 1 支，上限 8
execute store result score #n zq_var run clear @s arrow 0
execute if score #n zq_var matches ..7 run give @s arrow 1
