# Auto-converted from GameMaker: obj_papyrus_window
extends Node2D

func _ready():
	velocity.x= -3
	velocity.y= -2
	gravity= 0.1
	col= 0
	$Alarm0.start((30) / 30.0)

func _process(delta: float):
	rotation_degrees+= 7

func _on_alarm_0_timeout():
	if(col == 0) {
	    snd_play(11/* snd_glassbreak */)
	    oo= 1068
	    j= instance_create(oo.x, oo.y, 1067/* obj_undynewindow_foreground */)
	    oo.frame= 1
	    repeat(10)  instance_create(oo.x + 11, oo.y + 30, 1066/* obj_glassshard */)
	    col= 1
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
