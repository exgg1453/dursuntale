# Auto-converted from GameMaker: blt_growbullet
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	angle= 0
	angleadd= 0
	dmg= 0
	image_speed= 0
	move_towards_point(get_viewport_rect().size.x / 2, get_viewport_rect().size.y / 2, 0.5)
	$Alarm7.start((45) / 30.0)
	friction= -0.25
	blue= 0

func _gm_event_2_7():
	instance_destroy()

func _process(delta: float):
	angle= direction + 90
	rotation_degrees= angle
	scale.x= speed / 3
	scale.y= speed / 3
	if(blue == 3) {
	    alarm[7]+= 0.5
	    scale.x= speed / 2
	    scale.y= speed / 2
	}
	if(GS.turntimer < 1) GS.mnfight= 3
	if(alarm[7] < 10) modulate.a-= 0.1

func _on_alarm_0_timeout():
	if(blue != 3) scr_damagestandard(blue, 0, 0, 0, 0)
	else  {
	    if(instance_exists(256/* obj_woshua */)) {
	        obj_woshua.mercymod= 200
	        obj_woshua.clean= 2
	    }
	    if(GS.hp < GS.maxhp) {
	        GS.hp++
	        if(GS.hp > GS.maxhp) GS.hp= GS.maxhp
	    }
	    snd_play(109/* snd_power */)
	}
	instance_destroy()

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
