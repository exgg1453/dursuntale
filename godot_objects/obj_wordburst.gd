# Auto-converted from GameMaker: obj_wordburst
extends Node2D

func _ready():
	size= 1
	alpha= 1
	step= 0
	snd_play(21/* snd_impact */)
	if(not instance_exists(184/* obj_shaker */)) scr_shake(2, 2, 2)

func _process(delta: float):
	step++
	if(step > 1) {
	    size+= 0.2
	    modulate.a-= 0.2
	}
	scale.x= size
	scale.y= size
	if(modulate.a < 0.2) instance_destroy()

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
