# Auto-converted from GameMaker: obj_normaldrop
extends Node2D

func _ready():
	velocity.y= 2 + random(1)
	gravity= 0.2
	gravity_direction= 270
	y+= 245
	scr_depth()
	y-= 245
	dont= 0
	goal= ystart + 240
	if(room == 107) goal= ystart + random(480)

func _process(delta: float):
	if(y > goal) event_user(1)
	if(dont == 0) {
	    if(x < view_xview[0] - 40) x+= 361
	    if(x > view_xview[0] + 360) x-= 361
	}

func _gm_event_7_11():
	repeat(3)  instance_create(x, y + 5, 1151/* obj_normalplink */)
	instance_destroy()

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
