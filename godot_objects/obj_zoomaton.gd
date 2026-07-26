# Auto-converted from GameMaker: obj_zoomaton
extends Node2D

func _ready():
	scalefactor= 4
	left= 33
	top= 51
	width= 20
	height= 15
	on= 0
	ldiff= -1.65
	tdiff= -2.55
	wdiff= (sprite_width - width) / 20
	hdiff= (sprite_height - height) / 20
	sdiff= -0.15

func _gm_event_7_10():
	on= 1

func _on_outside_room():
	draw_sprite_part_ext(sprite_index, 0, left, top, width, height, x, y, scalefactor, scalefactor, 16777215, modulate.a)
	if(on == 0 and modulate.a < 1)
	    modulate.a+= 0.03
	if(on == 1) {
	    left+= ldiff
	    top+= tdiff
	    height+= hdiff
	    width+= wdiff
	    scalefactor+= sdiff
	    if(left <= 0) on= 2
	}
	if(on > 1) on++
	if(on > 60) {
	    modulate.a-= 0.05
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
