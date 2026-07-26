# Auto-converted from GameMaker: obj_counterscroller
extends Node2D

func _ready():
	fakey= 0
	seg= -107
	fakev= 0
	fakey= 19
	segno= 100
	on= 1
	con= 0
	timer= 0
	shake= 1

func _gm_event_7_10():
	shake= 2
	con= 1

func _on_outside_room():
	i= 0
	while(i < 20) {
	    j= -(seg + i)
	    if(j > 0) {
	        if(j < segno)
	            draw_sprite(1714/* spr_countersegment */, 0, x, y - 360 + fakey + i * 40)
	        if(j == segno)
	            draw_sprite(1713/* spr_countertop */, 0, x, y - 360 + fakey + i * 40)
	    }
	    i++
	}
	fakey+= fakev
	if(fakey > 40) {
	    fakey-= 40
	    if(on == 1) seg--
	}
	if(fakey < -40) {
	    fakey+= 40
	    if(on == 1) seg++
	}
	if(con == 1) {
	    fakey++
	    timer++
	    if(timer >= 17) {
	        timer= 0
	        con= 1.5
	    }
	}
	if(con == 1.5) {
	    timer++
	    if(timer > 30) {
	        timer= 0
	        con= 2
	    }
	}
	if(con == 2) {
	    x= xstart + random(shake) - shake / 2
	    y= ystart + random(shake) - shake / 2
	    timer++
	    if(timer > 60) {
	        x= xstart
	        y= ystart
	        con= 3
	        fakev= -1
	    }
	}
	if(con == 3) {
	    fakev-= 0.25
	    if(fakev <= -15) {
	        fakev= -15
	        on= 0
	        con= 4
	        timer= 0
	    }
	}
	if(con == 4) {
	    timer++
	    if(timer > 150) con= 5
	}
	if(con == 5) {
	    fakev= 0
	    con= 6
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
