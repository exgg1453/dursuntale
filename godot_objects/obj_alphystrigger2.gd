# Auto-converted from GameMaker: obj_alphystrigger2
extends Node2D

func _ready():
	if(GS.plot > 126 or scr_murderlv() >= 12) instance_destroy()
	con= 0
	scale.y= 7

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con > 0) {
	    if(con == 1) {
	        GS.interact= 1
	        alphys= 1170
	        alphys.direction= 0
	        GS.typer= 47
	        GS.msc= 0
	        GS.faceemotion= 3
	        GS.facechoice= 6
	        GS.msg[0]= "* Wait^1, wait!/%%"
	        if(obj_mainchara.x > alphys.x) alphys.direction= 0
	        if(obj_mainchara.x < alphys.x) alphys.direction= 180
	        con= 2
	        instance_create(0, 0, 779/* obj_dialoguer */)
	    }
	    if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	        alphys.image_speed= 0.334
	        if(obj_mainchara.x > alphys.x) GS.facing= 3
	        if(obj_mainchara.x < alphys.x) GS.facing= 1
	        if(obj_mainchara.y > alphys.y) {
	            up= 0
	            alphys.direction= 270
	            alphys.velocity.y= 3
	            con= 3
	        }
	        if(obj_mainchara.y < alphys.y) {
	            up= 1
	            alphys.direction= 90
	            alphys.velocity.y= -3
	            con= 3
	        }
	        if(abs(obj_mainchara.y - alphys.y) <= 5) {
	            up= 3
	            alphys.velocity.y= 0
	            con= 4
	        }
	    }
	    if(con == 3 and abs(obj_mainchara.y - alphys.y) <= 3) {
	        up= 3
	        con= 4
	    }
	    if(con == 4) {
	        if(obj_mainchara.x > alphys.x) {
	            alphys.direction= 0
	            alphys.velocity.x= 3
	        }
	        if(obj_mainchara.x < alphys.x) {
	            alphys.direction= 180
	            alphys.velocity.x= -3
	        }
	        con= 5
	    }
	    if(con == 5 and abs(obj_mainchara.x + 10 - alphys.x + alphys.sprite_width / 2) < 30) {
	        alphys.image_speed= 0
	        alphys.velocity.x= 0
	        if(obj_mainchara.x > alphys.x) alphys.direction= 0
	        if(obj_mainchara.x < alphys.x) alphys.direction= 180
	        con= 6
	        $Alarm4.start((20) / 30.0)
	    }
	    if(con == 7) {
	        GS.msg[0]= "\\E0* Let me give you my&  ph-phone number!/"
	        GS.msg[1]= "\\E7* Th-then..^1. m-maybe..^1.&* If you need help^1,&  I could.../%%"
	        instance_create(0, 0, 779/* obj_dialoguer */)
	        con= 8
	    }
	    if(con == 8 and not instance_exists(782/* OBJ_WRITER */)) {
	        con= 9
	        $Alarm4.start((15) / 30.0)
	    }
	    if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	        blc= instance_create(alphys.x + 8, alphys.y - 5, 1337/* obj_cosmeticblcon */)
	        snd_play(29/* snd_b */)
	        $Alarm4.start((30) / 30.0)
	        con= 11
	    }
	    if(con == 12 and not instance_exists(782/* OBJ_WRITER */)) {
	        with(blc) instance_destroy()
	        GS.msg[0]= "\\E3* Wh..^1. where\'d you get&  that phone!?&* It\'s ANCIENT!/"
	        GS.msg[1]= "\\E1* It doesn\'t even have&  texting./"
	        GS.msg[2]= "\\E3* W-wait a second^1,&  please!/%%"
	        instance_create(0, 0, 779/* obj_dialoguer */)
	        con= 13
	    }
	    if(con == 13 and not instance_exists(782/* OBJ_WRITER */)) {
	        if(obj_mainchara.x > alphys.x) alphys.direction= 180
	        if(obj_mainchara.x < alphys.x) alphys.direction= 0
	        alphys.speed= 6
	        alphys.image_speed= 0.5
	        con= 14
	    }
	    if(con == 14 and (alphys.x > view_xview[0] + view_wview[0] + 30 or alphys.x < view_xview[0] - 30)) {
	        caster_pause(GS.currentsong)
	        alphys.speed= 0
	        noise= caster_load("music/alphysfix.ogg")
	        caster_play(noise, 0.8, 1)
	        con= 15
	        $Alarm4.start((100) / 30.0)
	    }
	    if(con == 16) {
	        caster_free(noise)
	        caster_resume(GS.currentsong)
	        if(obj_mainchara.x > alphys.x) alphys.direction= 0
	        if(obj_mainchara.x < alphys.x) alphys.direction= 180
	        alphys.speed= 6
	        if(abs(obj_mainchara.x + 10 - alphys.x + alphys.sprite_width / 2) < 30) {
	            alphys.image_speed= 0
	            alphys.speed= 0
	            if(obj_mainchara.x > alphys.x) alphys.direction= 0
	            if(obj_mainchara.x < alphys.x) alphys.direction= 180
	            con= 17
	            $Alarm4.start((20) / 30.0)
	        }
	    }
	    if(con == 18) {
	        GS.faceemotion= 0
	        GS.msg[0]= "\\E0* Here^1, I upgraded it&  for you!/"
	        GS.msg[1]= "* It can do texting^1,&  items^1, it\'s got a&  key chain.../"
	        GS.msg[2]= "* I even signed you up&  for the underground\'s&  No. 1 social network!/"
	        GS.msg[3]= "\\E7* Now we\'re officially&  friends^1!&* Ehehehe!/"
	        GS.msg[4]= "\\E0* Heheh.../"
	        GS.msg[5]= "\\E0* Heh.../"
	        GS.msg[6]= "\\E0* .../"
	        GS.msg[7]= "\\E1* .../"
	        GS.msg[8]= "\\E2* .../"
	        GS.msg[9]= "\\E1* .../"
	        GS.msg[10]= "\\E2* .../"
	        GS.msg[11]= "\\E4* I\'m going to the&  bathroom./%%"
	        instance_create(0, 0, 779/* obj_dialoguer */)
	        slid= 0
	        con= 19
	        scr_phoneget(220)
	        scr_phoneget(221)
	    }
	    if(con == 19 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 11 and slid == 0) {
	        // obj_slidingdoor
	        with(1291) event_user(0)
	        slid= 1
	    }
	    if(con == 19 and not instance_exists(782/* OBJ_WRITER */)) {
	        con= 20
	        if(obj_mainchara.x > alphys.x) alphys.direction= 180
	        if(obj_mainchara.x < alphys.x) alphys.direction= 0
	        alphys.speed= 6
	        alphys.image_speed= 0.5
	    }
	    if(con == 20 and abs(alphys.x - obj_slidingdoor.x + 12) < 40) {
	        if(alphys.x > obj_mainchara.x) {
	            // obj_slidingdoor
	            with(1291) event_user(0)
	        }
	        con= 21
	    }
	    if(con == 21) {
	        if(alphys.direction == 0 and alphys.x >= obj_slidingdoor.x + 10) {
	            alphys.direction= 90
	            con= 22
	        }
	        if(alphys.direction == 180 and alphys.x <= obj_slidingdoor.x + 15) {
	            alphys.direction= 90
	            con= 22
	        }
	    }
	    if(con == 22 and alphys.y < obj_slidingdoor.y + 60) {
	        alphys.d= 1
	        alphys.z_index= obj_slidingdoor.z_index + 1
	        // obj_slidingdoor
	        with(1291) event_user(1)
	        con= 23
	    }
	    if(con == 23 and alphys.y < obj_slidingdoor.y + 26) {
	        alphys.direction= 270
	        alphys.speed= 0
	        alphys.image_speed= 0.1
	        alphys.y= obj_slidingdoor.y + 25
	        con= 24
	        GS.plot= 127
	        GS.interact= 0
	        // obj_alphystrigger2
	        with(1290) instance_destroy()
	    }
	}

func _on_alarm_0_timeout():
	if(GS.plot > 125 and con == 0 and GS.interact == 0) {
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
