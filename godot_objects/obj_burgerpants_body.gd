# Auto-converted from GameMaker: obj_burgerpants_body
extends Node2D

func _ready():
	image_speed= 0
	GS.faceemotion= 0
	anim= 0
	rr= 0
	siner= 0

func _on_outside_room():
	frame= GS.faceemotion
	rr1= random(0.6) - random(0.6)
	rr2= random(0.6) - random(0.6)
	if(GS.faceemotion == 2) {
	    siner++
	    draw_sprite(sprite_index, frame, x, y + sin(siner) * 1)
	}
	if(GS.faceemotion == 3)
	    draw_sprite(866/* spr_bpants_arms */, 0, x - 20 + rr1 * 1.1, y + rr2 * 1.1)
	if(GS.faceemotion != 5 and GS.faceemotion != 2 and GS.faceemotion != 1)
	    draw_sprite(sprite_index, frame, x, y)
	if(GS.faceemotion == 5 or GS.faceemotion == 1)
	    draw_sprite(sprite_index, frame, x + rr1, y + rr2)
	if(GS.faceemotion == 6) draw_sprite(865/* spr_bpants_cloud */, anim, x - 5, y)
	anim+= 0.1
	draw_set_color(16777215)
	draw_rectangle(0, 120, 600, 124, 0)

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
