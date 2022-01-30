extends CanvasLayer

export (String, FILE) var to_scene
onready var btnShadow = $MainMenu/MarginContainer/VBoxContainer/Control2/VBoxContainer/HBoxContainer/BtnShadow
onready var btnShadowPrivacy = $MainMenu/MarginContainer/VBoxContainer/Control2/BtnShadow2
onready var btnShadowExit = $MainMenu/MarginContainer/VBoxContainer/Control2/BtnShadow3

onready var btnPlay = $MainMenu/MarginContainer/VBoxContainer/Control2/VBoxContainer/HBoxContainer/BtnShadow/BtnPlay
onready var anim =$AnimationPlayer
onready var tweens = $MainMenu/Tween
onready var audioBg = $AudioStreamPlayer

 
func _ready():
	audioBg.play()
	tweens.interpolate_property(btnShadow,"rect_size:x",329,350,2.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	tweens.interpolate_property(btnShadow,"rect_size:y",329,350,2.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	
#	tweens.interpolate_property(btnShadow,"rect_position",Vector2(34,37),Vector2(40,43),1.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
#	tweens.interpolate_property(btnShadow,"rect_position:y",37,-50,1.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	
	tweens.interpolate_property(btnShadowPrivacy,"rect_size:x",206,215,1.0,Tween.TRANS_SINE,Tween.EASE_OUT)
	tweens.interpolate_property(btnShadowPrivacy,"rect_size:y",206,215,1.0,Tween.TRANS_SINE,Tween.EASE_OUT)
	
	tweens.interpolate_property(btnShadowExit,"rect_size:x",206,215,1.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	tweens.interpolate_property(btnShadowExit,"rect_size:y",206,215,1.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	
	
#	tweens.interpolate_property(btnPlay,"position:x",225,227,1.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
#	tweens.interpolate_property(btnPlay,"position:y",16,1,1.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
	anim.play("start")
	Event.connect("change_scene",self,"_on_scene_Change")

func _on_BtnPlay_pressed():
#	audioBg.stop()
	tweens.stop_all()
	Audio.clickPlayButton()
	yield(get_tree().create_timer(0.2), "timeout")
	Audio.clickStopButton()
	#cek last level
	$MainMenu/MarginContainer.visible = false
	$MainMenu/Loading.visible = true
	GamePlay.fader.fade_out()
	

func _on_AnimationPlayer_animation_finished(anim_name):
	tweens.start()
#	Audio.playBGMusic()

func _on_BtnRateme_pressed():
#	rateme.show()
	pass


func _on_BtnPrivacy_pressed():
	OS.shell_open("https://google.com")


func _on_BtnExit_pressed():
	get_tree().quit()

func _on_scene_Change():
	get_tree().change_scene("res://res/level/MainLevel.tscn")
