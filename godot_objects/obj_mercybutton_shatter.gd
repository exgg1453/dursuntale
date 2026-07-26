# Auto-converted from GameMaker: obj_mercybutton_shatter
extends Node2D

func _gm_event_7_10():
	if(not instance_exists(184/* obj_shaker */)) scr_shake(6, 6, 2)
	snd_play(21/* snd_impact */)
	snd_play(30/* snd_break2 */)
	i= 0
	visible= 0
	repeat(2)  {
	    i= 0
	    repeat(6)  {
	        iii= instance_create(x + 55, y + 21, 479/* obj_mercybutton_part */)
	        iii.frame= i
	        iii.velocity.x= -14 - random(26)
	        iii.friction= 0.1
	        iii.aa= 7 + random(4)
	        i++
	    }
	    repeat(5)  {
	        iii= instance_create(x + 55, y + 21, 479/* obj_mercybutton_part */)
	        iii.frame= i
	        iii.velocity.x= 10 + random(30)
	        iii.friction= 0.1
	        iii.aa= -8 - random(4)
	        i++
	    }
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
