extends Node

var count = 0 #intertial interval

func _ready():
	print("init ads helper"+Core.CONFIG_ADMOB_INTERTITIAL)
	$AdMob.banner_directed_set(Core.CONFIG_ADMOB_BANNER)
	$AdMob.intertitial_directed_set(Core.CONFIG_ADMOB_INTERTITIAL)
	$AdMob.init()
	$AdMob.load_interstitial()

#Admob
func showBanner():
	$AdMob.show_banner()
	
func showIntertialAdmob():
	print("id"+Core.CONFIG_ADMOB_INTERTITIAL)
#	$AdMob.show_interstitial()
	loadIntertialApplovinMax()
	
func _on_AdMob_interstitial_closed():
	pass # Replace with function body.

func _on_AdMob_interstitial_failed_to_load(error_code):
	if(Core.BACKUP_ADS == "APPLOVIN-M"):
		loadIntertialApplovinMax()

func _on_AdMob_interstitial_loaded():
	pass

#applovin MAX
func loadIntertialApplovinMax():
	applovin_max.loadInterstitial(Core.CONFIG_BACKUP_INTERTITIAL,self.get_instance_id())

func _on_interstitial_loaded(id: String):
	applovin_max.showInterstitial(id)
	
func _on_interstitial_failed_to_load(id: String, error: String):
	print("Error Intertial "+error)

func _on_interstitial_close(id: String):
	print("Intertial Close")
