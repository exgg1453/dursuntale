# Auto-converted from GameMaker: obj_monsterkidtrigger4
extends Node2D

func _ready():
	if(GS.plot > 113) {
	    instance_destroy()
	    exit
	} else  {
	    con= 0
	    if(GS.flag[91] > 0) instance_destroy()
	    scale.y= 20
	    exit
	}

func _process(delta: float):
	if(con == 1) {
	    // obj_mkid_actor
	    with(1115) image_speed= 0.25
	    // obj_mkid_actor
	    with(1115) sprite_index= rtsprite
	    GS.facechoice= 0
	    GS.msc= 0
	    GS.typer= 5
	    GS.msg[0]= "* Man^1, Undyne is sooooooo&  cool./"
	    GS.msg[1]= "* She beats up bad guys and&  NEVER loses./"
	    GS.msg[2]= "* If I was a human^1, I would&  wet the bed every night.../"
	    GS.msg[3]= "* ... knowing she was gonna&  beat me up^1!&* Ha ha./%%"
	    scr_regulartext()
	    con= 2
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 3
	    GS.flag[91]= 1
	    GS.interact= 0
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(GS.interact == 0 and con == 0) {
	    con= 1
	    other.x= other.xprevious
	    other.y= other.yprevious
	    GS.interact= 1
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
