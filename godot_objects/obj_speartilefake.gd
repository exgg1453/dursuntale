# Auto-converted from GameMaker: obj_speartilefake
extends Node2D

func _ready():
	y+= 5
	scr_depth()
	y-= 5
	image_speed= 0
	modulate.a= 0
	con= 0
	$Alarm5.start((30) / 30.0)

func _gm_event_2_6():
	obj_speartilefake.con= 6
	snd_play(14/* snd_spearrise */)
	snd_play(21/* snd_impact */)
	instance_create(0, 0, 118/* obj_flasher */)
	scr_shake(4, 4, 2)

func _gm_event_2_5():
	con++

func _process(delta: float):
	if(con == 1) {
	    snd_play(13/* snd_spearappear */)
	    modulate.a+= 0.1
	    con= 2
	}
	if(con == 2) {
	    modulate.a+= 0.07
	    if(modulate.a > 0.97) {
	        modulate.a= 1
	        con= 3
	    }
	}
	if(con == 6) {
	    frame= 3
	    con= 7
	    $Alarm5.start((20) / 30.0)
	}
	if(con == 8) {
	    modulate.a-= 0.1
	    if(modulate.a < 0.1) instance_destroy()
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
