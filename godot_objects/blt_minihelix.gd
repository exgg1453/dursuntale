# Auto-converted from GameMaker: blt_minihelix
# GM parent: blt_parent
extends Node2D

func _ready():
	dmg= 0
	bullettype= 0
	image_speed= 0.5
	gravity= 0.06
	gravity_direction= 270
	velocity.y= abs(sin(obj_time.time / 20) * 0.95)
	r= round(random(1))
	$Alarm0.start((10) / 30.0)
	$Alarm1.start((1) / 30.0)
	$Alarm2.start((4) / 30.0)
	$Alarm3.start((8) / 30.0)
	sterile= 0
	h= 0
	dink= 0

func _process(delta: float):
	velocity.x= sin(h / 5) * 8
	if(r == 0) velocity.x= -sin(h / 5) * 8
	h++

func _on_alarm_0_timeout():
	gravity= 0
	velocity.y= -0.2
	snd_play(106/* snd_noise */)
	dink++
	y= yprevious
	if(dink == 3) instance_destroy()

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
