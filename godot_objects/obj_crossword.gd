# Auto-converted from GameMaker: obj_crossword
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	cross= 0
	cancel= 0
	nightmare= 0
	if(file_exists("undertale.ini") and (GS.flag[5] == 56 or GS.flag[5] == 57)) {
	    ini_open("undertale.ini")
	    fn= ini_read_real("General", "fun", 0)
	    if(fn == 56 or fn == 57) nightmare= 1
	    ini_close()
	}

func _gm_event_2_1():
	cancel= 1

func _on_destroy():
	cross= 1
	GS.interact= 1
	$Alarm1.start((10) / 30.0)

func _process(delta: float):
	if(myinteract == 1) {
	    GS.flag[254]= 1
	    GS.interact= 1
	    $Alarm0.start((1) / 30.0)
	    myinteract= 2
	}

func _on_outside_room():
	draw_me()
	if(cross == 1) {
	    z_index= 0
	    draw_sprite(840/* spr_wordsearch */, nightmare, 20, 20)
	} else  z_index= 100000
	if(cross == 1 and cancel == 1 and (keyboard_multicheck_pressed(0/* NOKEY */) == 1 or keyboard_multicheck_pressed(1/* ANYKEY */) == 1)) {
	    cancel= 0
	    cross= 0
	    GS.interact= 0
	    myinteract= 0
	}

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
