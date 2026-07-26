# Auto-converted from GameMaker: obj_darkroom_event
extends Node2D

func _ready():
	lock= 0
	locktime= 0

func _gm_event_2_4():
	get_tree().change_scene_to_file("res://godot_rooms/78.tscn")

func _process_end(delta: float):
	if(instance_exists(1570/* obj_mainchara */) and (obj_mainchara.x < 440 or obj_mainchara.x > 460) and obj_mainchara.y > 526)
	    obj_mainchara.y= 526

func _process_begin(delta: float):
	if(instance_exists(1570/* obj_mainchara */) and (obj_mainchara.x < 440 or obj_mainchara.x > 460) and obj_mainchara.y > 526)
	    obj_mainchara.y= 526

func _process(delta: float):
	if(instance_exists(1570/* obj_mainchara */)) {
	    if((obj_mainchara.x < 440 or obj_mainchara.x > 460) and obj_mainchara.y > 526)
	        obj_mainchara.y= 526
	    if(obj_mainchara.x > 170 and obj_mainchara.y > 130 and obj_mainchara.x < get_viewport_rect().size.x - 170 and obj_mainchara.y < get_viewport_rect().size.y - 160 and lock == 0) {
	        tone= caster_load("music/creepy_ambience.ogg")
	        tone1= caster_loop(385, 0, 1.1)
	        tone2= caster_loop(385, 0, 1)
	        tone3= caster_loop(385, 0, 0.9)
	        tonevol= 0
	        lock= 1
	    } else  {
	        if(obj_mainchara.x < 180) obj_mainchara.x= 180
	        if(obj_mainchara.x > get_viewport_rect().size.x - 180)
	            obj_mainchara.x= get_viewport_rect().size.x - 180
	        if(obj_mainchara.y < 170) obj_mainchara.y= 170
	    }
	    if(lock == 1) {
	        if(locktime >= 250) {
	            tonevol= (locktime - 250) / 250
	            caster_set_volume(385, tonevol)
	        }
	        obj_mainchara.x= get_viewport_rect().size.x / 2
	        obj_mainchara.y= get_viewport_rect().size.y / 2
	        if(obj_mainchara.moving == 1) locktime++
	        if(locktime >= 550) {
	            caster_free(tone)
	            snd_play(106/* snd_noise */)
	            obj_mainchara.visible= 0
	            GS.interact= 1
	            $Alarm4.start((90) / 30.0)
	            lock= 2
	        }
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
