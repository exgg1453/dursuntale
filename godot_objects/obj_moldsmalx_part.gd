# Auto-converted from GameMaker: obj_moldsmalx_part
extends Node2D

func _ready():
	f= 0
	sinelover= 0
	c= 0
	velocity.y= -4
	stetch= 0.5
	bborder= GS.idealborder[2]

func _on_outside_room():
	if(f == 0) {
	    if(c == 0) sl2= sin(sinelover / 10) * 8
	    else  sl2= cos(sinelover / 10) * 8
	    if(y < bborder - 20)
	        draw_sprite_ext(sprite_index, frame, sl2 + x, y, 2, 2, 0, 16777215, 1)
	}
	if(f == 1) instance_destroy()
	if(f == 2) {
	    velocity.y= 0
	    if(c == 0) sl2= sin(sinelover / 10) * 8
	    else  sl2= cos(sinelover / 10) * 8
	    if(y < bborder - 20)
	        draw_sprite_ext(sprite_index, frame, x + sl2, y, 1.5 + stetch, 2, 0, 16777215, 1)
	    sinelover++
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
