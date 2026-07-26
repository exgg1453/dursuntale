# Auto-converted from GameMaker: obj_floweybattle1
extends Node2D

func _ready():
	floweysong= GS.currentsong
	GS.inbattle= 1
	scale.x= 2
	scale.y= 2
	image_speed= 0
	GS.border= 3
	conversation= 0
	$Alarm0.start((10) / 30.0)
	GS.faceemotion= 0
	SCR_BORDERSETUP(0, 0, 0, 0, 0)

func _gm_event_2_11():
	sprite_index= 173/* spr_floweysideshock */

func _gm_event_2_10():
	sprite_index= 172/* spr_floweypissed */
	$Alarm11.start((60) / 30.0)

func _gm_event_2_9():
	if(conversation <= 15) {
	    snd_stop(52)
	    GS.hshake= 3
	    GS.shakespeed= 1.5
	    GS.vshake= 3
	    snd_play(109/* snd_power */)
	    GS.hp= GS.maxhp
	    instance_create(0, 0, 184/* obj_shaker */)
	    if(instance_exists(610/* obj_fakepellet */)) obj_fakepellet.x= -800
	    conversation= 16
	    image_speed= 0
	    instance_create(x + 200, y + 10, 606/* obj_torielflame_X */)
	    $Alarm10.start((60) / 30.0)
	}

func _gm_event_2_8():
	with(funwriter) instance_destroy()
	GS.typer= 7
	blcon= instance_create(x + sprite_width, y, 187/* obj_blconwdflowey */)
	conversation= 12
	GS.msc= 673
	blconwriter= instance_create(obj_blconwdflowey.x + 40, obj_blconwdflowey.y + 10, 782/* OBJ_WRITER */)

func _gm_event_2_7():
	sprite_index= 179/* spr_floweyevil */
	if(instance_exists(187/* obj_blconwdflowey */)) {
	    // obj_blconwdflowey
	    with(187) instance_destroy()
	}
	$Alarm8.start((30) / 30.0)
	caster_stop(floweysong)
	caster_free(floweysong)

func _gm_event_2_6():
	sprite_index= 174/* spr_floweyside */
	$Alarm5.start((40) / 30.0)
	conversation= 9.3

func _gm_event_2_5():
	with(blconwriter) instance_destroy()
	GS.msc= 0
	GS.msg[0]= "Is this a joke^2?&Are you braindead^2?&RUN^2. INTO^2. THE.&friendliness pellets/"
	GS.msg[1]= "/"
	GS.msg[2]= "/"
	GS.msg[3]= "/"
	GS.msg[4]= "/"
	GS.msg[5]= "/"
	GS.msg[6]= "/"
	GS.msg[7]= "/"
	GS.msg[8]= "/"
	GS.msg[9]= "/"
	GS.msg[10]= "stop it"
	funwriter= instance_create(obj_blconwdflowey.x + 40, obj_blconwdflowey.y + 10, 785/* OBJ_INSTAWRITER */)
	sprite_index= 166/* spr_floweynice */
	frame= 1
	image_speed= 0
	conversation= 9.4
	i= 0
	while(i != 5) {
	    ddd= instance_find(609, i)
	    ddd.x= ddd.blonicx
	    ddd.y= ddd.blonicy
	    ddd.attackyou= 1
	    i++
	}

func _gm_event_2_4():
	$Alarm6.start((170) / 30.0)
	GS.typer= 6
	blcon= instance_create(x + sprite_width, y, 187/* obj_blconwdflowey */)
	conversation= 9.2
	GS.msc= 672
	blconwriter= instance_create(obj_blconwdflowey.x + 40, obj_blconwdflowey.y + 10, 782/* OBJ_WRITER */)

func _gm_event_2_3():
	GS.typer= 6
	blcon= instance_create(x + sprite_width, y, 187/* obj_blconwdflowey */)
	conversation= 7
	GS.msc= 671
	blconwriter= instance_create(obj_blconwdflowey.x + 40, obj_blconwdflowey.y + 10, 782/* OBJ_WRITER */)

func _gm_event_2_2():
	GS.typer= 20
	blcon= instance_create(x + sprite_width, y, 187/* obj_blconwdflowey */)
	conversation= 14
	GS.msc= 670
	blconwriter= instance_create(obj_blconwdflowey.x + 40, obj_blconwdflowey.y + 10, 782/* OBJ_WRITER */)

func _gm_event_2_1():
	GS.typer= 7
	blcon= instance_create(x + sprite_width, y, 187/* obj_blconwdflowey */)
	conversation= 12
	GS.msc= 669
	blconwriter= instance_create(obj_blconwdflowey.x + 40, obj_blconwdflowey.y + 10, 782/* OBJ_WRITER */)

func _on_destroy():
	blcon= instance_create(x + sprite_width, y, 187/* obj_blconwdflowey */)
	GS.msc= 666
	GS.typer= 6
	conversation= 1
	image_speed= 0.2
	instance_create(obj_fakeheart.x - 14, obj_fakeheart.y - 14, 197/* obj_guidearrows */)
	blconwriter= instance_create(obj_blconwdflowey.x + 40, obj_blconwdflowey.y + 10, 782/* OBJ_WRITER */)

func _process(delta: float):
	SCR_BORDERSETUP(0, 0, 0, 0, 0)
	if(instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.halt != 0) {
	        image_speed= 0
	        frame= 0
	    } else  image_speed= 0.2
	}
	if(not instance_exists(202/* obj_winkstar */) and not instance_exists(782/* OBJ_WRITER */)) {
	    if(conversation == 17) {
	        rotation_degrees+= 5
	        gravity_direction= 270
	        direction= 155
	        speed= 20
	        gravity= 10
	    }
	    if(conversation == 14) {
	        sprite_index= 178/* spr_floweylaugh */
	        image_speed= 0.5
	        with(blcon) instance_destroy()
	        obj_fakepellet.attackyou= 1
	        obj_fakeheart.movement= 1
	        conversation= 15
	        snd_play(52/* snd_floweylaugh */)
	        $Alarm9.start((150) / 30.0)
	    }
	    if(conversation == 12) {
	        GS.border= 4
	        with(blcon) instance_destroy()
	        sprite_index= 179/* spr_floweyevil */
	        $Alarm2.start((70) / 30.0)
	        conversation= 13
	        obj_fakeheart.movement= 0
	        instance_create((obj_uborder.x + obj_rborder.x) / 2, obj_dborder.y + 40, 607/* obj_radialfakegen */)
	    }
	    if(conversation == 10) {
	        caster_stop(floweysong)
	        sprite_index= 175/* spr_floweygrin */
	        $Alarm1.start((60) / 30.0)
	        conversation= 11
	    }
	    if(conversation == 9) {
	        $Alarm4.start((30) / 30.0)
	        sprite_index= 172/* spr_floweypissed */
	        caster_set_pitch(floweysong, 0.9)
	        conversation= 9.1
	    }
	    if(conversation == 7) {
	        with(blcon) instance_destroy()
	        sprite_index= 166/* spr_floweynice */
	        i= 0
	        while(i != 5) {
	            ddd= instance_find(609, i)
	            ddd.x= ddd.blonicx
	            ddd.y= ddd.blonicy
	            ddd.attackyou= 1
	            i++
	        }
	        conversation= 8
	    }
	    if(conversation == 5) {
	        caster_set_pitch(floweysong, 0.95)
	        sprite_index= 171/* spr_floweysassy */
	        conversation= 6
	        $Alarm3.start((30) / 30.0)
	    }
	    if(conversation == 3) {
	        with(blcon) instance_destroy()
	        frame= 0
	        image_speed= 0
	    }
	    if(conversation == 2) {
	        sprite_index= 166/* spr_floweynice */
	        obj_friendlypellet.attackyou= 1
	        GS.msc= 668
	        blconwriter= instance_create(obj_blconwdflowey.x + 40, obj_blconwdflowey.y + 10, 782/* OBJ_WRITER */)
	        conversation= 3
	    }
	    if(conversation == 1.5) {
	        blcon= instance_create(x + sprite_width, y, 187/* obj_blconwdflowey */)
	        GS.msc= 667
	        blconwriter= instance_create(obj_blconwdflowey.x + 40, obj_blconwdflowey.y + 10, 782/* OBJ_WRITER */)
	        conversation= 2
	        sprite_index= 169/* spr_floweyniceside */
	        instance_create(x - 5 + sprite_width / 2, y + sprite_width / 2, 609/* obj_friendlypellet */)
	        instance_create(x - 5 + sprite_width / 2, y + sprite_width / 2, 609/* obj_friendlypellet */)
	        instance_create(x - 5 + sprite_width / 2, y + sprite_width / 2, 609/* obj_friendlypellet */)
	        instance_create(x - 5 + sprite_width / 2, y + sprite_width / 2, 609/* obj_friendlypellet */)
	        instance_create(x - 5 + sprite_width / 2, y + sprite_width / 2, 609/* obj_friendlypellet */)
	    }
	    if(conversation == 1) {
	        sprite_index= 168/* spr_floweywink */
	        conversation= 1.5
	        with(blcon) instance_destroy()
	        instance_create(x + 70, y + 10, 202/* obj_winkstar */)
	    }
	}
	if(conversation == 9.5) {
	    $Alarm7.start((80) / 30.0)
	    OBJ_WRITER.halt= 3
	    with(blcon) instance_destroy()
	    conversation= 9.6
	    pitchlower= 1
	}
	if(conversation == 9.6) {
	    pitchlower-= 0.02
	    if(pitchlower > -0.5) {
	        caster_set_pitch(floweysong, 0.65 + pitchlower / 4)
	        caster_set_volume(floweysong, 0.5 + pitchlower / 2)
	    }
	}
	if(GS.faceemotion == 1) sprite_index= 170/* spr_floweynicesideum */
	if(GS.faceemotion == 2) sprite_index= 166/* spr_floweynice */
	if(conversation == 13) {
	    if(obj_fakeheart.x < obj_lborder.x) obj_fakeheart.x= obj_lborder.x
	    if(obj_fakeheart.x > obj_rborder.x) obj_fakeheart.x= obj_rborder.x
	    if(obj_fakeheart.y < obj_uborder.y) obj_fakeheart.y= obj_uborder.y
	}
	if(instance_exists(782/* OBJ_WRITER */) and conversation == 1)
	    scr_textskip()

func _gm_event_7_0():
	if(not instance_exists(200/* obj_torielcutscene */))
	    instance_create(xstart + 500, ystart - 80, 200/* obj_torielcutscene */)

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
