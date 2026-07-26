# Auto-converted from GameMaker: obj_orbhead
extends Node2D

func _ready():
	onhead= 0
	head= 0
	velocity.y= -4

func _on_destroy():
	velocity.y= 3
	x= obj_mainchara.x + 7
	head= 2

func _process_end(delta: float):
	if(head == 2 and y >= obj_mainchara.y - 3) {
	    head= 0
	    y= obj_mainchara.y - 3
	    onhead= 1
	    speed= 0
	}
	if(onhead == 1) {
	    x= obj_mainchara.x + 7
	    y= obj_mainchara.y - 3
	}

func _gm_event_7_0():
	if(onhead == 0 and y < 0) {
	    $Alarm0.start((10) / 30.0)
	    onhead= 2
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
