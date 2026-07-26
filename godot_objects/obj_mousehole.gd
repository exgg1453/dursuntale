# Auto-converted from GameMaker: obj_mousehole
# GM parent: obj_interactable
extends Node2D

func _ready():
	myinteract= 0

func _process(delta: float):
	if(myinteract == 1) {
	    if(audio_is_playing(112) == 0) {
	        snd_stop(112)
	        snd_play(112/* snd_movemenu */)
	    }
	    myinteract= 0
	}

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
