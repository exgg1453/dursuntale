# Auto-converted from GameMaker: blt_dummymissle
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	dmg= 0
	move_towards_point(obj_heart.x, obj_heart.y, 1)
	currentdir= 0
	dirspeed= 6
	speed= 1
	friction= -0.1
	juice= 90
	image_speed= 0
	noboom= 0
	defeat= 0
	create= 0
	destroy= 0
	normal= 0

func _process(delta: float):
	if(speed > 6) friction= 0
	if(juice > 0) {
	    rotation_degrees= direction
	    curdir= direction
	    idealdir= point_direction(x, y, obj_heart.x + 10, obj_heart.y + 10)
	    facingMinusTarget= curdir - idealdir
	    angleDiff= facingMinusTarget
	    if(abs(facingMinusTarget) > 180) {
	        if(curdir > idealdir)
	            angleDiff= -1 * (360 - curdir + idealdir)
	        else  angleDiff= 360 - idealdir + curdir
	    }
	    leastAccurateAim= 4
	    if(abs(angleDiff) > leastAccurateAim) {
	        dirspeed= 1
	        angleDiff2= abs(angleDiff)
	        if(angleDiff2 > 10) dirspeed= 2
	        if(angleDiff2 > 20) dirspeed= 3
	        if(angleDiff2 > 30) dirspeed= 4
	        if(angleDiff2 > 40) dirspeed= 5
	        if(angleDiff2 > 50) dirspeed= 6
	        if(angleDiff2 > 60) dirspeed= 7
	        if(angleDiff2 > 70) dirspeed= 8
	        if(angleDiff2 > 80) dirspeed= 9
	        if(angleDiff2 > 90) dirspeed= 10
	        if(angleDiff2 > 100) dirspeed= 11
	        if(angleDiff < 0) dirspeed= -dirspeed
	        direction-= dirspeed
	    }
	}
	juice--
	if(juice < 60) frame= 1
	if(juice < 30) frame= 2
	if(juice < 0) frame= 3
	if(juice < -60 and destroy == 0) destroy= 1

func _on_alarm_0_timeout():
	if(normal == 1 and destroy == 0) {
	    snd_play(21/* snd_impact */)
	    destroy= 1
	    normal= 0
	    scr_damagestandard_x()
	}

func _gm_event_7_0():
	noboom= 1
	instance_destroy()

func _on_outside_room():
	if(normal == 1) {
	    draw_sprite_ext(sprite_index, frame, x, y, 1, 1, rotation_degrees, 16777215, 1)
	    draw_sprite_ext(108/* spr_dummymissle_sh */, frame, x, y, 1, 1, rotation_degrees, 16777215, 1)
	}
	if(create < 6) {
	    draw_sprite_ext(109/* spr_dummymissle_shot */, 6 - create, x, y, 1, 1, rotation_degrees, 16777215, 1)
	    create++
	    if(create >= 6) normal= 1
	}
	if(destroy >= 1) {
	    x+= random(2) - random(2)
	    y+= random(2) - random(2)
	    if(destroy >= 2) {
	        scale.x+= 0.25
	        scale.y+= 0.25
	    }
	    draw_sprite_ext(109/* spr_dummymissle_shot */, destroy - 1, x, y, scale.x, scale.y, rotation_degrees, 16777215, modulate.a)
	    destroy++
	    if(destroy >= 8) instance_destroy()
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
