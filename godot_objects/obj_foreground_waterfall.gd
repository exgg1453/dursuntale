# Auto-converted from GameMaker: obj_foreground_waterfall
extends Node2D

func _ready():
	anim= 0
	oframe= 0

func _on_outside_room():
	anim+= 3
	i= 0
	while(i < 20) {
	    draw_sprite_ext(sprite_index, 0, x, -210 + y + i * 30 + anim, 2, 2, 0, 16777215, 0.2)
	    i++
	}
	if(anim > 180) anim-= 180
	myview= 0
	if(view_xview[0] > 0 and view_xview[0] < get_viewport_rect().size.x - view_wview[0])
	    myview= view_xview[0]
	if(view_xview[0] >= get_viewport_rect().size.x - view_wview[0])
	    myview= get_viewport_rect().size.x - view_wview[0]
	x= xstart - myview * 0.5

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
