# Auto-converted from GameMaker: obj_mandogbody
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	image_speed= 0.2
	scale.x= 2
	scale.y= 2

func _process(delta: float):
	if(instance_exists(242/* obj_womandogbody */)) image_speed= 0.125
	else  image_speed= 0
	if(frame == 0) {
	    if(z_index == 10) z_index= 9
	    else  z_index= 10
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
