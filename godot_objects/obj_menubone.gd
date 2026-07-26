# Auto-converted from GameMaker: obj_menubone
# GM parent: obj_sansbullet_parent
extends Node2D

func _ready():
	y= 270
	x= -10
	siner= 0
	stoptimer= 0
	terminate= 0
	innate_karma= 2

func _process(delta: float):
	stoptimer= 1
	siner++
	x= -30 + abs(sin(siner / 9) * 105)
	if(x >= 64) siner-= 0.72
	if(x < 10) stoptimer= 0
	if(x <= -8 and terminate == 1) instance_destroy()

func _on_alarm_0_timeout():
	if(obj_sansb_body.damageturn == 0) {
	    if(GS.hp >= 60) GS.km++
	    // obj_sansb_body
	    with(517) event_user(2)
	    if(GS.hp < 1) GS.hp= 1
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
