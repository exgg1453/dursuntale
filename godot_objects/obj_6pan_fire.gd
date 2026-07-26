# Auto-converted from GameMaker: obj_6pan_fire
# GM parent: obj_6bparent
extends Node2D

func _ready():
	frame= 0
	image_speed= 0.334
	party= 4
	scale.x= 2
	scale.y= 2
	velocity.y= -9
	gravity= 0.3
	velocity.x= 2 - random(4)
	visible= 0
	type= 0
	shakeboy= 0
	shake= 0

func _process(delta: float):
	if(velocity.y > 0) z_index= -13
	visible= 1
	if(y > get_viewport_rect().size.y) instance_destroy()

func _on_alarm_0_timeout():
	if(type == 0) event_inherited()
	if(type == 1) {
	    snd_stop(155)
	    snd_play(155/* snd_heal_c */)
	    held= 0
	    if(held == 0 and GS.my_hp <= 10) {
	        GS.my_hp+= 10
	        held= 1
	    }
	    if(held == 0 and GS.my_hp <= 20) {
	        GS.my_hp+= 6
	        held= 1
	    }
	    if(held == 0 and GS.my_hp <= 30) {
	        GS.my_hp+= 4
	        held= 1
	    }
	    if(held == 0 and GS.my_hp <= 40) {
	        GS.my_hp+= 2
	        held= 1
	    }
	    if(held == 0 and GS.my_hp <= 50) {
	        GS.my_hp++
	        held= 1
	    }
	    instance_destroy()
	}

func _gm_event_7_15():
	shakeboy= 1

func _gm_event_7_14():
	if(type == 0) {
	    shakeboy= 0
	    y+= 18
	    image_blend= 65280
	    sprite_index= 2222/* spr_6pan_egg */
	    type= 1
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
