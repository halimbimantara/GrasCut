extends Spatial

var totalGrass
signal endLevel
func _ready():
	totalGrass = self.get_child_count()
	GamePlay.totalGrassLevel = totalGrass

func popUpFlower():
	for i in totalGrass:
		var flower = get_child(i) as Area
		yield(get_tree().create_timer(0.15), "timeout")
		flower._onPopFlower(self)	
	emit_signal("endLevel")
		

func _on_GrassItem_showflower():
	popUpFlower()
