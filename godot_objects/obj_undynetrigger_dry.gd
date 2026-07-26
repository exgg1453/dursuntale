# Auto-converted from GameMaker: obj_undynetrigger_dry
extends Node2D

func _ready():
	scale.y= 100
	con= 0
	if(GS.plot > 121 or GS.flag[350] != 0) instance_destroy()
	walked= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    instance_create(0, 0, 92/* obj_musfadeout */)
	    undyne= instance_create(-40, 60, 1117/* obj_undynea_actor */)
	    undyne.rsprite= 1425
	    undyne.dsprite= 1427
	    undyne.lsprite= 1426
	    undyne.usprite= 1432
	    undyne.sprite_index= undyne.rsprite
	    undyne.velocity.x= 1
	    undyne.image_speed= 0.1
	    con= 2
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 3) {
	    undyne.velocity.x= 0
	    undyne.frame= 0
	    undyne.image_speed= 0
	    con= 4
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 5) {
	    walked++
	    if(walked < 3) {
	        con= 2
	        $Alarm4.start((20) / 30.0)
	        undyne.velocity.x= 1
	        undyne.image_speed= 0.2
	    } else  con= 7
	}
	if(con == 7) {
	    undyne.velocity.x= 0
	    undyne.image_speed= 0
	    GS.facechoice= 5
	    GS.faceemotion= 1
	    GS.typer= 37
	    GS.msg[0]= "* Armor..^1. so..^1. hot..^1./"
	    GS.msg[1]= "* But I can\'t..^1.&* Give up.../%%"
	    GS.msc= 0
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 8
	}
	if(con == 8 and not instance_exists(782/* OBJ_WRITER */)) {
	    undyne.velocity.x= 0.5
	    undyne.image_speed= 0.1
	    $Alarm4.start((40) / 30.0)
	    con= 9
	}
	if(con == 10) {
	    undyne.velocity.x= 0
	    undyne.image_speed= 0
	    undyne.frame= 0
	    $Alarm4.start((60) / 30.0)
	    con= 11
	}
	if(con == 12) {
	    snd_play(106/* snd_noise */)
	    undyne2= instance_create(undyne.x, undyne.y, 1295/* obj_undynefall */)
	    with(undyne) instance_destroy()
	    con= 13
	}
	if(con == 13) {
	    GS.flag[17]= 0
	    GS.interact= 0
	    GS.plot= 122
	    GS.flag[350]= 2
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(GS.interact == 0 and con == 0) {
	    con= 1
	    GS.interact= 1
	}

func _gm_event_7_5():
	GS.flag[17]= 0

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
