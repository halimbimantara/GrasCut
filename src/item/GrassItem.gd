extends Area

# Called when the node enters the scene tree for the first time.
onready var mTimer = $Timer
onready var mTimerPop = $timerPop
signal update_point
signal showflower
onready var grassEmit = $Particle
onready var flowerEmit = $particle_congrate
onready var tweenNode = $Tween
onready var sounCut = $Audio/AudioStreamPlayer3D
onready var soundFlower = $Audio/FlowerPop
var isHideGrass = false
var grassCuted = false

#func _ready():
##	tweenNode.interpolate_property($GrassScatter/Flower,"visible",false,true,1.5,Tween.TRANS_LINEAR,Tween.EASE_OUT)
##	tweenNode.start()
#	tweenNode.interpolate_property($GrassScatter/Flower,"scale",Vector3(0.02,0.02,0.02),Vector3(0.09,0.09,0.09),1,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
#	tweenNode.start()
#	pass


func _on_Timer_timeout():
	grassEmit.emitting = false
	Audio.stopGrassCut()


func _on_GrassItem_body_entered(body):
	if body.name == "Player":
		if not isHideGrass:
			grassEmit.emitting = true
			GamePlay.grassPoint += 1
			Audio.playGrassCut()

		$GrassScatter/ScatterItem.visible = false
		isHideGrass = true
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
#	tweenNode.interpolate_property(
#		$GrassScatter/Flower, "proportion", 10, 45, 1, Tween.TRANS_LINEAR, Tween.EASE_OUT
#	)
	tweenNode.interpolate_property($GrassScatter/Flower,"scale",Vector3(0.02,0.02,0.02),Vector3(0.09,0.09,0.09),1,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	tweenNode.start()
	
	flowerEmit.emitting = true
	Audio.playFlowerPop()
	yield(get_tree().create_timer(0.5), "timeout")
	Audio.stopFlowerPop()
	flowerEmit.emitting = false


func _on_timerPop_timeout():
	pass


func _on_Tween_tween_all_completed():
#	tweenNode2.interpolate_property($GrassScatter/Flower,"scale_modifier",0,5,3.0,Tween.TRANS_LINEAR,Tween.EASE_OUT)
#	tweenNode2.start()
	print("pomp")
