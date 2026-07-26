# Auto-converted from GameMaker: obj_heatwaver
extends Node2D

func _ready():
	drawngr= 0
	gr= 382173812
	a= 2
	b= 2
	c= 2
	cfactor= 1

func _gm_event_1_0():
	if(drawngr == 1) sprite_delete(gr)

func _gm_event_7_5():
	if(drawngr == 1) sprite_delete(gr)

func _gm_event_7_0():
	x= obj_uborder.x
	y= obj_uborder.y
	xa= obj_rborder.x
	ya= obj_dborder.y
	if(drawngr == 1) sprite_delete(gr)
	gr= sprite_create_from_screen_x(x, y, xa - x, ya - y, 0, 0, 0, 0)
	sprite_index= gr
	scr_fx_waver(sprite_height / 50, cfactor)
	drawngr= 1

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
