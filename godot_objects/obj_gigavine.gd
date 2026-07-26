# Auto-converted from GameMaker: obj_gigavine
# GM parent: obj_floweybullet_parent
extends Node2D

func _ready():
	visible= 0
	scale.x= 0.1
	con= 0
	saved= 0
	memorymode= 0
	active= 1
	snd_stop(14)
	snd_play(14/* snd_spearrise */)
	snd_stop(339)
	snd_play(339/* mus_sfx_yowl */)

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(active == 1) {
	    if(scale.x < 1) {
	        scale.x+= 0.08
	        if(scale.x > 0.2) visible= 1
	    } else  {
	        if(con == 0) {
	            scale.x= 1
	            con= 2
	            $Alarm4.start((10) / 30.0)
	        }
	    }
	    if(con == 3) {
	        con= 4
	        $Alarm4.start((3) / 30.0)
	    }
	    if(con == 4)
	        image_blend= make_color_rgb(255, 160 + alarm[4] * 23.3333333333333, 160 + alarm[4] * 23.3333333333333)
	    if(con == 5) {
	        modulate.a-= 0.2
	        if(memorymode == 0 and modulate.a < 0.1) instance_destroy()
	        if(memorymode == 1 and modulate.a < 0.1) {
	            visible= 0
	            active= 0
	        }
	    }
	}

func _on_alarm_0_timeout():
	if(active == 1 and modulate.a > 0.3) event_inherited()

func _gm_event_7_15():
	if(saved == 0) instance_destroy()
	else  {
	    active= save_active
	    visible= save_visible
	    scale.x= save_xscale
	    image_blend= save_blend
	    modulate.a= save_alpha
	    con= save_con
	    $Alarm4.start((save_alarm) / 30.0)
	}

func _gm_event_7_14():
	save_active= active
	save_visible= visible
	save_xscale= scale.x
	save_blend= image_blend
	save_alpha= modulate.a
	save_con= con
	save_alarm= alarm[4]
	saved= 1

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
