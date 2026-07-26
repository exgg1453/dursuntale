# Auto-converted from GameMaker: obj_conveyorsnapper
extends Node2D

func _ready():
	con= 0
	if(GS.flag[376] > 0) {
	    obj_mainchara.x= GS.flag[376] - 200
	    obj_mainchara.y= -20
	    obj_mainchara.modulate.a= 0.5
	    obj_mainchara.velocity.y= 6
	    con= 1
	    $Alarm3.start((4) / 30.0)
	    $Alarm4.start((25) / 30.0)
	    GS.phasing= 1
	    GS.flag[376]= 0
	}

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	if(GS.interact == 1) {
	    GS.facing++
	    if(GS.facing > 3) GS.facing= 0
	    $Alarm3.start((5) / 30.0)
	}

func _process(delta: float):
	if(con == 1) GS.interact= 1
	if(con == 2) {
	    GS.phasing= 0
	    obj_mainchara.velocity.y= 0
	    GS.interact= 0
	    obj_mainchara.modulate.a= 1
	    con= 3
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
