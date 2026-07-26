# Auto-converted from GameMaker: obj_switchbasic
# GM parent: obj_interactable
extends Node2D

func _ready():
	myinteract= 0
	image_speed= 0
	on= 0
	script_execute(113/* scr_depth */)

func _process(delta: float):
	if(myinteract == 1 and on == 1) {
	    on= 0
	    myinteract= 0
	    frame= 0
	}
	if(myinteract == 1 and on == 0) {
	    on= 1
	    myinteract= 0
	    frame= 1
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
