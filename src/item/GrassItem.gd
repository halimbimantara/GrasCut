extends Area

# Called when the node enters the scene tree for the first time.
onready var mTimer = $Timer
onready var mTimerPop = $timerPop
signal update_point
signal showflower
onready var grassEmit = $Particle
onready var flowerEmit = $particle_congrate
onready var tweenNode = $Tween
onready var tweenNode2 = $Tween2
onready var sounCut = $Audio/AudioStreamPlayer3D
onready var soundFlower = $Audio/FlowerPop
var isHideGrass = false

#func _ready():
##	tweenNode.interpolate_property($GrassScatter/Flower,"visible",false,true,1.5,Tween.TRANS_LINEAR,Tween.EASE_OUT)
##	tweenNode.start()
#	tweenNode.interpolate_property($GrassScatter,"proportion",2,50,2,Tween.TRANS_LINEAR,Tween.EASE_OUT)
#	tweenNode.start()


func _on_Timer_timeout():
	grassEmit.emitting = false
	sounCut.stop()


func _on_GrassItem_body_entered(body):
	if body.name == "Player":
		if not isHideGrass:
			grassEmit.emitting = true
			sounCut.play()

		$GrassScatter/ScatterItem.visible = false
		isHideGrass = true
		GamePlay.grassPoint += 1
		if GamePlay.grassPoint == GamePlay.totalGrassLevel:
			GamePlay.player.queue_free()
			emit_signal("showflower")
		mTimer.start(0.5)
		emit_signal("update_point")


func _onPopFlower(caller):
	tweenNode.interpolate_property(
		$GrassScatter/Flower, "visible", false, true, 0.1, Tween.TRANS_BOUNCE, Tween.EASE_OUT
	)
	tweenNode.start()
	tweenNode.interpolate_property(
		$GrassScatter/Flower, "proportion", 10, 45, 1, Tween.TRANS_LINEAR, Tween.EASE_OUT
	)
	tweenNode.start()
	flowerEmit.emitting = true
	soundFlower.play()
	yield(get_tree().create_timer(0.2), "timeout")
	soundFlower.stop()
	flowerEmit.emitting = false


func _on_timerPop_timeout():
	pass


func _on_Tween_tween_all_completed():
#	tweenNode2.interpolate_property($GrassScatter/Flower,"scale_modifier",0,5,3.0,Tween.TRANS_LINEAR,Tween.EASE_OUT)
#	tweenNode2.start()
	print("pomp")
