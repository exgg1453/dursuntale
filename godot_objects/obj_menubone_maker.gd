# Auto-converted from GameMaker: obj_menubone_maker
extends Node2D

func _ready():
	if(instance_exists(505/* obj_menubone */) or instance_exists(504/* obj_menubone_bottom */)) {
	    instance_destroy()
	    exit
	} else  {
	    h= 0
	    if(instance_exists(519/* obj_sansb */)) {
	        if(obj_sansb.hit_try == 14) h= 1
	        if(obj_sansb.hit_try == 15) h= 1
	        if(obj_sansb.hit_try == 16) h= 2
	        if(obj_sansb.hit_try == 17) h= 2
	        if(obj_sansb.hit_try >= 23) {
	            instance_destroy()
	            exit
	        }
	    }
	    if(h != 2) $Alarm0.start((1) / 30.0)
	    if(h != 1) {
	        $Alarm1.start((3) / 30.0)
	        $Alarm2.start((20) / 30.0)
	        $Alarm3.start((3) / 30.0)
	        $Alarm4.start((20) / 30.0)
	    }
	    $Alarm5.start((50) / 30.0)
	    exit
	}

func _gm_event_2_5():
	instance_destroy()

func _gm_event_2_4():
	mbb= instance_create(-20, -20, 504/* obj_menubone_bottom */)
	mbb.spot= 3
	mbb.myspeed= -5
	instance_destroy()

func _gm_event_2_3():
	mbb= instance_create(-20, -20, 504/* obj_menubone_bottom */)
	mbb.spot= 2
	mbb.myspeed= -5

func _gm_event_2_2():
	mbb= instance_create(-20, -20, 504/* obj_menubone_bottom */)
	mbb.spot= 1
	mbb.myspeed= -5

func _gm_event_2_1():
	mbb= instance_create(-20, -20, 504/* obj_menubone_bottom */)
	mbb.spot= 0
	mbb.myspeed= -5

func _on_destroy():
	instance_create(-20, -20, 505/* obj_menubone */)

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
