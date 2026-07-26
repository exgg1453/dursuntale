# Auto-converted from GameMaker: obj_autowater
extends Node2D

func _ready():
	con= 0
	if(GS.flag[366] == 0) instance_destroy()
	else  $Alarm1.start((3) / 30.0)

func _gm_event_2_1():
	con= 1

func _process(delta: float):
	if(GS.interact == 0 and con == 1) {
	    GS.msc= 0
	    if(room == 137)
	        GS.msg[0]= "* (The cup of water returned&  to the water cooler.)/%%"
	    if(room == 138)
	        GS.msg[0]= "* (The cup of water was erased&  by a mysterious force.)/%%"
	    if(room == 139) {
	        GS.msg[0]= "* (The water evaporated from&  the heat.)/"
	        GS.msg[1]= "* (The cup evaporated^1, too.)/%%"
	    }
	    // obj_mainchara
	    with(1570) {
	        dsprite= 1043
	        rsprite= 1045
	        usprite= 1044
	        lsprite= 1046
	    }
	    con= 2
	    scr_regulartext()
	    GS.interact= 1
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.flag[366]= 0
	    GS.interact= 0
	    instance_destroy()
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
