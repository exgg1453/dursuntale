# Auto-converted from GameMaker: obj_barriercut
extends Node2D

func _ready():
	shaken= 0
	bx= 0
	bx2= 0
	bxspeed= 4
	timer= 0
	image_speed= 0
	shaker= 10
	b_al= 1
	sfx1= caster_load("music/sfx/sfx_abreak.ogg")
	sfx2= caster_load("music/sfx/sfx_abreak2.ogg")
	caster_play(sfx1, 0.8, 0.95)

func _on_outside_room():
	shkx= shaker * choose(1, -1)
	shky= shaker * choose(1, -1)
	if(shaker > 0) shaker--
	draw_set_color(0)
	draw_set_alpha(b_al)
	draw_rectangle(-10, -10, 999, 999, 0)
	draw_set_alpha(1)
	draw_sprite_ext(2405/* spr_barriercut */, 0, -bx + shkx, y + shky, 1, 1, 0, 16777215, 1)
	draw_sprite_ext(2405/* spr_barriercut */, 1, bx + shkx, y + shky, 1, 1, 0, 16777215, 1)
	timer++
	if(timer == 60) caster_play(sfx2, 0.8, 0.95)
	if(timer >= 60) {
	    bx+= bxspeed
	    bxspeed+= 2
	}
	if(timer == 110) {
	    GS.msc= 0
	    GS.typer= 21
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "The barrier was&destroyed^7.%%"
	    instance_create(50, 50, 782/* OBJ_WRITER */)
	}
	if(timer == 310 and instance_exists(1684/* obj_asriel_overworldanim */)) {
	    obj_asriel_overworldanim.powered= 0
	    obj_asriel_overworldanim.con= 20
	}
	if(timer >= 310) b_al-= 0.02
	if(timer >= 370) {
	    caster_free(-3)
	    instance_destroy()
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
