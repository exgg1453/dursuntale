# Auto-converted from GameMaker: obj_backgrounder_tundra
# GM parent: obj_backgrounder_parent
extends Node2D

func _ready():
	background_visible[0]= 1
	background_index[0]= 161
	scrollspeed= 0.2

func _gm_event_7_10():
	if(view_xview[0] >= 0)
	    background_x[0]= floor(view_xview[0] - view_xview[0] * scrollspeed)
	gg= get_viewport_rect().size.x - view_wview[0]
	if(view_xview[0] >= gg)
	    background_x[0]= floor(gg - gg * scrollspeed)

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
