# Auto-converted from GameMaker: obj_screen
extends Node2D

func _ready():
	scr_scinit(0, 0, 0, 0, 0)
	keyboard_set_map(90, 13)
	keyboard_set_map(88, 16)
	keyboard_set_map(67, 17)
	messed= 0

func _process_end(delta: float):
	if(GS.inbattle == 0 and GS.flag[18] == 0) script_execute(scr_end)
	if(messed == 1) window_set_caption("Floweytale")
	if(messed == 2) window_set_caption(" ")
	if(messed == 3) {
	    str_r= ""
	    repeat(floor(2 + random(15)))  {
	        ir= choose(0, 1)
	        if(ir == 0) str_piece= choose("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", " ", " ")
	        if(ir == 1) str_piece= choose("m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", " ")
	        str_r+= str_piece
	    }
	    window_set_caption(str_r)
	}

func _process_begin(delta: float):
	if(GS.inbattle == 0 and GS.flag[18] == 0) script_execute(scr_begin)

func _gm_event_7_4():
	window_set_caption("UNDERTALE")
	if(room == room_fire_operatest) window_set_caption("UNDERTALE the Musical")

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
