# Auto-converted from GameMaker: obj_gyftrotgift
extends Node2D

func _ready():
	visible= 0
	$Alarm0.start((2) / 30.0)
	image_speed= 0
	active= 0
	scale.x= 2
	scale.y= 2

func _on_destroy():
	frame= gift
	if(gift == 1 or gift == 7) z_index= 9
	active= 1
	visible= 1

func _process(delta: float):
	if(active == 1) {
	    if(instance_exists(236/* obj_gyftrothead */) and gift != 1 and gift != 7 and gift != 9) {
	        x= obj_gyftrothead.x
	        y= obj_gyftrothead.y
	    } else  {
	        if(instance_exists(235/* obj_gyftrot */)) {
	            x= obj_gyftrot.x
	            y= obj_gyftrot.y
	        }
	    }
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
