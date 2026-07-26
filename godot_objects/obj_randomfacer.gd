# Auto-converted from GameMaker: obj_randomfacer
extends Node2D

func _ready():
	size= 0.5
	anim= 0
	animchoice= round(random(100))
	animspeed= 0.25
	anim= animchoice
	image_speed= 0.5
	y-= 20
	x-= 10
	instance_destroy()

func _on_outside_room():
	draw_sprite_ext(sprite_index, anim, x + random(4), y + random(4), size + 1 + random(0.1), size + random(0.1) + 0.4, 0, 16777215, 1)
	anim+= animspeed
	if(anim > animchoice + 1) animspeed= -animspeed
	if(anim < animchoice - 1) animspeed= -animspeed
	if(Input.is_action_pressed("ui_accept")) {
	    draw_sprite_ext(2206/* spr_noise */, random(3), x + random(4), y + random(4), size + 0.8 + random(0.1), size + random(0.1) + 0.4, 0, 16777215, 1)
	    animchoice= round(random(100))
	    anim= animchoice
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
