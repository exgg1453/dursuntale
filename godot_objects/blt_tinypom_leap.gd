# Auto-converted from GameMaker: blt_tinypom_leap
# GM parent: blt_parent
extends Node2D

func _ready():
	dmg= 0
	image_speed= 0.334
	barked= 0
	$Alarm1.start((10) / 30.0)
	y= GS.idealborder[3] - sprite_height

func _gm_event_1_0():
	GS.turntimer= -1
	GS.mnfight= 3

func _gm_event_2_3():
	$Alarm3.start((4) / 30.0)
	if(instance_exists(743/* obj_heart */)) {
	    if(obj_heart.x < x) velocity.x-= 0.4
	    else  velocity.x+= 0.4
	    if(gravity == 0 and obj_heart.y < y and abs(x - obj_heart.x) < 50) {
	        gravity= 0.22
	        gravity_direction= 270
	        velocity.y= -5
	        sprite_index= 104/* spr_tinypomjump */
	    }
	}

func _gm_event_2_2():
	sprite_index= 100/* spr_tinypomwag */

func _gm_event_2_1():
	if(barked < 2) {
	    sprite_index= 103/* spr_tinypombark */
	    $Alarm2.start((4) / 30.0)
	    $Alarm1.start((8) / 30.0)
	    snd_play(41/* snd_pombark */)
	    barked++
	} else  {
	    $Alarm3.start((10) / 30.0)
	    sprite_index= 99/* spr_tinypomwalk */
	}

func _process_end(delta: float):
	if(GS.turntimer < 1) {
	    GS.turntimer= -1
	    GS.mnfight= 3
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	y= yprevious - velocity.y
	velocity.y= 0
	gravity= 0
	barked= 1
	friction= 0.2
	sprite_index= 100/* spr_tinypomwag */
	$Alarm3.start((-1) / 30.0)
	$Alarm1.start((6) / 30.0)

func _on_outside_room():
	draw_self_border()

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
