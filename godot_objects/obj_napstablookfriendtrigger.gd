# Auto-converted from GameMaker: obj_napstablookfriendtrigger
extends Node2D

func _ready():
	GS.flag[17]= 0
	if(GS.flag[389] == 4) GS.flag[389]= 5
	if(GS.plot > 116) {
	    instance_destroy()
	    exit
	} else  {
	    nap= instance_create(300, 60, 1055/* obj_damndummy */)
	    nap.sprite_index= 1130/* spr_napstablook_u */
	    nap.float= 1
	    scale.x= 5
	    con= 0
	    tc= 0
	    exit
	}

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    $Alarm4.start((15) / 30.0)
	    con= 2
	}
	if(con == 3) {
	    nap.sprite_index= 1128/* spr_napstablook_d */
	    con= 4
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 5) {
	    GS.msg[0]= "* oh hey... you...&* followed me.../"
	    GS.msg[1]= "* my house is up here.../"
	    GS.msg[2]= "* so you probably don\'t want to&  come this way.../"
	    GS.msg[3]= "* hope that helps.../%%"
	    if(GS.flag[36] > 0) {
	        GS.msg[0]= "* hey..^1.&* my house is up here.../"
	        GS.msg[1]= "* in case you want to see.../"
	        GS.msg[2]= "* or in case.../"
	        GS.msg[3]= "* you don\'t.../%%"
	    }
	    scr_regulartext()
	    con= 6
	}
	if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    nap.velocity.y= -3
	    con= 7
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 8) {
	    GS.interact= 0
	    GS.plot= 117
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(tc == 0 and GS.interact == 0) {
	    con= 1
	    tc= 1
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
