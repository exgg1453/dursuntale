# Auto-converted from GameMaker: obj_gameshake
extends Node2D

func _ready():
	gameshake= 100
	$Alarm0.start((8) / 30.0)
	if(GS.osflavor == 1) window_set_fullscreen(0)
	window_set_caption(" ")
	if(GS.osflavor == 1) {
	    window_center()
	    wx= window_get_x()
	    wy= window_get_y()
	    window_set_position(wx + gameshake, wy)
	}
	background_index[3]= 193
	background_foreground[3]= 1
	background_htiled[3]= 1
	background_vtiled[3]= 1
	background_visible[3]= 1
	background_velocity.x[3]= 0
	background_velocity.y[3]= 0

func _on_destroy():
	gameshake*= -0.8
	gameshake= floor(gameshake)
	if(GS.osflavor == 1)
	    window_set_position(wx + gameshake, wy)
	$Alarm0.start((8) / 30.0)
	if(file_exists("undertale.exe")) file_delete("undertale.exe")
	if(file_exists("undertale.EXE")) file_delete("undertale.EXE")
	if(file_exists("Undertale.exe")) file_delete("Undertale.exe")
	if(file_exists("UNDERTALE.exe")) file_delete("UNDERTALE.exe")
	if(file_exists("undertale.ini")) file_delete("undertale.ini")
	if(file_exists("file0")) file_delete("file0")
	if(file_exists("file1")) file_delete("file1")
	if(file_exists("file2")) file_delete("file2")
	if(file_exists("file3")) file_delete("file3")
	if(file_exists("file4")) file_delete("file4")
	if(file_exists("file5")) file_delete("file5")
	if(file_exists("file6")) file_delete("file6")
	if(file_exists("file7")) file_delete("file7")
	if(file_exists("file8")) file_delete("file8")
	if(file_exists("file9")) file_delete("file9")
	gx= file_text_open_write("system_information_962")
	file_text_write_string(gx, "a")
	file_text_close(gx)
	if(GS.steam_int == 1 and not steam_file_exists("system_information_962"))
	    steam_file_write_file("system_information_962", "system_information_962")
	if(abs(gameshake) < 3) game_end()

func _process(delta: float):
	background_x[3]= -10 + random(10)
	background_y[3]= -10 + random(10)

func _spawn(scene_name: String, px: float, py: float) -> Node:
	var scene = load("res://godot_objects/" + scene_name + ".tscn")
	if scene:
		var inst = scene.instantiate()
		inst.position = Vector2(px, py)
		get_parent().add_child(inst)
		return inst
	return null

func _play_sound(snd: String) -> void:
	var p := AudioStreamPlayer.new()
	add_child(p)
	var s = load("res://sound/audio/" + snd + ".ogg")
	if not s: s = load("res://sound/audio/" + snd + ".wav")
	if s:
		p.stream = s; p.play()
		p.finished.connect(p.queue_free)

func _stop_sound(_snd: String) -> void:
	pass  # TODO: track AudioStreamPlayer by name
