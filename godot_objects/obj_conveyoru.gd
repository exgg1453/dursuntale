# Auto-converted from GameMaker: obj_conveyoru
# GM parent: obj_conveyor_parent
extends Node2D

func _ready():
	gone= 0
	sprite_index= 1827/* spr_conveyorbelt_d */
	siner= 0
	mydir= 90
	image_speed= -1
	go= 0
	yfer= 0
	thin= 0

func _process_end(delta: float):
	if(go == 1) {
	    obj_mainchara.y= yfer
	    obj_mainchara.y-= 3
	    go= 0
	}

func _process(delta: float):
	gone= 0

func _on_alarm_0_timeout():
	if(gone == 0 and GS.interact == 0) {
	    yfer= obj_mainchara.y
	    go= 1
	}
	object_index.gone= 1
	if(instance_exists(1276/* obj_conveyorpuzzle1 */))
	    obj_conveyorpuzzle1.active= 3

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
