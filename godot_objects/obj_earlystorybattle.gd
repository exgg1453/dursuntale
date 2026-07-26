# Auto-converted from GameMaker: obj_earlystorybattle
extends Node2D

func _ready():
	if(GS.flag[7] == 1) {
	    instance_destroy()
	    exit
	} else  {
	    if(GS.flag[493] >= 12) instance_destroy()
	    con= 0
	    exit
	}

func _on_destroy():
	if(GS.flag[455] + GS.flag[456] == 1) GS.flag[450]= 1
	if(GS.flag[455] + GS.flag[456] == 2) GS.flag[450]= 2

func _process(delta: float):
	if(room == 221 and con == 0 and GS.flag[450] <= 2 and GS.flag[455] == 0 and obj_mainchara.x < 90) {
	    GS.border= 3
	    GS.flag[15]= 1
	    GS.flag[16]= 1
	    SCR_BORDERSETUP()
	    instance_create(0, 0, 140/* obj_battleblcon */)
	    GS.flag[455]= 1
	    con= 1
	    $Alarm0.start((50) / 30.0)
	}
	if(room == 221 and con < 2 and GS.flag[450] <= 2 and GS.flag[455] == 1 and GS.flag[456] < 2 and obj_mainchara.x > 180) {
	    GS.border= 3
	    GS.flag[15]= 1
	    GS.flag[16]= 1
	    SCR_BORDERSETUP()
	    instance_create(0, 0, 140/* obj_battleblcon */)
	    GS.flag[455]= 2
	    con= 3
	    $Alarm0.start((50) / 30.0)
	}
	if(room == 222 and con == 0 and GS.flag[450] <= 2 and GS.flag[456] == 0 and obj_mainchara.x > 460) {
	    GS.border= 3
	    GS.flag[15]= 1
	    GS.flag[16]= 1
	    SCR_BORDERSETUP()
	    instance_create(0, 0, 140/* obj_battleblcon */)
	    GS.flag[456]= 1
	    con= 1
	    $Alarm0.start((50) / 30.0)
	}
	if(room == 222 and con < 2 and GS.flag[450] <= 2 and GS.flag[456] == 1 and GS.flag[455] < 2 and obj_mainchara.x < 100) {
	    GS.border= 3
	    GS.flag[15]= 1
	    GS.flag[16]= 1
	    SCR_BORDERSETUP()
	    instance_create(0, 0, 140/* obj_battleblcon */)
	    GS.flag[456]= 2
	    con= 3
	    $Alarm0.start((50) / 30.0)
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
