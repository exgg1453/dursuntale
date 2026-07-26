# Auto-converted from GameMaker: obj_shyrenbody
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	image_speed= 0.2
	scale.x= 2
	scale.y= 2
	siny= 0
	yo= y
	creator= 328173821312
	if(instance_exists(259/* obj_shyren */)) creator= 259

func _process(delta: float):
	siny++
	y= yo + sin(siny / 30) * 4
	yo+= velocity.y
	if(is_instance_valid(creator)) {
	    if(creator.emotion == 0) sprite_index= 268/* spr_shyren_hide */
	    if(creator.emotion == 1) sprite_index= 269/* spr_shyren_swim */
	    if(creator.emotion == 2) sprite_index= 270/* spr_shyren_sing */
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
