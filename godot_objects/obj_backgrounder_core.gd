# Auto-converted from GameMaker: obj_backgrounder_core
# GM parent: obj_backgrounder_parent
extends Node2D

func _ready():
	x= 150
	y= 0
	background_visible[0]= 1
	background_index[0]= 162
	scrollspeed= 0.3
	a= 0

func _gm_event_7_10():
	y= 0
	if(view_xview[0] >= 0)
	    x= floor(view_xview[0] - view_xview[0] * scrollspeed) + 150
	gg= get_viewport_rect().size.x - view_wview[0]
	if(view_xview[0] >= gg)
	    x= floor(gg - gg * scrollspeed) + 150

func _on_outside_room():
	draw_set_color(0)
	draw_rectangle(-10, -10, 2000, 500, 0)
	scr_waver_height_bg(1, 6)

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
