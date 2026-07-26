# Auto-converted from GameMaker: obj_sansbullet_parent
extends Node2D

func _ready():
	innate_karma= 6

func _on_alarm_0_timeout():
	event_user(7)

func _gm_event_7_17():
	if(instance_exists(517/* obj_sansb_body */)) {
	    reduce= 0
	    if(obj_sansb_body.lac < 4) {
	        if(obj_sansb_body.damageturn == 0) {
	            GS.km+= innate_karma
	            if(innate_karma >= 2) innage_karma= 1
	            if(innate_karma >= 3) innate_karma= 2
	            if(innate_karma >= 5) innate_karma= 3
	            // obj_sansb_body
	            with(517) event_user(2)
	        }
	    } else  {
	        if(GS.hp >= 60) {
	            GS.km+= innate_karma
	            if(innate_karma >= 2) innage_karma= 1
	            if(innate_karma >= 3) innate_karma= 2
	            if(innate_karma >= 5) innate_karma= 3
	            // obj_sansb_body
	            with(517) event_user(2)
	        } else  {
	            if(GS.hp >= 30) {
	                GS.km++
	                // obj_sansb_body
	                with(517) event_user(2)
	            } else  {
	                // obj_sansb_body
	                with(517) event_user(2)
	            }
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
