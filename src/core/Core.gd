extends Node

var package_name_uri ="config-ads-game-huggy-unspoied.json"
export var URL_CONFIG = "https://gitlab.com/bimadel6/ads-config-2021/-/raw/main/game/"

var ADS_IS_ENABLE = false
var MAIN_ADS = ""
var BACKUP_ADS = ""
#admob,applovin,tapdaq,unity

#admob config
var CONFIG_ADMOB_BANNER :String
var CONFIG_ADMOB_INTERTITIAL:String
var CONFIG_ADMOB_NATIVE:String
var CONFIG_ADMOB_REWARD:String
#Backup ads
var CONFIG_BACKUP_BANNER :String
var CONFIG_BACKUP_INTERTITIAL:String
var CONFIG_BACKUP_REWARD:String

func _ready()-> void:
	var https = HTTPRequest.new()
	add_child(https)
	print("request data ADS CONFIG")
	https.connect("request_completed", self, "_on_request_completed")
	https.request(URL_CONFIG+package_name_uri)

func _on_request_completed(_result, response_code, _headers, body):
#	print(response_code)
	var json = JSON.parse(body.get_string_from_utf8())
	print("Loading Get Content Data From Api :")
	print(json.result.ads['select_main_ads'])
	
	MAIN_ADS = json.result.ads['select_main_ads']
	BACKUP_ADS = json.result.ads['select_backup_ads']
	
	CONFIG_ADMOB_BANNER = json.result.ads['main_ads_banner']
	CONFIG_ADMOB_INTERTITIAL = json.result.ads['main_ads_intertitial']
	CONFIG_ADMOB_REWARD = json.result.ads['main_ads_reward']
	
	#backup
	CONFIG_BACKUP_BANNER = json.result.ads['backup_ads_banner']
	CONFIG_BACKUP_INTERTITIAL = json.result.ads['backup_ads_intertitial']
	CONFIG_BACKUP_REWARD = json.result.ads['backup_ads_reward']
	
	print(CONFIG_ADMOB_INTERTITIAL)
	print(CONFIG_BACKUP_INTERTITIAL)
#	Game.init_adsHelper()
	
	
	
	
	
