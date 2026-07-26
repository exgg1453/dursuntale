# Auto-converted from GameMaker: blt_firehelix1
# GM parent: blt_parent
extends Node2D

func _ready():
	dmg= 0
	bullettype= 0
	image_speed= 0.5
	gravity= 0.12
	gravity_direction= 270
	velocity.y= 0.7
	r= round(random(1))
	$Alarm0.start((10) / 30.0)
	$Alarm1.start((1) / 30.0)
	$Alarm2.start((4) / 30.0)
	$Alarm3.start((8) / 30.0)
	sterile= 0
	if(y > GS.idealborder[3] - 20) y-= 20
	if(y < GS.idealborder[2] + 20) y+= 20
	h= 0

func _process(delta: float):
	velocity.x= sin(obj_time.time / 10) * 4
	if(r == 0) velocity.x= -sin(obj_time.time / 10) * 4
	h++

func _on_alarm_0_timeout():
	y= yprevious
	velocity.y= 0
	gravity_direction= 0
	if(r == 1) gravity_direction= 180

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
