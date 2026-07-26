# Auto-converted from GameMaker: blt_dummyknife
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	dmg= 9
	modulate.a= 0
	direction= 180
	rotation_degrees= 180
	fade= 0
	snd_play(28/* snd_bell */)
	increase= 16

func _process(delta: float):
	if(modulate.a < 1) {
	    modulate.a+= 0.12
	    direction+= increase
	    increase-= 2
	} else  modulate.a= 1
	rotation_degrees= direction

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
