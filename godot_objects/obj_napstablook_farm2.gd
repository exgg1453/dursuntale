# Auto-converted from GameMaker: obj_napstablook_farm2
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1129
	usprite= 1131
	lsprite= 1126
	rsprite= 1127
	dtsprite= 1129
	utsprite= 1131
	ltsprite= 1126
	rtsprite= 1127
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	fun= 0
	con= 0
	bringback= 0
	buffer= 0
	if(scr_murderlv() < 10) {
	    snail[0]= instance_create(690, 70, 1363/* obj_npc_marker */)
	    snail[0].sprite_index= 1558/* spr_snailyellow */
	    snail[1]= instance_create(690, 100, 1363/* obj_npc_marker */)
	    snail[1].sprite_index= 1562/* spr_snailred */
	    snail[2]= instance_create(690, 130, 1363/* obj_npc_marker */)
	    snail[2].sprite_index= 1564/* spr_snailblue */
	    i= 0
	    while(i < 3) {
	        snail[i].z_index= 4000
	        snail[i].image_speed= 0
	        snail[i].visible= 1
	        i++
	    }
	}
	blcontimer= 0
	encouragement= 0
	blconyes= 0
	snailtimer= 0
	snailsad= 0
	won= 0
	fun= 0
	con= 0
	bringback= 0
	if(GS.flag[7] == 1) instance_destroy()
	if(scr_murderlv() >= 10) instance_destroy()

func _gm_event_2_4():
	con++

func _on_destroy():
	myinteract= 3
	if(con == 0) GS.msc= 619
	else  {
	    GS.msc= 619
	    blcontimer= 0
	    encouragement= 0
	    blconyes= 0
	    snailtimer= 0
	    snailsad= 0
	    won= 0
	    fun= 0
	    con= 0
	}
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	scr_npc_anim()
	script_execute(106/* scr_npcdir */, 2)
	modulate.a= 0
	if(instance_exists(1570/* obj_mainchara */)) {
	    dist= distance_to_object(1570)
	    if(dist < 60) {
	        disto= 5 / (dist + 2)
	        if(disto > 1) disto= 1
	        modulate.a= disto
	    }
	}
	if(con == 1) {
	    GS.interact= 1
	    con= 2
	    tempvol= caster_get_volume(GS.currentsong)
	}
	if(con == 2) {
	    GS.interact= 1
	    tempvol-= 0.02
	    if(tempvol <= 0) {
	        tempvol= 0
	        con= 3
	        caster_pause(GS.currentsong)
	    }
	    caster_set_volume(GS.currentsong, tempvol)
	}
	if(con == 3) GS.interact= 1
	if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 1
	    race= caster_load("music/race.ogg")
	    con= 4
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 4) GS.interact= 1
	if(con == 5) {
	    GS.interact= 1
	    direction= 90
	    GS.facing= 2
	    GS.msc= 0
	    GS.typer= 5
	    GS.msg[0]= "\\R 3..^2.& 2..^2.& 1..^2.%%"
	    instance_create(view_xview[0] + 60, 20, 782/* OBJ_WRITER */)
	    con= 6
	}
	if(con == 6) GS.interact= 1
	if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    bringback= 0
	    caster_loop(race, 1, 1)
	    GS.msg[0]= "\\R GO!!^2!%%"
	    instance_create(view_xview[0] + 60, 20, 782/* OBJ_WRITER */)
	    defaultspeed= -0.13
	    snail[0].velocity.x= defaultspeed
	    snail[0].image_speed= 0.25
	    snail[1].velocity.x= -0.18
	    snail[1].image_speed= 0.25
	    snail[2].velocity.x= -0.17
	    snail[2].image_speed= 0.25
	    con= 7
	}
	if(con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(keyboard_multicheck_pressed(0/* NOKEY */) and blcontimer <= 15) {
	        snd_stop(29)
	        snd_play(29/* snd_b */)
	        if(blconyes == 1) {
	            with(blcon) instance_destroy()
	            with(blcon2) instance_destroy()
	        }
	        blcon= instance_create(obj_mainchara.x, obj_mainchara.y - 10, 1337/* obj_cosmeticblcon */)
	        blcon2= instance_create(snail[0].x, snail[0].y - 10, 1337/* obj_cosmeticblcon */)
	        snail[0].velocity.x= 0
	        encouragement++
	        blconyes= 1
	        blcontimer= 11 + random(8)
	    }
	    if(blcontimer <= 0 and blconyes == 1) {
	        with(blcon) instance_destroy()
	        with(blcon2) instance_destroy()
	        blconyes= 0
	        if(encouragement == 1 and snailsad == 0) {
	            defaultspeed-= 0.01
	            snail[0].velocity.x= defaultspeed
	        }
	        if(encouragement == 2) snail[0].velocity.x= defaultspeed
	        if(encouragement >= 3) {
	            defaultspeed+= 0.01 * encouragement
	            snail[0].velocity.x= defaultspeed
	        }
	        encouragement= 0
	    }
	    if(snail[0].velocity.x > 0 or encouragement > 30) {
	        if(snail[0].velocity.x > 0 or encouragement > 90) {
	            snail[1].velocity.x= -0.4
	            snail[2].velocity.x= -0.44
	        }
	        if((snail[0].velocity.x > 0 or encouragement > 70) and snail[0].sprite_index == 1560)
	            snail[0].sprite_index= 1561/* spr_snailyellow_hopeless3 */
	        if((snail[0].velocity.x > 0 or encouragement > 50) and snail[0].sprite_index == 1559) {
	            snail[0].sprite_index= 1560/* spr_snailyellow_hopeless2 */
	            snailsad= 2
	        }
	        if((snail[0].velocity.x > 0 or encouragement > 30) and snail[0].sprite_index == 1558) {
	            snail[0].sprite_index= 1559/* spr_snailyellow_hopeless */
	            snailsad= 1
	        }
	        snail[0].velocity.x= 0
	    }
	    blcontimer--
	    snailtimer--
	    if(snail[0].x < 490) won= 1
	    if(snail[0].x < 480) con= 8
	    if(snail[1].x < 480) {
	        con= 8
	        if(won == 1) won= 2
	    }
	    if(snail[2].x < 480) {
	        con= 8
	        if(won == 1) won= 2
	    }
	}
	if(con == 8) {
	    caster_free(race)
	    snd_play(111/* snd_select */)
	    GS.msg[0]= "\\R RACE END!!^2!%%"
	    instance_create(view_xview[0] + 60, 20, 782/* OBJ_WRITER */)
	    caster_resume(GS.currentsong)
	    GS.msc= 0
	    snail[0].velocity.x= 0
	    snail[1].velocity.x= 0
	    snail[2].velocity.x= 0
	    snail[0].image_speed= 0
	    snail[1].image_speed= 0
	    snail[2].image_speed= 0
	    con= 9
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 10) {
	    tempvol+= 0.02
	    if(tempvol >= 1) {
	        tempvol= 1
	        con= 11
	    }
	    caster_set_volume(GS.currentsong, tempvol)
	}
	if(con == 11) {
	    direction= 180
	    GS.facing= 1
	    if(won == 0) {
	        GS.msg[0]= "* oh........^1.&* you both tried your best.../"
	        GS.msg[1]= "* but the snail looks&  discouraged.../"
	        GS.msg[2]= "* her best wasn\'t good&  enough.../"
	        GS.msg[3]= "* oh........../%%"
	        if(snailsad > 0) {
	            GS.msg[0]= "* oh.......^1.&* looks like you encouraged&  your snail too much.../"
	            GS.msg[1]= "* all that pressure to&  succeed..^1.&* really got to her.../"
	            GS.msg[2]= "* oh......../%%"
	        }
	    }
	    if(won == 1) {
	        GS.msg[0]= "* you won..^1. congratulations./"
	        GS.msg[1]= "* as a prize^1, you get 9G./"
	        GS.msg[2]= "* sorry..^1. we have to make&  a profit somehow.../%%"
	        GS.gold+= 9
	    }
	    if(won == 2) {
	        GS.msg[0]= "* your snail lost by a&  thin margin./"
	        GS.msg[1]= "* actually^1, the snail is&  under the false belief&  that it won.../"
	        GS.msg[2]= "* oh no..^1. the snail is looking&  over here.../"
	        GS.msg[3]= "* here^1, i\'ll give you some&  money..^1.&* act like you won.../"
	        GS.msg[4]= "* (You got 30G.)/%%"
	        GS.gold+= 30
	    }
	    scr_regulartext()
	    con= 12
	}
	if(con == 12) buffer= 8
	if(con == 12 and not instance_exists(782/* OBJ_WRITER */)) {
	    bringback= 1
	    GS.interact= 0
	    con= 13
	}
	if(bringback == 1) {
	    there= 0
	    if(snail[0].sprite_index != 1558) snail[0].sprite_index= 1558/* spr_snailyellow */
	    i= 0
	    while(i < 3) {
	        if(snail[i].x < snail[i].xstart) {
	            snail[i].x+= 4
	            snail[i].image_speed= 0.334
	        } else  {
	            snail[i].x= snail[i].xstart
	            snail[i].image_speed= 0
	            there++
	        }
	        i++
	    }
	    if(there >= 3) bringback= 2
	}

func _process(delta: float):
	buffer--
	if(myinteract == 1 and buffer > 0) myinteract= 0
	if(myinteract == 1 and buffer <= 0) {
	    GS.interact= 1
	    $Alarm0.start((1) / 30.0)
	    myinteract= 2
	}
	if(myinteract == 3 and not is_instance_valid(mydialoguer)) {
	    if(con == 0) GS.interact= 0
	    myinteract= 0
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
