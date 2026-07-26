# Auto-converted from GameMaker: obj_rblock
# GM parent: obj_solidsmall
extends Node2D

func _ready():
	goldshift= 0
	phase= 0

func _process(delta: float):
	if(goldshift == 1 and myside == 0) {
	    goldshift= 0
	    y-= 40
	    myside= 2
	}
	if(goldshift == 1 and myside == 2) {
	    goldshift= 0
	    y+= 40
	    myside= 0
	}
	if(goldshift == 1 and myside == 1) {
	    goldshift= 0
	    x-= 40
	    myside= 3
	}
	if(goldshift == 1 and myside == 3) {
	    goldshift= 0
	    x+= 40
	    myside= 1
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
