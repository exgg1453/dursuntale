# Auto-converted from GameMaker: obj_nothingness_event
extends Node2D

func _ready():
	skip= 0
	con= 0
	$Alarm0.start((18000) / 30.0)
	wind= caster_load("music/f_wind2.ogg")
	caster_loop(wind, 0.8, 0.7)
	obj_time.canquit= 0
	mc= instance_create(-20, -20, 1570/* obj_mainchara */)
	mc.visible= 0
	window_set_caption(" ")

func _gm_event_2_4():
	con++

func _on_destroy():
	con= 1

func _process(delta: float):
	GS.interact= 1
	if(Input.is_action_pressed("ui_cancel")) game_end()
	window_set_caption(" ")
	if(con == 1) {
	    GS.typer= 106
	    GS.facechoice= 0
	    GS.msc= 888
	    con= 2
	    writer= instance_create(10, 150, 782/* OBJ_WRITER */)
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 3
	    $Alarm4.start((180) / 30.0)
	}
	if(con == 4) {
	    GS.typer= 106
	    GS.facechoice= 0
	    GS.msc= 890
	    con= 5
	    writer= instance_create(10, 150, 782/* OBJ_WRITER */)
	}
	if(con == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(file_exists("system_information_962"))
	        file_delete("system_information_962")
	    gx= file_text_open_write("system_information_963")
	    file_text_write_string(gx, "b")
	    file_text_close(gx)
	    if(GS.steam_int == 1) {
	        if(steam_file_exists("system_information_962"))
	            steam_file_delete("system_information_962")
	        steam_file_write_file("system_information_962", "system_information_962")
	    }
	    caster_free(-3)
	    instance_create(0, 0, 150/* obj_whitefader */)
	    con= 6
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 7) game_end()

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
