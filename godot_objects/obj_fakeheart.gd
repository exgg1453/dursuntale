# Auto-converted from GameMaker: obj_fakeheart
extends Node2D

func _ready():
	GS.sp= GS.asp
	movement= 1
	hgo= 0
	vgo= 0

func _process(delta: float):
	GS.invc--
	if(GS.invc > 0) image_speed= 0.5
	else  {
	    frame= 0
	    image_speed= 0
	}
	if(obj_time.left == 1 and movement == 1) {
	    if(keyboard_multicheck(16/* SHIFT */) == 1)
	        x-= GS.sp / 2
	    else  x-= GS.sp
	}
	if(obj_time.right == 1 and movement == 1) {
	    if(keyboard_multicheck(16/* SHIFT */) == 1)
	        x+= GS.sp / 2
	    else  x+= GS.sp
	}
	if(obj_time.up == 1 and movement == 1) {
	    if(keyboard_multicheck(16/* SHIFT */) == 1)
	        y-= GS.sp / 2
	    else  y-= GS.sp
	}
	if(obj_time.down == 1 and movement == 1) {
	    if(keyboard_multicheck(16/* SHIFT */) == 1)
	        y+= GS.sp / 2
	    else  y+= GS.sp
	}
	if(GS.hp < 1) script_execute(158/* scr_gameoverb */)

func _on_alarm_0_timeout():
	y= other.y - sprite_height

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
