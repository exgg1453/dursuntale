# Auto-converted from GameMaker: obj_greydoor
# GM parent: obj_interactable
extends Node2D

func _ready():
	myinteract= 0
	touched= 0
	ch= choose(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
	if(ch != 4) instance_destroy()
	con= 0
	image_speed= 0

func _gm_event_2_2():
	GS.entrance= 19
	instance_create(0, 0, 148/* obj_persistentfader */)
	get_tree().change_scene_to_file("res://godot_rooms/269.tscn")

func _process(delta: float):
	if(myinteract == 1 and con == 0) {
	    GS.interact= 1
	    con= 1
	    event_user(9)
	    frame= 1
	}

func _gm_event_7_19():
	GS.interact= 3
	instance_create(0, 0, 149/* obj_unfader */)
	audio_stop_all()
	if(touched == 0) {
	    snd_play(437/* mus_dooropen */)
	    $Alarm2.start((14) / 30.0)
	    touched= 1
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
