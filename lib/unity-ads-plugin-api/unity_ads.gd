extends Node
class_name UnityAdsAPI

# Godot IronSource mobile ad plugin library
# Interstitial , Rewarded ads and Banner implementation

# Interstitial signals
signal interstitial_loaded
signal interstitial_opened
signal interstitial_closed

# Rewarded Signals
signal rewarded_loaded
signal rewarded_opened
signal rewarded_closed
signal rewarded #reward the player

# Banner
signal banner_loaded



# Properties
export var _game_id : String = "4491885"
export var _interstitial_id : String = "Interstitial_Android"
export var _rewarded_id : String = "Rewarded_Android"
export var _banner_id : String = "Banner_Android"
export var _is_test_mode : bool = false
export var _banner_on_top : bool = false

var _is_banner_visible : bool = false setget , is_banner_visible
var _can_show_ads : bool = true

var _unity_ads : Object = null

#onready var _ads_cap_timer : Timer = get_node("ads_cap")

func _enter_tree() -> void:
#	get_tree().get_root().get_node("GameSettings").Verify()
	if not _initialize():
		printerr("GodotUnityAds Plugin not found, Android Only")


func show_interstitial() -> void:
	if _unity_ads != null and _can_show_ads:
		_unity_ads.showInterstitial()


func show_rewarded() -> void:
	if _unity_ads != null:
		_unity_ads.showRewarded()


func load_banner() -> void:
	if _unity_ads != null:
		_unity_ads.loadBanner(_banner_on_top)


func show_banner() -> void:
	if _unity_ads != null:
		_is_banner_visible = true
		_unity_ads.showBanner()


func hide_banner() -> void:
	if _unity_ads != null:
		_is_banner_visible = false
		_unity_ads.hideBanner()


func is_ad_loaded(ad_id : String) -> bool:
	if _unity_ads != null:
		return _unity_ads.isAdLoaded(ad_id)
	return false


func is_rewarded_loaded() -> bool:
	return is_ad_loaded(_rewarded_id)


func is_banner_visible() -> bool:
	return _is_banner_visible


func _initialize() -> bool:
	if Engine.has_singleton("GodotUnityAds"):
		_unity_ads = Engine.get_singleton("GodotUnityAds")
		if not _unity_ads.is_connected("on_interstitial_loaded",self,"_on_interstitial_loaded"):
			_connect_signals()
		_unity_ads.initialize(_game_id,_interstitial_id,_rewarded_id,_banner_id ,_is_test_mode)
		return true
	return false


func _connect_signals() -> void:
	# Interstitial
	_unity_ads.connect("on_interstitial_loaded",self,"_on_interstitial_loaded")
	_unity_ads.connect("on_interstitial_opened",self,"_on_interstitial_opened")
	_unity_ads.connect("on_interstitial_closed",self,"_on_interstitial_closed")
	# Rewarded
	_unity_ads.connect("on_rewarded_loaded",self,"_on_rewarded_loaded")
	_unity_ads.connect("on_rewarded_opened",self,"_on_rewarded_opened")
	_unity_ads.connect("on_rewarded_closed",self,"_on_rewarded_closed")
	_unity_ads.connect("on_rewarded",self,"_on_rewarded")
	# Banner
	_unity_ads.connect("on_banner_loaded",self,"_on_banner_loaded")




func _on_interstitial_loaded() -> void:
	emit_signal("interstitial_loaded")


func _on_interstitial_opened() -> void:
	emit_signal("interstitial_opened")


func _on_interstitial_closed() -> void:
#	_reset_ads_cap_time()
	emit_signal("interstitial_closed")


func _on_rewarded_loaded() -> void:
	emit_signal("rewarded_loaded")


func _on_rewarded_opened() -> void:
	emit_signal("rewarded_opened")


func _on_rewarded_closed() -> void:
	emit_signal("rewarded_closed")


func _on_rewarded() -> void:
#	_reset_ads_cap_time()
	emit_signal("rewarded")

func _on_banner_loaded() -> void:
	emit_signal("banner_loaded")


#func _reset_ads_cap_time() -> void:
#	_can_show_ads = false
#	_ads_cap_timer.start()


func _on_ads_cap_timeout() -> void:
	_can_show_ads = true


func _on_show_ads_every_timeout() -> void:
	show_interstitial()
