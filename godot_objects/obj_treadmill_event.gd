# Auto-converted from GameMaker: obj_treadmill_event
extends Node2D

func _ready():
	con= 0
	if(GS.flag[497] < 2) {
	    GS.flag[497]= 2
	    obj_mainchara.visible= 0
	    obj_mainchara.x= 99
	    obj_mainchara.y= 136
	    mc= scr_marker(obj_mainchara.x, 112, obj_mainchara.sprite_index)
	    mc.z_index= 1000
	    pap= scr_marker(75, 190, 1325)
	    pap.image_speed= 0
	    pap.z_index= 80
	    GS.interact= 1
	    con= 1
	    $Alarm4.start((45) / 30.0)
	    snd_play(106/* snd_noise */)
	} else  instance_destroy()

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) GS.interact= 1
	if(con == 2) {
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 3
	    GS.msc= 0
	    GS.msg[0]= "HEY^1, SANS^1, HAVE&YOU SEEN MY.../"
	    GS.msg[1]= "\\E0OH, HELLO^1.&YOU AREN\'T SANS./"
	    GS.msg[2]= "\\E3WAIT A SECOND./"
	    GS.msg[3]= "\\E0WHY WERE YOU USING&A TREADMILL IN&THE DARK?/"
	    GS.msg[4]= "\\E3IS SANS PRANKING&YOU ACROSS TIME&AND SPACE?/"
	    GS.msg[5]= "\\E1I HATE IT WHEN&HE DOES THAT!/"
	    GS.msg[6]= "\\E1HOW IMMATURE CAN&YOU GET?/"
	    GS.msg[7]= "\\E3ALSO^1, HAVE YOU&SEEN MY ACTION&FIGURES?/"
	    GS.msg[8]= "\\E0WAIT^1!&I KNOW WHERE TO&LOOK!!!/"
	    GS.msg[9]= "IN MY COLLECTION^1!&NYEH HEH HEH!!!/"
	    GS.msg[10]= "SOMETIMES^1, I\'M A&GENIUS^1.&ALL THE TIME./%%"
	    mc.sprite_index= 1043/* spr_maincharad */
	    d= instance_create(0, 0, 779/* obj_dialoguer */)
	    d.side= 0
	    con= 3
	}
	if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    pap.velocity.y= 5
	    pap.sprite_index= 1313/* spr_papyrus_d */
	    pap.image_speed= 0.5
	    con= 4
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 5) {
	    mc.image_speed= 0.25
	    mc.y+= 2
	    if(mc.y >= obj_mainchara.y) {
	        obj_mainchara.visible= 1
	        with(mc) instance_destroy()
	        con= 6
	        GS.interact= 0
	        if(GS.flag[7] == 0)
	            GS.currentsong= caster_load("music/muscle.ogg")
	        else  GS.currentsong= caster_load("music/reunited.ogg")
	        caster_loop(GS.currentsong, 1, 1)
	    }
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
