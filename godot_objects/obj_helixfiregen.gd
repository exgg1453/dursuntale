# Auto-converted from GameMaker: obj_helixfiregen
extends Node2D

func _ready():
	mys= 0
	mysadd= 0.1
	mysv= 4
	mysf= 4
	$Alarm0.start((1) / 30.0)
	count= 0
	selfspeed= random(1.5)
	selfspeed2= selfspeed - 0.1 + random(0.1)

func _on_destroy():
	mys+= mysadd
	hl= instance_create(x, y, 474/* obj_sinefire_asghelix */)
	hl.s= mys
	hl.sf= mysf
	hl.sv= mysv
	hl.velocity.y= 5.5 + selfspeed
	hl2= instance_create(x, y, 474/* obj_sinefire_asghelix */)
	hl2.s= mys
	hl2.sf= mysf
	hl2.sv= -mysv
	hl2.velocity.y= 5.5 + selfspeed2
	$Alarm0.start((2) / 30.0)
	count++
	if(count > 15) instance_destroy()

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
