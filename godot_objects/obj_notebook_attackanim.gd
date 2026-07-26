# Auto-converted from GameMaker: obj_notebook_attackanim
extends Node2D

func _ready():
	siner= 0
	scale.x= 2
	scale.y= 2
	timer= 0
	bookspin= caster_load("music/sfx_bookspin.ogg")
	caster_play(bookspin, 1, 0.9)
	crit= 0

func _process(delta: float):
	timer++
	siner++
	if(timer < 15) scale.x= cos(siner / 2) * 2
	if(timer == 15) {
	    snd_play(46/* snd_punchstrong */)
	    if(crit == 1) snd_play(117/* snd_saber3 */)
	    image_speed= 1
	    scale.x= 0.5
	    scale.y= 0.5
	    sprite_index= 750/* spr_frypan_impact */
	}
	if(timer > 15) {
	    scale.x+= 0.5
	    scale.y+= 0.5
	    if(scale.x > 2) modulate.a-= 0.2
	    if(modulate.a < 0.1) {
	        caster_free(bookspin)
	        instance_destroy()
	    }
	}

func _gm_event_7_15():
	flasher= 1
	image_blend= merge_color(16777215, 65535, 0.5)
	crit= 1

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
