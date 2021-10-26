extends VBoxContainer


var music_volume = 100
var sfx_volume = 100
var fullscreen = false


func _ready():
	fullscreen = OS.window_fullscreen
	if fullscreen:
		$Fullscreen/FullscreenButton/Button.text = "Disable"
	else:
		$Fullscreen/FullscreenButton/Button.text = "Enable"
	
	music_volume = int(100 * db2linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))))
	$Music/MusicButton/Button.text = str(music_volume) + "%"
	
	sfx_volume = int(100 * db2linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX"))))
	$SFX/SFXButton/Button.text = str(sfx_volume) + "%"

func _on_FullscreenButton_pressed():
	fullscreen = not fullscreen
	if fullscreen:
		$Fullscreen/FullscreenButton/Button.text = "Disable"
	else:
		$Fullscreen/FullscreenButton/Button.text = "Enable"
	OS.window_fullscreen = fullscreen


func _on_MusicButton_pressed():
	music_volume += 20
	if music_volume > 100:
		music_volume = 0
	$Music/MusicButton/Button.text = str(music_volume) + "%"
	
	var db = linear2db(music_volume / 100.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), db)


func _on_SFXButton_pressed():
	sfx_volume += 20
	if sfx_volume > 100:
		sfx_volume = 0
	$SFX/SFXButton/Button.text = str(sfx_volume) + "%"
	
	var db = linear2db(sfx_volume / 100.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), db)
