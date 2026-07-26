# Auto-converted from GameMaker: obj_6knife
# GM parent: obj_6bparent
extends Node2D

func _ready():
	relx= 0
	rely= 0
	inita= 0
	visible= 0
	type= 0
	shake= 0

func _process(delta: float):
	if(type == 0 or type == 2) {
	    if(instance_exists(1626/* obj_6knife_act */)) {
	        x= relx + obj_6knife_act.x
	        y= rely + obj_6knife_act.y
	        rotation_degrees= obj_6knife_act.rotation_degrees + inita
	    }
	    if(y > get_viewport_rect().size.y + 60) {
	        y-= sprite_width * 6
	        rely-= sprite_width * 6
	    }
	    if(y < -60) {
	        y+= sprite_width * 6
	        rely+= sprite_width * 6
	    }
	    if(x > get_viewport_rect().size.x + 60) {
	        x-= sprite_width * 7
	        relx-= sprite_width * 7
	    }
	    if(x < -60) {
	        x+= sprite_width * 7
	        relx+= sprite_width * 7
	    }
	    if(type == 2) {
	        shake+= 0.2
	        x+= random(shake) - random(shake)
	        y+= random(shake) - random(shake)
	    }
	}
	if(type == 1) {
	    dd= distance_to_object(1581)
	    move_towards_point(obj_vsflowey_heart.x + 8, obj_vsflowey_heart.y + 8, 1)
	    if(dd < 240) speed= 2
	    if(dd < 180) speed= 3
	    if(dd < 120) speed= 4
	    if(dd < 60) speed= 5
	    if(dd < 30) speed= 6
	    rotation_degrees+= speed
	}

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
	type= 2

func _gm_event_7_14():
	type= 1
	sprite_index= 2231/* spr_6bandage_big */
	image_blend= 65280

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
