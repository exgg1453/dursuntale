# Auto-converted from GameMaker: obj_shyrenmovenpc
extends Node2D

func _ready():
	siner= 0
	image_speed= 0
	if(GS.flag[7] == 0) {
	    instance_destroy()
	    exit
	} else  {
	    hole= scr_marker(x + 12, ystart + 50, 1177)
	    hole.modulate.a= 0.9
	    hole.z_index= 600000
	    exit
	}

func _process(delta: float):
	siner++
	frame+= 0.08
	y+= sin(siner / 8) / 2

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	hole.scale.x= 0.5 - (ystart - y) / 40
	hole.scale.y= 0.5 - (ystart - y) / 40

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
