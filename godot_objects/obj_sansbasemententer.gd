# Auto-converted from GameMaker: obj_sansbasemententer
extends Node2D

func _ready():
	noke= 0

func _process(delta: float):
	if(noke == 0 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 1
	    instance_create(obj_mainchara.x, obj_mainchara.y + 15, 789/* obj_door_s_musfade */)
	    noke= 1
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
