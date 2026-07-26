# Auto-converted from GameMaker: obj_undynetrigger_boss2
extends Node2D

func _ready():
	scale.x= 40
	con= 0
	if(GS.plot == 121 and GS.entrance == 1)
	    save= instance_create(220, 660, 1351/* obj_savepoint */)
	if(GS.plot > 121) save= instance_create(220, 660, 1351/* obj_savepoint */)
	if(GS.entrance == 2) instance_destroy()
	if(GS.plot > 121) instance_destroy()
	musout= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    undyne= scr_marker(150, view_yview[0] - 230, 1422)
	    undyne.image_speed= 0.334
	    GS.typer= 37
	    GS.msc= 0
	    GS.facechoice= 5
	    GS.faceemotion= 0
	    GS.msg[0]= "* That\'s it^1, then...!/"
	    GS.msg[1]= "* No more running away!/%%"
	    if(GS.flag[352] == 1)
	        GS.msg[0]= "* I KNEW you would&  come back here!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 2
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_free(-3)
	    GS.currentsong= caster_load("music/undynefast.ogg")
	    $Alarm4.start((30) / 30.0)
	    undyne.velocity.y= 8
	    GS.faceemotion= 1
	    GS.msg[0]= "* HERE I COME!!!!!!!"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 3
	}
	if(con == 4) {
	    // obj_savepoint
	    with(1351) instance_destroy()
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    // obj_dialoguer
	    with(779) instance_destroy()
	    con= 5
	    GS.border= 12
	    GS.battlegroup= 47
	    GS.mercy= 1
	    instance_create(0, 0, 142/* obj_battler */)
	    talkedto= 0
	    $Alarm4.start((2) / 30.0)
	}
	if(con == 6) {
	    with(undyne) instance_destroy()
	    if(GS.flag[350] == 0) {
	        u= instance_create(160, 620, 1118/* obj_undynea_chaser */)
	        $Alarm4.start((30) / 30.0)
	        con= 7
	    } else  {
	        GS.flag[17]= 0
	        GS.plot= 122
	    }
	}
	if(con == 8) {
	    if(GS.flag[350] == 0) caster_loop(GS.currentsong, 1, 1)
	    else  audio_stop_all()
	    GS.flag[352]= 1
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(GS.interact == 0 and con == 0) {
	    GS.interact= 1
	    con= 1
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
