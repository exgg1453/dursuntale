# Auto-converted from GameMaker: obj_dogeBtail
extends Node2D

func _ready():
	if(instance_exists(240/* obj_dogeB */)) tailobj= 240
	if(instance_exists(603/* obj_monster_extrabody */)) tailobj= 603

func _process_begin(delta: float):
	if(is_instance_valid(tailobj)) {
	    image_speed= tailobj.mercymod / 400
	    if(image_speed > 2) image_speed= 2
	    x= tailobj.x - 1
	    y= tailobj.y
	} else  instance_destroy()

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
