# Auto-converted from GameMaker: obj_eggcarton_pl
extends Node2D

func _ready():
	siner= random(360)
	$Alarm0.start((2) / 30.0)
	life= 3
	image_speed= 0
	velocity.y= 0.5

func _on_destroy():
	instance_create(x + 6 + random(20), y + 12 + random(8), 429/* obj_eggbullet_pl */)
	$Alarm0.start((3) / 30.0)

func _process(delta: float):
	x= GS.idealborder[0] + 70 + sin(siner / 20) * 80
	y+= sin(siner / 4) * 2
	siner++

func _on_alarm_0_timeout():
	event_user(0)
	// other
	with(-2) instance_destroy()

func _gm_event_7_10():
	life--
	if(life < 7) frame= 1
	if(life < 4) frame= 2
	if(life < 1) instance_destroy()

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
