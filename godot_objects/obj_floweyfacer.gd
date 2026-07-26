# Auto-converted from GameMaker: obj_floweyfacer
extends Node2D

func _ready():
	GS.faceemotion= 0
	GS.facing= 2
	type= 0
	scale.x= 2
	scale.y= 2
	ns= caster_load("music/f_noise.ogg")
	moved= 0
	helltimer= 0
	set= 0

func _process(delta: float):
	if(type == 0 or type == 3) {
	    image_speed= 0
	    modulate.a= 1
	    scale.x= 2
	    scale.y= 2
	    if(type == 0) {
	        if(set == 0) sprite_index= 2197/* spr_tv_floweyface_seta */
	        if(set == 1) sprite_index= 2198/* spr_tv_floweyface_setb */
	        if(set == 2) sprite_index= 2199/* spr_tv_floweyface_setc */
	        frame= GS.faceemotion
	    }
	    if(type == 3) {
	        image_speed= 0.5
	        sprite_index= 2200/* spr_tv_floweyface_everyone */
	    }
	    if(moved != 2 and caster_is_playing(ns)) caster_stop(ns)
	    if(moved == 2) {
	        scale.x= 1.98 + random(0.02)
	        scale.y= 1.98 + random(0.02)
	        x= xx + random(1)
	        y= yy + random(1)
	        helltimer++
	        if(helltimer < 50 and caster_is_playing(ns))
	            caster_stop(ns)
	        if(helltimer == 50 and not caster_is_playing(ns))
	            caster_loop(ns, 1, 1)
	        if(helltimer >= 50) {
	            sprite_index= 2206/* spr_noise */
	            frame= random(99)
	            scale.x= 0.86
	            scale.y= 0.58
	        }
	        if(helltimer >= 56) {
	            helltimer= -100 - floor(random(320))
	            if(caster_is_playing(ns)) caster_stop(ns)
	        }
	    }
	}
	if(type == 1) {
	    modulate.a= 1
	    sprite_index= 2206/* spr_noise */
	    scale.x= 0.86
	    scale.y= 0.58
	    image_speed= 1
	    if(not caster_is_playing(ns)) caster_loop(ns, 1, 1)
	}
	if(type == 2) {
	    if(caster_is_playing(ns)) caster_stop(ns)
	    modulate.a= 0
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
