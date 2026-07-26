# Auto-converted from GameMaker: obj_barabody
extends Node2D

func _ready():
	heady= y - 30
	armory= y + 10
	pantsy= y + 100
	shoesy= y + 142
	siner= 0
	arm1= y + 40
	arm2= y + 60
	hand= y + 80
	pause= 0
	shaker= 0
	hand1pic= 356
	hand2pic= 360
	headpic= 364
	bodypic= 362

func _gm_event_2_3():
	if(shaker > 0) {
	    $Alarm3.start((8) / 30.0)
	    instance_create(x + 55, y + 20, 317/* obj_sweat99 */)
	}

func _gm_event_7_14():
	headpic= 365
	bodypic= 363

func _gm_event_7_12():
	shaker= 1
	$Alarm3.start((2) / 30.0)

func _gm_event_7_11():
	pause= 0

func _gm_event_7_10():
	pause= 1

func _on_outside_room():
	draw_sprite_ext(355/* spr_baraball */, 0, x + 110, arm1 + sin(siner / 4) * 3, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(355/* spr_baraball */, 0, x + 120, arm2 + cos(siner / 4) * 2, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(hand2pic, 0, x + 140, hand + cos(siner / 4) * 4 + 16, 2, 2, sin(siner / 4) * 4 - 30, 16777215, 1)
	draw_sprite_ext(355/* spr_baraball */, 0, x - 10, arm1 + sin(siner / 4) * 3, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(355/* spr_baraball */, 0, x - 20, arm2 + cos(siner / 4) * 2, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(hand1pic, 0, x - 10, hand + cos(siner / 4) * 4 + 16, 2, 2, sin(siner / 4) * 4, 16777215, 1)
	draw_sprite_ext(368/* spr_baralegs */, 0, x + 64, pantsy + sin(siner / 4) * 1, 2 + sin(siner / 4) * 0.05, 2 - sin(siner / 4) * 0.05, 0, 16777215, 1)
	draw_sprite_ext(361/* spr_barashoes */, 0, x + 64, shoesy, 2 + sin(siner / 4) * 0.1, 2 - sin(siner / 4) * 0.05, 0, 16777215, 1)
	draw_sprite_ext(bodypic, 0, x, armory + sin(siner / 4) * 2, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(headpic, 0, x, heady + sin(siner / 4) * 4, 2, 2, 0, 16777215, 1)
	if(pause == 0) siner++
	if(pause == 1) x= parent.x + 28
	if(shaker > 0 and pause == 0) {
	    siner+= 0.5
	    x+= sin(siner / 2)
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
