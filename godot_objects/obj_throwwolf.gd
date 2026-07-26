# Auto-converted from GameMaker: obj_throwwolf
extends Node2D

func _ready():
	image_speed= 0
	frame= 0
	$Alarm0.start((137) / 30.0)
	stage= 0
	valuindex= 0
	if(GS.flag[7] == 1) instance_destroy()
	if(scr_murderlv() >= 7) instance_destroy()

func _on_destroy():
	image_speed= 0.1666667
	stage= 1
	$Alarm0.start((160) / 30.0)

func _process(delta: float):
	if(stage > 0) valuindex+= 0.1667
	if(valuindex > 9.2 and stage == 1) {
	    stage= 2
	    instance_create(x, y, 1437/* obj_flyingiceblock */)
	}
	if(valuindex >= 11) {
	    frame= 0
	    image_speed= 0
	    stage= 0
	    valuindex= 0
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
