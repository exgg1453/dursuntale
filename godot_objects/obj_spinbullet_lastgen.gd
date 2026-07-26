# Auto-converted from GameMaker: obj_spinbullet_lastgen
extends Node2D

func _ready():
	direction= 0
	speed= 27
	$Alarm0.start((37) / 30.0)
	frame= 0

func _on_destroy():
	instance_destroy()

func _process(delta: float):
	if(frame == 0) {
	    // obj_asgore_lastcutscene
	    with(493)
	        specbullet= instance_create(obj_spinbullet_lastgen.x, obj_spinbullet_lastgen.y, 491/* obj_spinbullet_last */)
	}
	if(frame > 0) instance_create(x, y, 491/* obj_spinbullet_last */)
	frame++
	direction-= 10
	snd_play(92/* snd_chug */)

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
