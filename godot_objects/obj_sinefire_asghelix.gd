# Auto-converted from GameMaker: obj_sinefire_asghelix
# GM parent: obj_asgorebulparent
extends Node2D

func _ready():
	s= 0
	sf= 10
	sv= 5
	velocity.y= 2

func _process(delta: float):
	s++
	x+= sin(s / sv) * sf
	if(y > get_viewport_rect().size.y + 100) instance_destroy()
	if(collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 743, 0, 1))
	    event_user(0)

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
