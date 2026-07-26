# Auto-converted from GameMaker: obj_mettaton_flightdress
extends Node2D

func _ready():
	siner= 0
	image_speed= 0.5
	sing= 0
	gm= 0
	offsing= 0
	middle= 0

func _on_destroy():
	if(sing > 0 and sing < 12) {
	    event_user(1)
	    if(offsing == 1) $Alarm0.start((75) / 30.0)
	    if(offsing == 0) $Alarm0.start((75) / 30.0)
	}

func _process_end(delta: float):
	siner++
	y+= sin(siner / 10) / 2
	if(instance_exists(1210/* obj_multitileevent */)) {
	    if(middle == 1) {
	        xx= view_xview[0]
	        if(xx < 0) xx= 0
	        if(x < xx + 60) {
	            x+= 3
	            if(instance_exists(1205/* obj_songwriter */))
	                obj_songwriter.x+= 3
	        }
	        if(x > xx + 80) {
	            x-= 3
	            if(instance_exists(1205/* obj_songwriter */))
	                obj_songwriter.x-= 3
	        }
	    }
	    if(middle == 2) {
	        if(xx < 0) xx= 0
	        if(x < xx + 150) x+= 3
	        if(x > xx + 170) x-= 3
	    }
	}

func _gm_event_7_11():
	sing++
	gm= instance_create(x + 40, 20, 1205/* obj_songwriter */)
	gm.gggg= 1
	gm.myfont= 2
	if(offsing == 1) gm.y= 21
	if(sing == 1) gm.sting= "Oh my love"
	if(sing == 2) gm.sting= "Has fallen#down"
	if(sing == 3) gm.sting= "Now in tears"
	if(sing == 4) gm.sting= "We all will#drown"
	if(sing == 5) gm.sting= "Colored#tiles"
	if(sing == 6) gm.sting= "Make them#a fool"
	if(sing == 7) gm.sting= "If only they"
	if(sing == 8) gm.sting= "Still knew#the rules"
	if(sing == 9) gm.sting= "Well that#was"
	if(sing == 10) gm.sting= "A sorry try"
	if(sing == 11) gm.sting= "Now let\'s#watch"
	if(sing == 12) gm.sting= "Them fry"
	if(offsing == 1) offsing= 0
	else  offsing= 1
	if(sing == 1) $Alarm0.start((75) / 30.0)

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
