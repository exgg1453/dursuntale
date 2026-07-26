# Auto-converted from GameMaker: obj_undyne_echoflower
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	dsprite= 1353
	usprite= 1362
	lsprite= 1367
	rsprite= 1363
	dtsprite= 1353
	utsprite= 1362
	ltsprite= 1367
	rtsprite= 1363
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	scr_depth()
	con= 0

func _gm_event_2_4():
	con++

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 38
	GS.facechoice= 0
	GS.faceemotion= 0
	if(GS.plot < 118) {
	    // obj_mainchara
	    with(1570) uncan= 1
	    GS.msg[0]= "* Behind you./%%"
	    con= 1
	} else  {
	    GS.typer= 5
	    GS.msg[0]= "* You aren\'t gonna tell my&  parents about this^1, are you?/%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	object_index.talkedto++

func _process_end(delta: float):
	if(con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    undyne= instance_create(520, 80, 1117/* obj_undynea_actor */)
	    undyne.direction= 0
	    undyne.sprite_index= undyne.rsprite
	    mkid= instance_create(730, 60, 1115/* obj_mkid_actor */)
	    mkid.visible= 0
	    con= 2
	    $Alarm4.start((20) / 30.0)
	    obj_darkness_undyne.glowyes= 2
	    GS.interact= 1
	    obj_mainchara.cutscene= 1
	}
	if(con == 2) {
	    GS.interact= 1
	    view_xview[0]-= 5
	}
	if(con == 3) {
	    GS.facing= 3
	    con= 4
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 5) {
	    undyne.velocity.x= 1
	    undyne.image_speed= 0.2
	    con= 6
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 7) {
	    undyne.velocity.x= 0
	    undyne.image_speed= 0
	    con= 8
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 9) {
	    undyne.velocity.x= 1
	    undyne.image_speed= 0.2
	    con= 10
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 11) {
	    undyne.velocity.x= 0
	    undyne.image_speed= 0
	    con= 12
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 13) {
	    GS.typer= 37
	    GS.msc= 621
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 14
	}
	if(con == 14 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 1
	    con= 15
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 16) {
	    GS.interact= 1
	    undyne.sprite_index= 1424/* spr_undyne_rushfade */
	    undyne.frame= 0
	    snd_play(47/* snd_grab */)
	    con= 15.1
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 16.1) {
	    rushf= scr_marker(undyne.x, undyne.y, 1423)
	    rushf.modulate.a= 0
	    rushf.z_index= 4000
	    snd_play(13/* snd_spearappear */)
	    con= 15.2
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 15.2) {
	    with(rushf) {
	        if(modulate.a < 1) modulate.a+= 0.05
	    }
	}
	if(con == 16.2) con= 18
	if(con == 18) {
	    with(rushf) instance_destroy()
	    undyne.sprite_index= 1423/* spr_undyne_rush */
	    undyne.velocity.x= 1
	    undyne.image_speed= 0.2
	    con= 17.1
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 18.1) {
	    undyne.velocity.x= 0
	    undyne.image_speed= 0
	    $Alarm4.start((30) / 30.0)
	    con= 17.2
	}
	if(con == 18.2) {
	    undyne.velocity.x= 3
	    con= 17.3
	    undyne.frame= 0
	    undyne.fun= 3
	    undyne.image_speed= 0.5
	    $Alarm4.start((28) / 30.0)
	}
	if(con == 18.3) {
	    undyne.frame= 0
	    undyne.velocity.x= 0
	    undyne.image_speed= 0
	    con= 17.4
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 18.4) {
	    GS.battlegroup= 200
	    b= instance_create(0, 0, 142/* obj_battler */)
	    b.claptimer= 4
	    con= 20
	}
	if(con == 20 and not instance_exists(142/* obj_battler */)) {
	    mkid.visible= 1
	    mkid.velocity.y= 4
	    snd_play(22/* snd_splash */)
	    con= 21
	    $Alarm4.start((11) / 30.0)
	}
	if(con == 22) {
	    GS.typer= 5
	    GS.msc= 0
	    GS.msg[0]= "* Undyne!!^1!&* I\'ll help you fight!!!/%%"
	    scr_regulartext()
	    con= 23
	    undyne.velocity.x= 0
	    undyne.image_speed= 0
	    mkid.velocity.y= 0
	    mkid.image_speed= 0.2
	    mkid.sprite_index= mkid.dtsprite
	}
	if(con == 23 and not instance_exists(782/* OBJ_WRITER */)) {
	    mkid.image_speed= 0
	    mkid.sprite_index= mkid.dsprite
	    con= 24
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 25) {
	    mkid.sprite_index= mkid.lsprite
	    con= 26
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 27) {
	    mkid.sprite_index= mkid.rsprite
	    con= 28
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 29) {
	    mkid.sprite_index= mkid.lsprite
	    con= 30
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 31) {
	    mkid.sprite_index= mkid.rtsprite
	    con= 32
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 33) {
	    mkid.image_speed= 0.2
	    GS.msg[0]= "* YO!!!!/"
	    GS.msg[1]= "* You did it!!^1!&* Undyne is RIGHT in front&  of you!!!/"
	    GS.msg[2]= "* You\'ve got front row seats&  to her fight!!!/%%"
	    scr_regulartext()
	    con= 34
	}
	if(con == 34 and not instance_exists(782/* OBJ_WRITER */)) {
	    mkid.image_speed= 0
	    mkid.sprite_index= mkid.lsprite
	    con= 35
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 36) {
	    mkid.sprite_index= mkid.rsprite
	    con= 37
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 38) {
	    mkid.sprite_index= mkid.lsprite
	    con= 39
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 40) {
	    mkid.sprite_index= mkid.dtsprite
	    con= 41
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 42) {
	    mkid.image_speed= 0.2
	    GS.msg[0]= "* ... wait./"
	    GS.msg[1]= "* Who\'s she fighting???/%%"
	    scr_regulartext()
	    con= 43
	}
	if(con == 43 and not instance_exists(782/* OBJ_WRITER */)) {
	    undyne.sprite_index= undyne.rsprite
	    undyne.velocity.x= 3
	    undyne.image_speed= 0.25
	    con= 44
	    $Alarm4.start((7) / 30.0)
	}
	if(con == 45) {
	    snd_play(112/* snd_movemenu */)
	    undyne.velocity.x= 0
	    undyne.image_speed= 0
	    undyne.frame= 0
	    mkid.visible= 0
	    undyne.sprite_index= 1435/* spr_undyne_cheektug */
	    con= 46
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 47) {
	    undyne.velocity.x= -2
	    undyne.image_speed= 0.25
	    GS.msg[0]= "* H^1-hey!/"
	    GS.msg[1]= "* You aren\'t gonna tell my&  parents about this^1, are you?/%%"
	    scr_regulartext()
	    con= 48
	}
	if(con == 48 and not instance_exists(782/* OBJ_WRITER */) and undyne.x < view_xview[0] - 100) {
	    with(undyne) instance_destroy()
	    with(mkid) instance_destroy()
	    con= 49
	    vol= 0
	    caster_stop(GS.currentsong)
	    $Alarm4.start((100) / 30.0)
	}
	if(con == 49) view_xview[0]++
	if(con == 50) {
	    // obj_mainchara
	    with(1570) uncan= 0
	    caster_loop(GS.currentsong, 1, 0.9)
	    obj_mainchara.cutscene= 0
	    GS.interact= 0
	    GS.plot= 118
	    con= 51
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
