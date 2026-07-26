# Auto-converted from GameMaker: obj_spiderpour
extends Node2D

func _ready():
	rotation_degrees= 20
	scale.x= 0.2
	scale.y= 0.2
	gravity= 0.2
	velocity.y= 3
	velocity.x= -1
	gravity_direction= 320
	if(obj_spiderb_body.purple > 80) visible= 0

func _process(delta: float):
	if(scale.x < 1) {
	    scale.x+= 0.05
	    scale.y+= 0.05
	}
	if(y > obj_dborder.y - 15) {
	    instance_destroy()
	    obj_spiderb_body.purple+= 4
	}
	rotation_degrees= direction + 90

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
