# Auto-converted from GameMaker: obj_undynedate_outside
extends Node2D

func _ready():
	d= 0
	housesprite= scr_marker(30, -24, 1480)
	with(housesprite) z_index= 950000
	door= scr_marker(130, 40, 1433)
	with(door) z_index= 900000
	with(door) image_speed= 0
	if(GS.flag[389] >= 2) {
	    with(housesprite) sprite_index= 1481/* spr_undynehouse_fire */
	    with(housesprite) image_speed= 0.2
	    with(door) visible= 0
	}
	if(GS.flag[354] == 2 and GS.flag[67] == 0 and GS.flag[88] >= 3 and GS.flag[389] <= 2) {
	    papyrus= instance_create(140, 80, 1026/* obj_papyrus_room */)
	    with(papyrus) sprite_index= 1316/* spr_papyrus_dt */
	}
	if(GS.plot < 122) d= 1
	if(GS.flag[354] < 2) d= 1
	if(GS.flag[67] == 1) d= 1
	if(GS.flag[88] < 4) d= 1
	if(GS.flag[350] == 1) d= 1
	if(GS.flag[350] == 2) d= 1
	if(GS.flag[389] >= 2) d= 1
	if(GS.kills > 0) d= 1
	if(d == 1) {
	    instance_destroy()
	    exit
	} else  {
	    if(d == 0) {
	        GS.flag[20]= 0
	        GS.currentsong= caster_load("music/undynepiano.ogg")
	        caster_loop(GS.currentsong, 0.8, 0.8)
	        // obj_knock_room
	        with(1343) instance_destroy()
	    }
	    con= 0
	    exit
	}

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 5 and GS.interact == 0 and collision_rectangle(papyrus.x + 10, papyrus.y + 40, papyrus.x + 20, papyrus.y + 50, 1570, 0, 1)) {
	    GS.facing= 2
	    GS.interact= 1
	    con= 6
	    papyrus.dir= 0
	    papyrus.fun= 1
	    papyrus.sprite_index= papyrus.usprite
	}
	if(con == 6) {
	    con= 7
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 8) {
	    papyrus.sprite_index= 1338/* spr_papyrus_boneget */
	    papyrus.frame= 0
	    scr_papface(0, 3)
	    GS.msc= 0
	    GS.msg[0]= "PSST./"
	    GS.msg[1]= "\\E0MAKE SURE TO&GIVE HER THIS!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 9
	}
	if(con == 9 and not instance_exists(782/* OBJ_WRITER */)) {
	    papyrus.image_speed= 0.2
	    if(papyrus.frame >= 4) {
	        papyrus.image_speed= 0
	        con= 10
	    }
	}
	if(con == 10) {
	    GS.msg[0]= "SHE LOVES THESE!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 11
	}
	if(con == 11 and not instance_exists(782/* OBJ_WRITER */)) {
	    papyrus.image_speed= -0.2
	    if(papyrus.frame < 1) {
	        papyrus.frame= 0
	        papyrus.image_speed= 0
	        con= 12
	        $Alarm4.start((20) / 30.0)
	    }
	}
	if(con == 13) {
	    papyrus.sprite_index= 1326/* spr_papyrus_knock */
	    papyrus.image_speed= 0.25
	    snd_play(17/* snd_knock */)
	    $Alarm4.start((30) / 30.0)
	    con= 14
	}
	if(con == 15) {
	    papyrus.sprite_index= papyrus.usprite
	    papyrus.frame= 0
	    papyrus.image_speed= 0
	    con= 16
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 17) {
	    caster_stop(GS.currentsong)
	    con= 18
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 19) {
	    undyne= instance_create(papyrus.x, papyrus.y - 35, 1061/* obj_undyne_actor */)
	    undyne.sprite_index= undyne.dtsprite
	    undyne.d= 1
	    undyne.z_index= 900001
	    caster_play(129, 1, 1)
	    con= 20
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 20) {
	    with(door) {
	        if(frame < 7.6) frame+= 0.2
	    }
	}
	if(con == 21) {
	    GS.facechoice= 5
	    GS.typer= 37
	    GS.faceemotion= 0
	    GS.msg[0]= "* Hi^1, Papyrus!/"
	    GS.msg[1]= "* Ready for your extra-&  private^1, one-on-one&  training?/"
	    scr_papface(2, 0)
	    GS.msg[3]= "YOU BET I AM!/"
	    GS.msg[4]= "AND I BROUGHT&A FRIEND!/%%"
	    beedly= 0
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 22
	}
	if(con == 22 and not instance_exists(782/* OBJ_WRITER */)) {
	    papyrus.velocity.x= -4
	    papyrus.sprite_index= papyrus.lsprite
	    papyrus.image_speed= 0.5
	    con= 23
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 24) {
	    papyrus.velocity.x= 0
	    papyrus.sprite_index= papyrus.usprite
	    papyrus.image_speed= 0
	    papyrus.frame= 0
	    con= 25
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 26) {
	    GS.facechoice= 5
	    GS.typer= 37
	    GS.faceemotion= 0
	    GS.msg[0]= "* Hi^1, I don\'t think&  we\'ve.../"
	    GS.msg[1]= "\\E2* .../"
	    GS.msg[2]= "\\M9* .../"
	    scr_papface(3, 0)
	    GS.msg[4]= "\\M0.../"
	    scr_undface(5, 1)
	    GS.msg[6]= "\\E1* Why don\'t^1.&* You two^1.&* Come in?/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 27
	}
	if(con == 27 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 28
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 28) {
	    undyne.sprite_index= undyne.usprite
	    undyne.modulate.a-= 0.1
	    papyrus.x+= 4
	    papyrus.y-= 0.5
	    papyrus.sprite_index= papyrus.rsprite
	    papyrus.image_speed= 0.25
	}
	if(con == 29) {
	    papyrus.image_speed= 0.5
	    papyrus.frame= 0
	    papyrus.sprite_index= papyrus.usprite
	    con= 30
	    $Alarm4.start((8) / 30.0)
	}
	if(con == 31) {
	    papyrus.image_speed= 0.5
	    papyrus.frame= 0
	    papyrus.sprite_index= papyrus.rsprite
	    con= 32
	    $Alarm4.start((8) / 30.0)
	}
	if(con == 33) {
	    papyrus.image_speed= 0.5
	    papyrus.frame= 0
	    papyrus.sprite_index= papyrus.lsprite
	    con= 34
	    $Alarm4.start((8) / 30.0)
	}
	if(con == 35) {
	    papyrus.image_speed= 0.5
	    papyrus.frame= 0
	    papyrus.velocity.y= -3
	    papyrus.sprite_index= papyrus.usprite
	    con= 36
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 36)
	    papyrus.modulate.a-= 0.12
	if(con == 37) {
	    instance_create(140, 83, 805/* obj_doorA */)
	    with(papyrus) instance_destroy()
	    with(undyne) instance_destroy()
	    GS.interact= 0
	    con= 38
	}
	if(con == 38 and obj_mainchara.y > 180 and GS.interact == 0) {
	    GS.typer= 5
	    obj_mainchara.y= 175
	    GS.msc= 0
	    GS.facechoice= 0
	    GS.faceemotion= 3
	    GS.msg[0]= "* (You hear someone shouting&  a whisper at you from&  inside the house.)/"
	    scr_papface(1, 0)
	    GS.msg[2]= "NO^1!&YOU CAN\'T ESCAPE&FRIENDSHIP!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    GS.interact= 1
	    con= 39
	}
	if(con == 39 and instance_exists(782/* OBJ_WRITER */))
	    obj_mainchara.y= 175
	if(con == 39 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 38
	    GS.interact= 0
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
