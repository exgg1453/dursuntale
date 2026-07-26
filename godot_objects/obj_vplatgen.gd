# Auto-converted from GameMaker: obj_vplatgen
extends Node2D

func _ready():
	$Alarm3.start((10) / 30.0)
	vvv= 3
	za= 0
	zb= 0
	type= 2
	$Alarm5.start((5) / 30.0)
	non= 0

func _gm_event_2_6():
	g= choose(3, -3)
	scr_bwall(50 + random(150), g, 80, 1)
	$Alarm6.start((50) / 30.0)

func _gm_event_2_5():
	scr_bwall(20, 3, 90, 70)
	if(type > 0) scr_bwall(340, -3, 90, 70)

func _gm_event_2_3():
	if(type == 0) vvv= 3
	if(type == 1) vvv= 4.5
	if(type == 2) vvv= 5
	scr_hplat(350, 0, 0, 8 + choose(5, 10))
	bone.velocity.y= vvv
	bone.x= GS.idealborder[0] + 40 + random(GS.idealborder[1] - GS.idealborder[0] - 80)
	$Alarm3.start((15) / 30.0)
	if(type == 2) $Alarm3.start((12) / 30.0)
	bone.z_b= choose(1, 2, 3, 4, 5)
	bone.z_a= choose(0.12, 0.08, 0.1)
	if(non == 0) {
	    bone.z_b= 0
	    bone.len= 60
	    non= 1
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
