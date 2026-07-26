# Auto-converted from GameMaker: obj_telegramspider
extends Node2D

func _ready():
	velocity.x= -6
	x= 670
	image_speed= 0.25
	siner= 0
	con= 0

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, 16777215, 1)
	siner++
	draw_sprite_ext(413/* spr_spidertelegram */, frame, x - 4, y - 2, 2, 2, sin(siner / 10) * 10, 16777215, 1)
	if(con == 0 and x < 570) {
	    velocity.x+= 0.2
	    if(velocity.x >= 0) {
	        velocity.x= 0
	        con= 1
	    }
	}
	if(con == 2) {
	    velocity.x++
	    if(x > 700) instance_destroy()
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
