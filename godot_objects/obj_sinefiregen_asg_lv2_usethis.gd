# Auto-converted from GameMaker: obj_sinefiregen_asg_lv2_usethis
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	side= 0
	s= 0
	off= 0
	hitside= 0
	$Alarm1.start((30) / 30.0)
	s= random(360)

func _gm_event_2_1():
	sidedam= instance_create(0, 0, 465/* obj_sidedam */)
	if(obj_heart.x + 6 < 320) sidedam.side= 0
	else  sidedam.side= 1
	sidedam.len= 75
	sidedam.wait= 35
	$Alarm1.start((50) / 30.0)

func _on_destroy():
	s+= 1.5
	fire= instance_create(GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2 + cos(off / 6) * 20, 130 + sin(off / 5) * 12 + sin(off / 5) * 12, 474/* obj_sinefire_asghelix */)
	fire.sf= 3.5
	fire.velocity.y= 4
	fire.s= s
	side++
	if(side >= 4) side= choose(-2, -1)
	if(side <= 1) fire.sv= 10
	if(side >= 1) fire.sv= -10
	$Alarm0.start((5) / 30.0)
	off++
	fire.velocity.y+= sin(off / 6) * 0.2

func _process_end(delta: float):
	if(GS.turntimer < 0) instance_destroy()

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
