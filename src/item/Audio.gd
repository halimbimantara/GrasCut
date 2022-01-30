extends Node

func playBGMusic():
	$BgMusic.play()

func volumeBGMusic(value):
	$BgMusic.unit_db = value

func stopBGMusic():
	$BgMusic.stop()
	
func playGrassCut():
	$GrassCut.play()

func stopGrassCut():
	$GrassCut.stop()

func playFlowerPop():
	$FlowerPop.play()

func stopFlowerPop():
	$FlowerPop.stop()
	
func playLevelComplete():
	$LevelComplete.play()

func stopLevelComplete():
	$LevelComplete.stop()
	
func clickPlayButton():
	$Click.play(0.22)

func clickStopButton():
	$Click.stop()

