# Auto-converted from GameMaker: obj_sugarbullet
extends Node2D

func _ready():
	size= 0.2
	ang= 2 + random(2) * choose(1, -1)
	idealspot= 1
	$Alarm0.start((1) / 30.0)
	velocity.y= -4 - random(1)
	gravity= 0.25 + random(0.02)
	scale.x= size
	scale.y= size

func _gm_event_2_2():
	velocity.x= 0
	x= view_xview[0] + idealspot * 20 + 10

func _on_destroy():
	g= 10 + random(6)
	velocity.x= (view_xview[0] + idealspot * 20 + 10 - x) / g
	$Alarm2.start((g) / 30.0)

func _process(delta: float):
	if(velocity.y > 0) z_index= 2
	if(size < 1) size+= 0.04
	scale.x= size
	scale.y= size
	rotation_degrees+= ang
	if(y > view_yview[0] + 250) instance_destroy()
	if(x < view_xview[0] - 10) instance_destroy()
	if(x > view_xview[0] + 320) instance_destroy()

func _on_alarm_0_timeout():
	event_user(1)
	// other
	with(-2) {
	    if(eligible == 1) event_user(0)
	}
	snd_play(106/* snd_noise */)

func _gm_event_7_11():
	i= 0
	while(i < 4) {
	    sug= instance_create(x, y, 1178/* obj_sugarbullet_drop */)
	    sug.frame= i
	    sug.rotation_degrees= rotation_degrees
	    sug.ang= ang
	    i++
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
