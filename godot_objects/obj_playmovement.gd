# Auto-converted from GameMaker: obj_playmovement
extends Node2D

func _ready():
	con= 0
	drawtext= 0
	drawtext2= 0
	string1= "Oh my love        "
	string2= "Please run away   "
	scale.y= 100
	if(GS.plot > 166) instance_destroy()
	else  {
	    view_yview[0]= 120
	    obj_mainchara.cutscene= 1
	    view_object[0]= -4
	}
	mainmove= 0
	frantic= 0
	$Alarm10.start((15) / 30.0)
	lastmove= 0
	lastx= obj_mainchara.x
	lasty= obj_mainchara.y
	unfrantic= 0
	face2= 0
	touch= 0
	already= 0
	ini_open("undertale.ini")
	already= ini_read_real("Mett", "O", -1)
	ini_close()
	skip= 0

func _gm_event_2_10():
	$Alarm10.start((15) / 30.0)
	if(con > 10) {
	    ql= 0
	    if(mainmove - lastmove > 10) ql++
	    franto= abs(obj_mainchara.x - lastx) + abs(obj_mainchara.y - lasty)
	    if(franto < 30 and franto > 3) ql++
	    if(franto > 38) unfrantic++
	    lastx= obj_mainchara.x
	    lasty= obj_mainchara.y
	    if(ql == 2) frantic++
	    lastmove= mainmove
	}

func _gm_event_2_6():
	instance_create(0, 0, 148/* obj_persistentfader */)
	room_goto_next()

func _gm_event_2_5():
	GS.facing++
	$Alarm5.start((10) / 30.0)
	if(GS.facing > 3) GS.facing= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    GS.flag[17]= 1
	    GS.msc= 0
	    GS.typer= 27
	    GS.facechoice= 0
	    GS.msg[0]= "* OH^1?&* THAT HUMAN.../%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 2
	    ini_open("undertale.ini")
	    ini_write_real("Mett", "O", 1)
	    ini_close()
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    view_yview[0]-= 3
	    if(obj_mainchara.y < 238) obj_mainchara.y+= 0.5
	    if(view_yview[0] <= 0) {
	        con= 9
	        $Alarm4.start((30) / 30.0)
	    }
	}
	if(con > 10) {
	    if(obj_mainchara.x != obj_mainchara.xprevious or obj_mainchara.y != obj_mainchara.yprevious)
	        mainmove++
	    if(GS.facing != face2) frantic++
	    face2= GS.facing
	}
	if(mainmove == 100) {
	    gm= instance_create(70, 335, 1205/* obj_songwriter */)
	    gm.sting= "(Hmmm? Getting creative?)"
	    gm.myfont= 2
	    mainmove++
	}
	if(mainmove == 300) {
	    gm= instance_create(70, 335, 1205/* obj_songwriter */)
	    gm.sting= "(Dance with me, darling.)"
	    gm.myfont= 2
	    mainmove++
	}
	if(mainmove == 500) {
	    gm= instance_create(70, 335, 1205/* obj_songwriter */)
	    gm.sting= "(Oh! The audience can feel#your passion!)"
	    if(unfrantic > 15)
	        gm.sting= "(Show the audience#your passion!)"
	    if(touch > 300) gm.sting= "(So close... How passionate...)"
	    if(frantic > 100) gm.sting= "(... do you need some help?)"
	    if(frantic > 200) gm.sting= "(... what ARE you doing?)"
	    gm.myfont= 2
	    mainmove++
	}
	if(mainmove == 700) {
	    gm= instance_create(70, 335, 1205/* obj_songwriter */)
	    gm.sting= "(Don\'t stop now!)"
	    if(unfrantic > 20)
	        gm.sting= "(Look at you, leaping around#the stage...)"
	    if(touch > 400) gm.sting= "(Can\'t keep your hands off, huh?)"
	    if(frantic > 120) gm.sting= "(Is that how humans dance?)"
	    if(frantic > 300)
	        gm.sting= "(Humans are stranger#than I thought.)"
	    gm.myfont= 2
	    mainmove++
	}
	if(mainmove == 900) {
	    gm= instance_create(70, 335, 1205/* obj_songwriter */)
	    gm.sting= "(Oh! They\'re really#getting into it.)"
	    if(unfrantic > 25) gm.sting= "(Moving so far...)"
	    if(touch > 500) gm.sting= "(Who can blame you?)"
	    if(frantic > 140)
	        gm.sting= "(Hmmm, I\'ll have to get used#to it...)"
	    if(frantic > 400) gm.sting= "(Even better than#I thought...)"
	    gm.myfont= 2
	    mainmove++
	}
	if(mainmove == 1100) {
	    gm= instance_create(100, 340, 1205/* obj_songwriter */)
	    gm.sting= "(So that\'s wha #it\'s like.)"
	    gm.myfont= 2
	    mainmove++
	}
	if(mainmove == 1300) {
	    gm= instance_create(70, 335, 1205/* obj_songwriter */)
	    gm.sting= "(Dancing with... A human.)"
	    gm.myfont= 2
	    mainmove++
	}
	if(mainmove == 1500) {
	    gm= instance_create(70, 335, 1205/* obj_songwriter */)
	    gm.sting= "(What a shame...)"
	    gm.myfont= 2
	    mainmove++
	}
	if(con == 10) {
	    obj_mainchara.y= 280
	    opera1= caster_load("music/mettmusical1.ogg")
	    opera2= caster_load("music/mettmusical2.ogg")
	    opera3= caster_load("music/mettmusical3.ogg")
	    opera4= caster_load("music/mettmusical4.ogg")
	    mett= instance_create(144, 112, 1207/* obj_mettaton_dress1 */)
	    mett.rotation_degrees= -45
	    mett.velocity.x= 1.5
	    $Alarm4.start((14) / 30.0)
	    con= 11
	}
	if(con == 12) {
	    mett.velocity.x= 0
	    con= 13
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 14) {
	    wall1= instance_create(0, 220, 1183/* obj_kitchenforcefield */)
	    wall1.canttalk= 1
	    wall1.scale.y= 7
	    wall2= instance_create(300, 220, 1183/* obj_kitchenforcefield */)
	    wall2.canttalk= 1
	    wall2.scale.y= 7
	    GS.msg[0]= "* COULD IT BE...?/%%"
	    di= instance_create(0, 0, 779/* obj_dialoguer */)
	    di.side= 1
	    con= 17
	}
	if(con == 17 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 18
	    mett.velocity.x= 2.5
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 18 and mett.rotation_degrees < 0)
	    mett.rotation_degrees+= 3
	if(con == 19) {
	    mett.velocity.x= 0
	    con= 20
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 21) {
	    GS.msg[0]= "* ... MY ONE TRUE LOVE?/%%"
	    if(already == 1) GS.msc= 870
	    di= instance_create(0, 0, 779/* obj_dialoguer */)
	    di.side= 1
	    con= 26
	}
	if(con == 26 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msc= 0
	    caster_play(opera1, 1, 1)
	    mett.sprite_index= 1739/* spr_mettaton_pulldress */
	    mett.image_speed= 0.25
	    mett.velocity.x= 1
	    $Alarm4.start((80) / 30.0)
	    con= 27
	}
	if(con == 28) {
	    mett.velocity.x= 0
	    mett.velocity.y= 1
	    $Alarm4.start((130) / 30.0)
	    con= 29
	}
	if(con == 29) view_yview[0]++
	if(con == 30) {
	    mett.velocity.y= 0
	    mett.velocity.x= 0
	    mett.image_speed= 0
	    con= 31
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 32) {
	    mett.image_speed= 0.1
	    mett.velocity.y= 0.2
	    mett.velocity.x= -0.5
	    $Alarm4.start((180) / 30.0)
	    con= 33
	}
	if(con == 34) {
	    mett2= instance_create(mett.x, mett.y, 1208/* obj_mettaton_dress2 */)
	    with(mett) instance_destroy()
	    mett= mett2
	    mett.arm= 8
	    $Alarm4.start((60) / 30.0)
	    con= 35
	}
	if(con == 36) {
	    GS.interact= 0
	    caster_play(opera2, 1, 1)
	    mett.arm= 0
	    mett.velocity.x= 0.5
	    mett.velocity.y= 0.4
	    con= 38
	    $Alarm4.start((60) / 30.0)
	    drawtext= 1
	}
	if(con == 39) {
	    mett.velocity.x= 0
	    mett.velocity.y= 0
	    con= 40
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 41) {
	    drawtext= 0
	    drawtext2= 1
	    mett.arm= 1
	    mett.velocity.x= -0.25
	    mett.velocity.y= 0
	    con= 42
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 43) {
	    mett.velocity.x= 0
	    mett.velocity.y= 0
	    con= 44
	    $Alarm4.start((70) / 30.0)
	}
	if(con == 45) {
	    drawtext= 1
	    drawtext2= 0
	    string1= "Monster King       "
	    string2= "Forbids your stay  "
	    mett.arm= 0
	    mett.velocity.y= -0.5
	    mett.velocity.x= -1.5
	    con= 46
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 47) {
	    mett.velocity.x= 0
	    mett.velocity.y= 0
	    con= 48
	    $Alarm4.start((45) / 30.0)
	}
	if(con == 49) {
	    drawtext2= 1
	    drawtext= 0
	    mett.velocity.y= 0.5
	    mett.velocity.x= -0.5
	    mett.arm= 2
	    con= 50
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 51) {
	    mett.velocity.x= 0
	    mett.velocity.y= 0
	    con= 52
	    $Alarm4.start((75) / 30.0)
	}
	if(con == 53) {
	    caster_play(opera2, 1, 1)
	    drawtext= 1
	    drawtext2= 0
	    string1= "Humans must       "
	    string2= "Live far apart    "
	    mett.arm= 0
	    mett.velocity.x= -0.5
	    con= 54
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 55) {
	    mett.velocity.x= 0
	    mett.velocity.y= 0
	    con= 56
	    $Alarm4.start((45) / 30.0)
	}
	if(con == 57) {
	    mett.velocity.x= 1
	    mett.arm= 1
	    drawtext2= 1
	    drawtext= 0
	    con= 58
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 59) {
	    mett.velocity.x= 0
	    mett.velocity.y= 0
	    con= 60
	    $Alarm4.start((75) / 30.0)
	}
	if(con == 61) {
	    drawtext= 1
	    drawtext2= 0
	    string1= "Even if             "
	    string2= "It breaks my heart  "
	    mett.arm= 0
	    mett.velocity.x= -0.25
	    con= 62
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 63) {
	    mett.velocity.x= 0
	    mett.velocity.y= 0
	    con= 64
	    $Alarm4.start((45) / 30.0)
	}
	if(con == 65) {
	    mett.velocity.x= -0.5
	    mett.arm= 3
	    drawtext2= 1
	    drawtext= 0
	    con= 66
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 67) {
	    mett.velocity.x= 0
	    mett.velocity.y= 0
	    con= 68
	    cher= instance_create(0, 0, 1201/* obj_cherrygen */)
	    $Alarm4.start((75) / 30.0)
	}
	if(con == 69) {
	    drawtext= 1
	    drawtext2= 0
	    string1= "They\'ll put you    "
	    string2= "In the dungeon     "
	    mett.arm= 0
	    caster_play(opera3, 1, 1)
	    mett.velocity.x= 0.25
	    con= 70
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 71) {
	    mett.velocity.x= 0
	    mett.velocity.y= 0
	    con= 72
	    $Alarm4.start((45) / 30.0)
	}
	if(con == 73) {
	    mett.velocity.x= 0.25
	    mett.arm= 1
	    drawtext2= 1
	    drawtext= 0
	    con= 74
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 75) {
	    mett.velocity.x= 0
	    mett.velocity.y= 0
	    con= 75.5
	    $Alarm4.start((75) / 30.0)
	}
	if(con == 76.5) {
	    drawtext= 1
	    drawtext2= 0
	    string1= "It\'ll suck         "
	    string2= "And then you\'ll#die a lot  "
	    mett.arm= 4
	    mett.velocity.x= 0.25
	    con= 77
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 78) {
	    mett.velocity.x= 0
	    mett.velocity.y= 0
	    con= 79
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 80) {
	    mett.velocity.x= 0
	    mett.velocity.y= -0.5
	    mett.arm= 5
	    drawtext2= 1
	    drawtext= 0
	    con= 81
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 82) {
	    mett.velocity.x= 0
	    mett.velocity.y= 0
	    con= 83
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 84) {
	    drawtext= 1
	    drawtext2= 0
	    string1= "Really sad         "
	    string2= "You\'re gonna die     "
	    mett.arm= 6
	    caster_play(opera4, 1, 1)
	    mett.velocity.x= 0.75
	    con= 85
	    $Alarm4.start((100) / 30.0)
	}
	if(con == 86) {
	    mett.velocity.x= 0
	    mett.velocity.y= 0
	    con= 87
	    $Alarm4.start((5) / 30.0)
	}
	if(con == 88) {
	    mett.velocity.x= 0.4
	    mett.velocity.y= 0.6
	    mett.arm= 7
	    drawtext2= 1
	    drawtext= 0
	    con= 89
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 90) {
	    mett.velocity.x= 0
	    mett.velocity.y= 0
	    con= 91
	    $Alarm4.start((75) / 30.0)
	}
	if(con == 92) {
	    drawtext= 1
	    drawtext2= 0
	    string1= "Cry cry cry      "
	    string2= "So sad it\'s#happening.       "
	    mett.arm= 8
	    mett.velocity.x= -0.5
	    con= 93
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 94) {
	    with(cher) instance_destroy()
	    mett.velocity.x= 0
	    mett.velocity.y= 0
	    con= 95
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 96) {
	    mett.velocity.x= 0
	    mett.velocity.y= 0
	    mett.arm= 9
	    drawtext2= 1
	    drawtext= 0
	    con= 97
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 98) {
	    mett.velocity.x= 0
	    mett.velocity.y= 0
	    con= 99
	    $Alarm4.start((120) / 30.0)
	}
	if(con == 100) {
	    comet= instance_create(90, 150, 1363/* obj_npc_marker */)
	    comet.sprite_index= 1736/* spr_shootingstar */
	    comet.image_speed= 0.25
	    comet.visible= 1
	    drawtext2= 0
	    con= 105
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 105 and is_instance_valid(comet) and comet.frame > 8) {
	    with(comet) instance_destroy()
	}
	if(con == 106) {
	    caster_stop(opera1)
	    mett.speed= 0
	    mett.image_speed= 0
	    GS.interact= 1
	    GS.msg[0]= "* SO SAD./"
	    GS.msg[1]= "* SO SAD THAT YOU ARE&  GOING TO THE DUNGEON./%%"
	    if(skip == 1) {
	        GS.msg[0]= "* OOMPH!&* I AM SO OVERWHELMED WITH&  TRAGEDIES./"
	        GS.msg[1]= "* THE KING HAS ORDERED YOU&  TO WASTE AWAY IN THE CASTLE&  BASEMENT./"
	        GS.msg[2]= "* AND BEFORE WE EVEN HAD&  TIME TO SING A SWEET&  SONG ABOUT IT./"
	        GS.msg[3]= "* MY DEAR HEART^1!&* I CAN BARELY LOOK UPON YOU^1,&  KNOWING WHAT COMES NEXT.../%%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 120
	}
	if(con == 120 and not instance_exists(782/* OBJ_WRITER */)) {
	    mett.velocity.x= 1
	    if(mett.x < obj_mainchara.x + 19) mett.velocity.x= -1
	    if(skip == 1) mett.velocity.x= -3
	    caster_free(-3)
	    mett.arm= 10
	    con= 121
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 122) {
	    mett.velocity.x= 0
	    mett.arm= 11
	    con= 123
	    GS.msg[0]= "* WELL^1, TOODLES!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 123 and not instance_exists(779/* obj_dialoguer */)) {
	    mett.arm= 12
	    blackbox= instance_create(obj_mainchara.x - 4, obj_mainchara.y + 10, 1363/* obj_npc_marker */)
	    blackbox.sprite_index= 996/* spr_pixblk */
	    blackbox.image_speed= 0
	    blackbox.scale.x= 12
	    blackbox.scale.y= 14
	    blackbox.z_index= 1000000
	    blackbox.visible= 1
	    snd_play(106/* snd_noise */)
	    $Alarm4.start((20) / 30.0)
	    con= 124
	}
	if(con == 125) {
	    GS.phasing= 1
	    $Alarm5.start((2) / 30.0)
	    con= 126
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 126) {
	    obj_mainchara.y+= 3
	    obj_mainchara.modulate.a-= 0.05
	}
	if(con == 127) {
	    instance_create(0, 0, 149/* obj_unfader */)
	    $Alarm6.start((12) / 30.0)
	    con= 128
	    GS.plot= 167
	}
	if(con == 240 and not instance_exists(782/* OBJ_WRITER */)) {
	    skip= 1
	    con= 241
	}
	if(con == 241 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msc= 0
	    caster_play(opera1, 0.5, 3)
	    mett.sprite_index= 1739/* spr_mettaton_pulldress */
	    mett.image_speed= 0.5
	    mett.velocity.x= 4
	    $Alarm4.start((20) / 30.0)
	    con= 242
	}
	if(con == 243) {
	    mett.velocity.x= 0
	    mett.velocity.y= 5
	    $Alarm4.start((32) / 30.0)
	    con= 244
	}
	if(con == 244) view_yview[0]+= 4
	if(con == 245) {
	    mett2= instance_create(mett.x, mett.y, 1208/* obj_mettaton_dress2 */)
	    with(mett) instance_destroy()
	    mett= mett2
	    mett.arm= 8
	    con= 106
	}

func _on_alarm_0_timeout():
	if(GS.interact == 0 and con == 0) {
	    con= 1
	    GS.interact= 1
	}

func _gm_event_7_10():
	mett.velocity.x= 0
	mett.velocity.y= 0
	con++
	$Alarm4.start((60) / 30.0)

func _gm_event_7_0():
	if(drawtext == 1) {
	    sn= instance_create(60, 180, 1205/* obj_songwriter */)
	    sn.sting= string1
	    drawtext= 0
	}
	if(drawtext2 == 1) {
	    sn2= instance_create(60, 190, 1205/* obj_songwriter */)
	    sn2.sting= string2
	    drawtext2= 0
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
