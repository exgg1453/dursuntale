# Auto-converted from GameMaker: obj_papsink
# GM parent: obj_readable
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
	conversation= 0
	dogsong= caster_load("music/dogappear.ogg")
	if(GS.flag[82] == 1) frame= 1

func _gm_event_2_2():
	conversation++

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(instance_exists(1025/* obj_papyrusparent */)) {
	    if(GS.flag[82] == 0) {
	        scr_papface(0, 0)
	        conversation= 1
	        GS.msg[1]= "IMPRESSED^1?&I INCREASED THE&HEIGHT OF MY SINK./"
	        GS.msg[2]= "NOW I CAN FIT MORE&BONES UNDER IT^1!&TAKE A LOOKSY!/%%"
	    } else  {
	        scr_papface(0, 3)
	        GS.msg[1]= "FORGET IT./%%"
	    }
	} else  {
	    GS.msg[0]= "* (This sink is so tall^1, you&  can\'t even wash your&  hands...)/%%"
	    conversation= 0
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process(delta: float):
	if(myinteract == 1) {
	    if(obj_kitchenchecker.level == 0) {
	        GS.interact= 1
	        $Alarm0.start((1) / 30.0)
	        myinteract= 2
	    } else  {
	        x-= 400
	        myinteract= 0
	        // obj_mainchara
	        with(1570) {
	            if(GS.facing == 2 and collision_rectangle(x + 4, y + sprite_height - 5, x + sprite_width - 4, y + 5, 1368, 0, 1)) {
	                interactedobject= collision_rectangle(x + 4, y + sprite_height - 5, x + sprite_width - 4, y + 8, 1368, 0, 1)
	                if(interactedobject != -4) {
	                    with(interactedobject) facing= 0
	                    with(interactedobject) script_execute(111/* scr_interact */)
	                }
	            }
	        }
	        x+= 400
	    }
	}
	if(myinteract == 3 and conversation == 0 and not is_instance_valid(mydialoguer)) {
	    GS.interact= 0
	    myinteract= 0
	}
	if(conversation == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    pap= 1025
	    caster_pause(GS.currentsong)
	    $Alarm2.start((10) / 30.0)
	    conversation= 2
	}
	if(conversation == 3) {
	    caster_play(437, 1, 1)
	    frame= 1
	    thedog= instance_create(x + 4, obj_mainchara.y - 20, 1363/* obj_npc_marker */)
	    thedog.visible= 1
	    thedog.sprite_index= 80/* spr_tobydogeat_small */
	    thedog.z_index= z_index + 1
	    thedog.image_speed= 0.25
	    conversation= 4
	    $Alarm2.start((30) / 30.0)
	}
	if(conversation == 5) {
	    dogvolume= 1
	    caster_loop(dogsong, 1, 1)
	    conversation= 5.1
	    $Alarm2.start((30) / 30.0)
	}
	if(conversation == 6.1) {
	    snd_play(29/* snd_b */)
	    blcon= instance_create(obj_papyrusparent.x + 5, obj_papyrusparent.y - 12, 1337/* obj_cosmeticblcon */)
	    conversation= 6
	    $Alarm2.start((30) / 30.0)
	}
	if(conversation == 7) {
	    with(blcon) instance_destroy()
	    GS.faceemotion= 1
	    GS.facechoice= 4
	    GS.msc= 0
	    $Alarm2.start((15) / 30.0)
	    conversation= 8
	}
	if(conversation == 9) {
	    thedog.sprite_index= 82/* spr_tobydogsurprise_small */
	    GS.msg[0]= "WHAT!?!?/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 10
	}
	if(conversation == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	    thedog.sprite_index= 84/* spr_tobydogscoot_small */
	    thedog.z_index= 10000
	    thedog.velocity.y= 5
	    GS.msg[0]= "CATCH THAT&MEDDLING CANINE!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 9.5
	    $Alarm2.start((20) / 30.0)
	}
	if(conversation == 10.5) {
	    thedog.velocity.y= 0
	    thedog.image_speed= 0
	    conversation= 10.6
	    $Alarm2.start((20) / 30.0)
	}
	if(conversation == 11.6 and not instance_exists(782/* OBJ_WRITER */)) {
	    thedog.velocity.y= 4
	    thedog.velocity.x= 1
	    thedog.image_speed= 0.25
	    obj_mainchara.facing= 0
	    GS.facing= 0
	    obj_mainchara.velocity.y= 3
	    obj_mainchara.image_speed= 0.2
	    dogvolume-= 0.04
	    if(dogvolume < 0.04) dogvolume= 0
	    caster_set_volume(dogsong, dogvolume)
	    if(dogvolume == 0) {
	        conversation= 12
	        caster_free(dogsong)
	    }
	}
	if(conversation == 12) {
	    obj_mainchara.velocity.y= 0
	    obj_mainchara.image_speed= 0
	    conversation= 12.1
	    $Alarm2.start((15) / 30.0)
	}
	if(conversation == 13.1) {
	    GS.msg[0]= "CURSES!!!/%%"
	    tt= instance_create(0, 0, 779/* obj_dialoguer */)
	    tt.side= 0
	    conversation= 14
	}
	if(conversation == 14 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_sansdoor.frame= 1
	    caster_play(437, 1, 1)
	    obj_sansdoor.sans= 1
	    $Alarm2.start((80) / 30.0)
	    conversation= 15
	}
	if(conversation == 16) {
	    obj_sansdoor.frame= 0
	    caster_play(436, 1, 1)
	    conversation= 17
	    $Alarm2.start((30) / 30.0)
	}
	if(conversation == 18) {
	    caster_resume(GS.currentsong)
	    GS.faceemotion= 1
	    GS.msg[0]= "SANS!/"
	    GS.msg[1]= "STOP PLAGUING MY&LIFE WITH INCIDENTAL&MUSIC!!!/%%"
	    tt= instance_create(0, 0, 779/* obj_dialoguer */)
	    tt.side= 0
	    conversation= 19
	}
	if(conversation == 19 and not instance_exists(782/* OBJ_WRITER */)) {
	    conversation= 0
	    myinteract= 0
	    GS.flag[82]= 1
	    GS.interact= 0
	}

func _on_alarm_0_timeout():
	if(instance_exists(1414/* obj_kitchenchecker */) and (obj_kitchenchecker.level == 1 or obj_kitchenchecker.level == 0)) {
	    // obj_mainchara
	    with(1570) {
	        x= xprevious
	        y= yprevious
	        moving= 0
	    }
	}

func _gm_event_7_5():
	caster_free(dogsong)

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
