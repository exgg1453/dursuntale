# Auto-converted from GameMaker: obj_finalfroggit_body
extends Node2D

func _ready():
	siner= 0
	anim= 0
	anim2= 0
	anim3= 0
	xx= 0
	yy= 0
	pause= 0
	offx= 60
	offy= 20

func _on_outside_room():
	if(pause == 1) {
	    siner= 0
	    x= parent.x
	}
	draw_sprite_ext(471/* spr_finalfroggit_body */, 0, x + offx, offy + y + 90, 2, 2 - sin(siner / 3) * 0.15, 0, 16777215, 1)
	if(pause == 0)
	    draw_sprite_ext(469/* spr_finalfroggit_head */, 0, offx + x + sin(siner / 6) * 10, offy + y + sin(siner / 3) * 4, 2, 2, -sin(siner / 6) * 2, 16777215, 1)
	if(pause == 1)
	    draw_sprite_ext(470/* spr_finalfroggit_head_hurt */, 0, offx + x + sin(siner / 6) * 10, offy + y + sin(siner / 3) * 4, 2, 2, -sin(siner / 6) * 2, 16777215, 1)
	siner++
	anim++

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
