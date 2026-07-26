# Auto-converted from GameMaker: obj_monsterkidtrigger8
extends Node2D

func _ready():
	if(GS.plot > 119 or GS.flag[98] > 0) instance_destroy()
	else  con= 1

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    GS.interact= 1
	    $Alarm4.start((25) / 30.0)
	    con= 2
	}
	if(con == 3) {
	    GS.msg[0]= "* Undyne..^1.&* You...^1.&* You saved me!/"
	    GS.msg[1]= "* Huh^1?&* They ran away?/"
	    GS.msg[2]= "* Yo^1, you\'re wrong.../"
	    GS.msg[3]= "* They went to get help!/"
	    GS.msg[4]= "* They\'ll be back any second!!/"
	    GS.msg[5]= "* O-okay^1, I\'ll go home.../%%"
	    scr_regulartext()
	    con= 4
	}
	if(con == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 5
	    GS.plot= 120
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
