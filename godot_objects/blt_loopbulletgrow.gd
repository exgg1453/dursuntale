# Auto-converted from GameMaker: blt_loopbulletgrow
# GM parent: blt_parent
extends Node2D

func _ready():
	dmg= 0
	radius= 1
	nxadd= 0
	xadd= 0
	yadd= 0
	direction= 0
	speed= 4
	idealradius= 10
	anglechange= 1
	blue= 0
	specialtimer= 999
	cl= 1

func _process_end(delta: float):
	if(x >= GS.idealborder[1]) instance_destroy()
	if(GS.turntimer < 1) instance_destroy()

func _process(delta: float):
	radchange= 0
	if(specialtimer > 0) {
	    if(radius < idealradius) {
	        radius+= 2
	        radchange= 1
	    }
	    if(radius > idealradius) radius= idealradius
	} else  {
	    if(radius > idealradius) {
	        radius-= 2
	        radchange= 2
	    }
	    if(radius < idealradius) radius= idealradius
	}
	if(radchange == 1) {
	    x+= lengthdir_x(2, direction - 90)
	    y+= lengthdir_y(2, direction - 90)
	}
	if(radchange == 2) {
	    x+= lengthdir_x(-2, direction - 90)
	    y+= lengthdir_y(-2, direction - 90)
	}
	circ= 6.28318530717959 * radius
	anglechange= 360 / circ / speed
	direction+= anglechange
	if(nxadd < xadd) nxadd+= 0.125
	x+= nxadd
	y+= yadd
	specialtimer--
	if(specialtimer < 1) idealradius= 0.1

func _on_alarm_0_timeout():
	if(velocity.y > 0) instance_destroy()

func _gm_event_7_0():
	queue_free()

func _on_outside_room():
	if(blue == 1 and sprite_index != 153) sprite_index= 153/* spr_smheartbulletb */
	if(cl == 0) draw_self_border(8, 8)
	else  draw_sprite(sprite_index, frame, x, y)

func _gm_event_9_74():
	if(GS.debug == 1) {
	    if(cl == 0) cl= 1
	    else  cl= 0
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
