# Auto-converted from GameMaker: obj_darkness_undyne
extends Node2D

func _ready():
	glowamt= 0.5
	glowyes= 1
	maxvol= 1
	if(GS.plot > 117) instance_destroy()

func _on_outside_room():
	if(instance_exists(1570/* obj_mainchara */)) {
	    x1= obj_mainchara.x - 10
	    x2= obj_mainchara.x + 30
	    y1= obj_mainchara.y - 5
	    y2= obj_mainchara.y + 35
	    draw_sprite_ext(1556/* spr_darkhalo_big */, 0, x1, y1, 1, 1, 0, 16777215, glowamt)
	    draw_set_alpha(glowamt)
	    draw_set_color(0)
	    draw_set_alpha(1)
	    if(glowyes == 1) {
	        glowamt= 0.5 + obj_mainchara.x / 1200
	        curvol= maxvol - obj_mainchara.x / 600
	        if(curvol <= 0) curvol= 0
	        caster_set_volume(GS.currentsong, curvol)
	    }
	    if(glowyes == 2) {
	        glowamt-= 0.02
	        if(glowamt <= 0) instance_destroy()
	    }
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
