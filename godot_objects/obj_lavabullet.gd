# Auto-converted from GameMaker: obj_lavabullet
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	image_speed= 0
	if(x < 300) {
	    type= 0
	    velocity.x= 6 + random(2)
	    gravity= 0.17
	    gravity_direction= 180
	    velocity.y= -1 + random(2)
	} else  {
	    type= 1
	    frame= 1
	    velocity.x= -6 - random(2)
	    gravity= 0.17
	    gravity_direction= 0
	    velocity.y= -1 + random(2)
	}
	off= 0

func _process(delta: float):
	rotation_degrees= direction
	if(type == 0 and velocity.x < 0 and x <= GS.idealborder[0])
	    off= 1
	if(type == 1 and velocity.x > 0 and x >= GS.idealborder[1])
	    off= 1
	if(off == 1) {
	    modulate.a-= 0.12
	    if(modulate.a < 0.05) instance_destroy()
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
