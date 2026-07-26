# Auto-converted from GameMaker: obj_endogeny
# GM parent: obj_dogeparent
extends Node2D

func _ready():
	// obj_battlebg
	with(185) instance_destroy()
	scr_monstersetup()
	image_speed= 0
	part1= 556
	mypart1= _spawn("part1", x, y)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 96
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -25
	dogignore= 0
	close= 0
	pet= 0
	sha= 0
	shb= 0
	mycommand= 90
	turns= 0
	dogsong= caster_load("music/dogsong.ogg")
	ht= 150
	wd= 300

func _gm_event_1_0():
	GS.flag[10]= 1
	GS.flag[23]++
	GS.monster[myself]= 0
	with(mypart1) fader= 1
	caster_free(dogsong)

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	if(mycommand > 50) mycommand= 0
	else  mycommand= 90
	GS.border= 5
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	talked= 0
	GS.mnfight= 2
	GS.border= 5

func _gm_event_2_3():
	if(mypart1.pause != 1) {
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    GS.damage= 0
	    with(dmgwriter) dmg= 0
	    dmgwriter.special= 1
	    mypart1.pause= 1
	    snd_play(51/* snd_damage */)
	    $Alarm8.start((11) / 30.0)
	}
	if(sha == 0) sha= x
	x= sha + shudder
	if(shudder < 0) shudder= -(shudder + 1)
	else  shudder= -shudder
	if(shudder == 0) {
	    sha= 0
	    GS.hurtanim[myself]= 2
	    exit
	} else  {
	    $Alarm3.start((2) / 30.0)
	    exit
	}

func _process(delta: float):
	if(GS.mnfight == 3) attacked= 0
	if(alarm[5] > 0) {
	    if(GS.monster[0] == 1 and GS.monsterinstance[0].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[0].alarm[5]) / 30.0)
	    if(GS.monster[1] == 1 and GS.monsterinstance[1].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[1].alarm[5]) / 30.0)
	    if(GS.monster[2] == 1 and GS.monsterinstance[2].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[2].alarm[5]) / 30.0)
	}
	if(GS.mnfight == 1 and talked == 0) {
	    $Alarm5.start((20) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(keyboard_multicheck_pressed(13/* ENTER */) and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0] and alarm[6] < 0)
	    $Alarm5.start((2) / 30.0)
	if(GS.hurtanim[myself] == 1) {
	    shudder= 8
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        GS.hurtanim[myself]= 0
	        mypart1.pause= 0
	        GS.myfight= 0
	        GS.mnfight= 1
	    } else  {
	        GS.myfight= 0
	        GS.mnfight= 1
	        killed= 1
	        instance_destroy()
	    }
	}
	if(GS.hurtanim[myself] == 5) {
	    GS.damage= 0
	    instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    // obj_dmgwriter
	    with(189) $Alarm2.start((30) / 30.0)
	    GS.myfight= 0
	    GS.mnfight= 1
	    GS.hurtanim[myself]= 0
	}
	if(GS.mnfight == 2) {
	    if(attacked == 0) {
	        pop= scr_monstersum()
	        GS.turntimer= 200
	        GS.firingrate= 10
	        if(pop == 3) GS.firingrate*= 2.5
	        if(pop == 2) GS.firingrate*= 1.8
	        if(mycommand >= 50) {
	            gen= instance_create(0, 0, 545/* obj_amalgam_rocketdog */)
	            gen.dmg= GS.monsteratk[myself]
	        } else  {
	            gen= instance_create(0, 0, 544/* obj_amalgam_laserdog */)
	            gen.dmg= GS.monsteratk[myself]
	            if(turns == 1) {
	                with(gen) {
	                    con= 4
	                    frame= 7
	                }
	            }
	        }
	        turns= 1
	        if(mycommand >= 0)
	            GS.msg[0]= "* Amalgamate is watching you&  intently."
	        if(mycommand >= 45)
	            GS.msg[0]= "* Amalgamate is waiting for&  your command."
	        if(mycommand >= 90)
	            GS.msg[0]= "* It smells like a bunch of dogs."
	        if(close == 1)
	            GS.msg[0]= "* Amalgamate is hovering close^1,&  looking for affection."
	        if(pet == 1)
	            GS.msg[0]= "* Amalgamate is striking the&  wall with its claws."
	        if(pet == 2)
	            GS.msg[0]= "* Amalgamate is twitching&  affectionately."
	        if(pet == 3)
	            GS.msg[0]= "* Amalgamate\'s convulsions&  intensify."
	        if(pet == 4) {
	            GS.msg[0]= "* Endogeny is contented."
	            GS.monstername[myself]= "Endogeny"
	        }
	        if(GS.monsterhp[myself] <= GS.monstermaxhp[myself] / 4)
	            GS.msg[0]= "* Monster has low HP."
	        if(mercymod == 999999) {
	            GS.msg[0]= "* Endogeny is contented."
	            GS.monstername[myself]= "Endogeny"
	        }
	        attacked= 1
	    }
	    if(mercymod == 999999) {
	        GS.turntimer= -1
	        GS.mnfight= 3
	    }
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* AMALGAMATE - It\'s unclear how&  many dogs this counts as./^"
	        if(mercymod == 999999)
	            GS.msg[0]= "* ENDOGENY - It\'s unclear how&  many dogs this counts as./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        if(close == 1)
	            GS.msg[0]= "* The Amalgamate\'s feelers&  rotate quickly^1.&* Nothing else happens./^"
	        if(close == 0) {
	            GS.msg[0]= "* You call the Amalgamate./"
	            GS.msg[1]= "* It bounds towards you^1,&  flecking a strange liquid&  from an orifice./^"
	            mypart1.moutvelocity.x= 0.1
	            caster_set_pitch(GS.batmusic, 0.9)
	            close= 1
	        }
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 2) {
	        GS.msc= 0
	        GS.msg[0]= "* You try looking away^1, but&  it seems to appear everywhere&  you look./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You pet the Amalgamate./^"
	        if(pet == 4)
	            GS.msg[0]= "* You\'d give it a tummy rub^1,&  but it\'s not clear where its&  tummy begins or ends./^"
	        if(pet == 3) {
	            pet= 4
	            GS.msg[0]= "* You pet decisively^1.&* The Amalgamate seems to be&  satisfied by all this./^"
	            caster_set_volume(GS.batmusic, 0.3)
	            caster_set_pitch(GS.batmusic, 0.8)
	            caster_loop(dogsong, 0.8, 0.8)
	            mypart1.spared= 1
	            GS.sp= obj_battlecontroller.tempspd
	            mercymod= 999999
	            GS.flag[156]= 1
	        }
	        if(pet == 2) {
	            GS.msg[0]= "* You pet the Amalgamate^1.&* It starts to generate a&  Stage I Happiness Froth./^"
	            caster_set_pitch(GS.batmusic, 1.2)
	            mypart1.moutvelocity.x= 1
	            mypart1.shaker= 4
	            pet= 3
	        }
	        if(pet == 1) {
	            GS.msg[0]= "* You try to pet the&  Amalgamate but your hand&  phases through it./"
	            GS.msg[1]= "* It must not want to be pet&  for now./^"
	        }
	        if(close == 1 and pet == 0) {
	            GS.msg[0]= "* You pet the Amalgamate^1.&* It convulses rapidly..^1.&* Then calms down./"
	            GS.msg[1]= "* It rests quietly on your&  lap for a moment.../"
	            GS.msg[2]= "* Zzzzz.../"
	            GS.msg[3]= "* Suddenly^1, it shoots away and&  crawls wildly on the walls!/^"
	            mypart1.moutvelocity.x= 0.2
	            mypart1.shaker= 1
	            caster_set_pitch(GS.batmusic, 1)
	            pet= 1
	        }
	        if(close == 0)
	            GS.msg[0]= "* Amalgamate is too far&  away to pet^1.&* You just pet the air./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 4) {
	        GS.msc= 0
	        GS.msg[0]= "* You play with the Amalgamate./^"
	        if(pet > 1)
	            GS.msg[0]= "* Amalgamate seems too tired&  to play./^"
	        if(pet == 1) {
	            GS.msg[0]= "* You throw your weapon into&  the corner of the room./"
	            GS.msg[1]= "* The Amalgamate brings it back&  to you..^1.&* Proudly?/"
	            GS.msg[2]= "* You repeat this process a&  few times./"
	            GS.msg[3]= "* Now Amalgamate is very tired..^1.&* It leans its dripping^1,&  amorphous body on you.../^"
	            pet= 2
	            mypart1.moutvelocity.x= 0.5
	            mypart1.shaker= 2
	            caster_set_pitch(GS.batmusic, 1.1)
	        }
	        if(pet == 0)
	            GS.msg[0]= "* Amalgamate is not excited&  enough to play with...?/^"
	        GS.msc= 0
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(mercymod == 222 and not instance_exists(782/* OBJ_WRITER */)) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
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
