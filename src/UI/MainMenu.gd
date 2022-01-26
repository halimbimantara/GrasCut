extends CanvasLayer

onready var btnShadow = $MainMenu/VBoxContainer/Control2/BtnShadow
onready var btnShadowPrivacy = $MainMenu/VBoxContainer/Control2/BtnShadow2
onready var btnShadowExit = $MainMenu/VBoxContainer/Control2/BtnShadow3

onready var btnPlay = $MainMenu/VBoxContainer/Control2/BtnShadow/BtnPlay
onready var anim =$AnimationPlayer
onready var tweens = $MainMenu/Tween

onready var audioBg = $AudioStreamPlayer
 
func _ready():
	
	audioBg.play()
	tweens.interpolate_property(btnShadow,"rect_size:x",329,350,2.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	tweens.interpolate_property(btnShadow,"rect_size:y",329,350,2.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	
	tweens.interpolate_property(btnShadow,"rect_position:x",191,181,1.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	tweens.interpolate_property(btnShadow,"rect_position:y",-36,-50,1.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	
	tweens.interpolate_property(btnShadowPrivacy,"rect_size:x",206,215,1.0,Tween.TRANS_SINE,Tween.EASE_OUT)
	tweens.interpolate_property(btnShadowPrivacy,"rect_size:y",206,215,1.0,Tween.TRANS_SINE,Tween.EASE_OUT)
	
	tweens.interpolate_property(btnShadowExit,"rect_size:x",206,215,1.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	tweens.interpolate_property(btnShadowExit,"rect_size:y",206,215,1.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	
	
#	tweens.interpolate_property(btnPlay,"position:x",225,227,1.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
#	tweens.interpolate_property(btnPlay,"position:y",16,1,1.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	anim.play("start")

func _on_BtnPlay_pressed():
	tweens.stop_all()
	audioBg.stop()
	Audio.clickPlayButton()
	yield(get_tree().create_timer(0.2), "timeout")
	Audio.clickStopButton()
	#cek last level
	$MainMenu.visible = false
#	GamePlay.fader.fade_out()
	get_tree().change_scene("res://res/level/Level_1.tscn")


func _on_AnimationPlayer_animation_finished(anim_name):
	tweens.start()
#	Audio.playBGMusic()

func _on_BtnRateme_pressed():
#	rateme.show()
	pass


func _on_BtnPrivacy_pressed():
	OS.shell_open("https://google.com")
