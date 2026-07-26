# Auto-converted from GameMaker: obj_flowey_wilt
extends Node2D

func _ready():
	GS.inbattle= 1
	GS.facing= 2
	GS.flag[20]= 0
	GS.faceemotion= 0
	image_speed= 0
	scale.x= 2
	scale.y= 2
	stepper= 0
	doomcon= 0
	shudder= 8
	GS.flag[17]= 1
	obj_borderparent.visible= 0
	obj_fakeheart.visible= 0
	$Alarm2.start((80) / 30.0)
	obj_fakeheart.move= 0
	memx= obj_fakeheart.x
	memy= obj_fakeheart.y
	wind= caster_load("music/f_wind2.ogg")
	caster_loop(wind, 0.8, 0.8)
	vol= 0.8
	GS.border= 0
	SCR_BORDERSETUP()
	writing= 0
	con= 0
	remno= -1
	idno= 834783
	fader= 0

func _gm_event_2_9():
	doomcon++

func _gm_event_2_8():
	// obj_npc_marker
	with(1363) instance_destroy()

func _gm_event_2_7():
	doomcon= 0.5
	snd_play(51/* snd_damage */)

func _gm_event_2_6():
	con= 0
	frame= 6
	x= xstart - shudder
	shudder*= -1
	if(shudder > 0) shudder--
	else  shudder++
	if(shudder != 0) $Alarm6.start((8) / 30.0)
	else  doomcon= 1

func _gm_event_2_5():
	doomcon= 5

func _gm_event_2_4():
	con++

func _gm_event_2_2():
	obj_borderparent.visible= 1
	obj_fakeheart.visible= 1
	fightbt2= instance_create(GS.idealborder[0] + 50, GS.idealborder[2] + 50, 756/* obj_anybt */)
	fightbt2.type= 2
	fightbt2.sprite_index= 5/* spr_fightbt */
	sparebt2= instance_create(GS.idealborder[1] - 150, GS.idealborder[2] + 50, 756/* obj_anybt */)
	sparebt2.type= 3
	sparebt2.sprite_index= 9/* spr_sparebt */

func _process(delta: float):
	if(doomcon == 0) {
	    if(GS.faceemotion == 1) frame= 1
	    if(GS.faceemotion == 2) frame= 2
	    if(GS.faceemotion == 3) frame= 0
	}
	if(writing == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    writing= 0
	    event_user(2)
	}
	if(instance_exists(782/* OBJ_WRITER */)) {
	    if(GS.flag[20] == 1 and (OBJ_WRITER.stringno != remno or OBJ_WRITER.id != idno)) {
	        GS.flag[20]= 0
	        if(frame < 14) frame++
	        stepper++
	    }
	    remno= OBJ_WRITER.stringno
	    idno= OBJ_WRITER.id
	}
	if(con == 16 and not instance_exists(782/* OBJ_WRITER */)) {
	    fader= 1
	    con= 17
	    $Alarm4.start((30) / 30.0)
	    snd_play(50/* snd_escaped */)
	}
	if(con == 18) {
	    GS.typer= 73
	    GS.msg[0]= "* Flowey ran away."
	    instance_create(120, 50, 782/* OBJ_WRITER */)
	    con= 19
	    $Alarm4.start((210) / 30.0)
	}
	if(con == 20) {
	    doomcon= 6
	    $Alarm9.start((10) / 30.0)
	    con= 21
	}
	if(fader == 1) modulate.a-= 0.01
	if(doomcon == 0.5) {
	    doomcon= 0.6
	    shudder= 8
	    $Alarm6.start((1) / 30.0)
	}
	if(doomcon == 1) {
	    ini_close()
	    GS.flag[475]= 1
	    ini_open("undertale.ini")
	    K= ini_read_real("Flowey", "K", 0)
	    if(K == 0) ini_write_real("Flowey", "K", 1)
	    ini_write_real("FFFFF", "E", 2)
	    ini_close()
	    GS.msc= 0
	    GS.msg[0]= "I knew you had it in you^3!%%"
	    GS.typer= 71
	    instance_create(x - 60, y - 30, 782/* OBJ_WRITER */)
	    doomcounter= 0
	    doomcon= 2
	    sprite_index= 649/* spr_flowey_wilted_l */
	    image_speed= 0.3
	}
	if(doomcon == 2) {
	    image_speed+= 0.0025
	    if(image_speed >= 0.5) doomcon= 3
	}
	if(doomcon == 3) {
	    image_speed-= 0.004
	    if(image_speed <= 0) {
	        doomcon= 4
	        sprite_index= 650/* spr_flowey_wilted_d */
	        frame= 0
	        image_speed= 0
	        $Alarm5.start((80) / 30.0)
	    }
	}
	if(doomcon == 5) {
	    image_speed= 0.2
	    if(frame >= 6) {
	        frame= 6
	        doomcon= 6
	        $Alarm9.start((150) / 30.0)
	        image_speed= 0
	    }
	}
	if(doomcon == 7) {
	    instance_create(0, 0, 149/* obj_unfader */)
	    doomcon= 8
	    $Alarm9.start((12) / 30.0)
	}
	if(doomcon == 9) {
	    GS.entrance= 0
	    instance_create(0, 0, 148/* obj_persistentfader */)
	    ini_open("undertale.ini")
	    ini_write_real("FFFFF", "E", 2)
	    ini_close()
	    get_tree().change_scene_to_file("res://godot_rooms/238.tscn")
	}

func _gm_event_7_12():
	obj_borderparent.visible= 1
	instance_create(memx, memy, 748/* obj_fakeheart */)
	fightbt2= instance_create(GS.idealborder[0] + 50, GS.idealborder[2] + 50, 756/* obj_anybt */)
	fightbt2.type= 2
	fightbt2.sprite_index= 5/* spr_fightbt */
	sparebt2= instance_create(GS.idealborder[1] - 150, GS.idealborder[2] + 50, 756/* obj_anybt */)
	sparebt2.type= 3
	sparebt2.sprite_index= 9/* spr_sparebt */

func _gm_event_7_11():
	obj_borderparent.visible= 0
	writing= 1
	if(con == 12) {
	    caster_free(wind)
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.typer= 70
	    writing= 0
	    GS.msg[0]= "\\M1I just can\'t understand.../%%"
	    instance_create(x - 50, y - 40, 782/* OBJ_WRITER */)
	    con= 16
	}
	if(con == 11) {
	    caster_set_volume(wind, 0.25)
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "\\M1I can\'t understand!/%%"
	    instance_create(x - 50, y - 40, 782/* OBJ_WRITER */)
	    con= 12
	}
	if(con == 10) {
	    caster_set_volume(wind, 0.5)
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "\\M1I can\'t understand./%%"
	    instance_create(x - 50, y - 40, 782/* OBJ_WRITER */)
	    con= 11
	}
	if(con == 9) {
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "\\M1... why are you being.../"
	    GS.msg[1]= "\\M1... so nice to me?/%%"
	    instance_create(x - 60, y - 50, 782/* OBJ_WRITER */)
	    con= 10
	}
	if(con == 8) {
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "\\M1... why?/%%"
	    instance_create(x - 20, y - 30, 782/* OBJ_WRITER */)
	    con= 9
	}
	if(con == 7) {
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "\\M1...?/%%"
	    instance_create(x - 20, y - 30, 782/* OBJ_WRITER */)
	    con= 8
	}
	if(con == 6) {
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.typer= 69
	    GS.msg[0]= "\\M1.../%%"
	    instance_create(x - 20, y - 30, 782/* OBJ_WRITER */)
	    con= 7
	}
	if(con == 5) {
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.typer= 69
	    GS.msg[0]= "\\M1I\'ll kill everyone you love./%%"
	    instance_create(x - 50, y - 40, 782/* OBJ_WRITER */)
	    con= 6
	}
	if(con == 4) {
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.typer= 69
	    GS.msg[0]= "\\M1I\'ll kill everyone./%%"
	    instance_create(x - 50, y - 40, 782/* OBJ_WRITER */)
	    con= 5
	}
	if(con == 3) {
	    GS.flag[20]= 0
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.typer= 69
	    GS.msg[0]= "I\'ll kill you./%%"
	    instance_create(x - 40, y - 40, 782/* OBJ_WRITER */)
	    con= 4
	}
	if(con == 2) {
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.typer= 69
	    GS.msg[0]= "\\M1If you let me live.../"
	    GS.msg[1]= "\\M1I\'ll come back./%%"
	    instance_create(x - 40, y - 50, 782/* OBJ_WRITER */)
	    con= 3
	}
	if(con == 1) {
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "\\M1Sparing me won\'t change&anything./"
	    GS.msg[1]= "\\M1Killing me is the only&way to end this./%%"
	    instance_create(x - 60, y - 50, 782/* OBJ_WRITER */)
	    con= 2
	}
	if(con == 0) {
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= ".../"
	    GS.msg[1]= "\\E1What are you doing?/"
	    GS.msg[2]= "\\E2Do you really think I\'ve&learned anything from this?/"
	    GS.msg[3]= "\\E3No./%%"
	    instance_create(x - 60, y - 50, 782/* OBJ_WRITER */)
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
