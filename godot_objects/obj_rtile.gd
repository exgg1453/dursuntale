# Auto-converted from GameMaker: obj_rtile
extends Node2D

func _ready():
	col= 0
	image_speed= 0
	on= 0
	buffer= 3
	faketime= -1

func _process(delta: float):
	col--
	if(col == 0) object_index.frame= 0

func _on_alarm_0_timeout():
	faketime--
	ok= 0
	if(col <= 0 and GS.interact != 1) ok= 1
	if(faketime > 0 and GS.interact != 1) ok= 1
	if(ok == 1) {
	    faketime= -1
	    snd_play(106/* snd_noise */)
	    obj_bouncetileparent.goldshift= 1
	    if(instance_exists(1541/* obj_rblock */)) obj_rblock.goldshift= 1
	    frame= 1
	    if(on == 0) on= 1
	    else  on= 0
	}
	col= 3

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
