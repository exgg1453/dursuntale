# Auto-converted from GameMaker: obj_s_fakefightbt
extends Node2D

func _ready():
	con= 0
	on= 0

func _process(delta: float):
	if(on == 1) {
	    frame= 1
	    if(keyboard_multicheck_pressed(0/* NOKEY */) and con == 0) {
	        con= 1
	        // obj_sansb_body
	        with(517) death_c= 1
	        // obj_heart
	        with(743) movement= -1
	    }
	} else  frame= 0
	on= 0

func _on_alarm_0_timeout():
	on= 1

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
