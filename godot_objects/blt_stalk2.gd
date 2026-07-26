# Auto-converted from GameMaker: blt_stalk2
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	frame= 0
	image_speed= 0
	velocity.y= -4
	friction= 0.1
	sum= scr_monstersum()
	if(sum > 1) velocity.y= 4.2
	sinr= 0
	c= 0
	dmg= 6
	$Alarm0.start((40) / 30.0)

func _gm_event_2_4():
	instance_destroy()

func _gm_event_2_2():
	velocity.y= 2
	friction= -0.2
	$Alarm4.start((60) / 30.0)
	if(sum > 1) velocity.y= -2

func _on_destroy():
	speed= 0
	$Alarm2.start((30) / 30.0)
	$Alarm3.start((6) / 30.0)
	y= round(y)
	x= round(x)

func _process(delta: float):
	sinr++
	if(c == 0) x+= sin(sinr / 10) / 2
	else  x+= cos(sinr / 10) / 2

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
