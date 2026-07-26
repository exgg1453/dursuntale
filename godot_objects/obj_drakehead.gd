# Auto-converted from GameMaker: obj_drakehead
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	image_speed= 0.1
	scale.x= 2
	scale.y= 2
	down= 1
	a= 0.4

func _process(delta: float):
	if(down == 1) {
	    y+= a / 2
	    a+= 0.05
	    if(a >= 1) down= 0
	}
	if(down == 0) {
	    y+= a / 2
	    a-= 0.05
	    if(a <= -1) down= 1
	}

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, 16777215, 1)
	if(instance_exists(253/* obj_chilldrake */))
	    draw_sprite_ext(205/* spr_chillglasses */, 0, x, y, 2, 2, 0, 16777215, 1)

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
