# Auto-converted from GameMaker: obj_chaosbomb
# GM parent: obj_floweybullet_parent
extends Node2D

func _ready():
	con= 0

func _process(delta: float):
	rotation_degrees+= 10
	if(con == 3) {
	    scale.x+= 0.05
	    scale.y+= 0.05
	    modulate.a-= 0.1
	    if(modulate.a < 0.1) instance_destroy()
	}
	if(con == 2.2) {
	    scale.x+= 0.4
	    scale.y+= 0.4
	    if(scale.x >= 2) con= 3
	}
	if(con == 2.1) con= 2.2
	if(con == 2) con= 2.1
	if(con == 1) {
	    scale.x= 0.8
	    scale.y= 0.8
	    con= 1.5
	}
	if(con == 1.5) {
	    scale.x-= 0.1
	    scale.y-= 0.1
	    if(scale.x < 0.2) con= 2
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
