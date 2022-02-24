extends Node2D

var coords = [
	[-248, 132],
	[-383, -40],
	[-80, -40],
	[22, -197],
	[22, -197],
	[104, -197],
	[-192, -197],
	[-70, -330],
	[167, -330],
	[-389, -428],
	[-288, -582],
	[-196, -582],
	[-95, -582],
	[100, -483],
	[414, -310],
	[593, -466],
	[760, -221],
	[1112, -355],
	[1987, -177],
	[2167, -527],
	[1512, -707],
	[1968, -707],
	[1684, -870],
	[2555, --826],
	[2549, --588],
	[2500, 109],

]

var Coin = preload('res://src/scenes/Coin.tscn')

func _ready():
	
	for i in coords:
		
		var coin = Coin.instance()
		coin.connect("body_shape_entered", coin,"_touched")
		coin.global_position.x = i[0]
		coin.global_position.y = i[1]
		add_child(coin)
		
		
