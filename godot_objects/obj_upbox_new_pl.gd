# Auto-converted from GameMaker: obj_upbox_new_pl
extends Node2D

func _ready():
	velocity.y= 4
	sf= 0
	s= 0
	sp= 10

func _process(delta: float):
	if(collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 743, 0, 1))
	    room_restart()
	if(collision_rectangle(x + 2, y + 2, x + 22, y + 22, 739, 0, 1)) {
	    if(velocity.y > 0.5) velocity.y= 2
	    g= collision_rectangle(x + 2, y + 2, x + 22, y + 22, 739, 0, 1)
	    with(g) instance_destroy()
	}
	s++
	x= xstart + sin(s / sp) * sf

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
