# Auto-converted from GameMaker: obj_savepoint_fake
# GM parent: obj_interactable
extends Node2D

func _ready():
	myinteract= 0
	image_speed= 0.25
	z_index= 50000 - y * 10
	con= 0
	drawthis= 0
	crack= 0
	shake= -1
	nowxx= 0
	nowyy= 0
	obj_screen.messed= 2

func _gm_event_2_4():
	con++

func _on_outside_room():
	if(myinteract == 0)
	    draw_sprite(sprite_index, frame, x, y)
	if(myinteract == 1 and con == 0) {
	    _play_sound("155")
	    con= 1
	    drawthis= 1
	    $Alarm4.start((90) / 30.0)
	    xx= view_xview[0]
	    yy= view_yview[0] - 10
	    nowxx= view_xview[0]
	    nowyy= view_yview[0] - 10
	}
	if(drawthis == 1) {
	    GS.interact= 1
	    iniread= ini_open("undertale.ini")
	    name= ini_read_string("General", "Name", "EMPTY")
	    love= ini_read_real("General", "Love", 0)
	    time= ini_read_real("General", "Time", 0)
	    kills= ini_read_real("General", "Kills", 0)
	    roome= ini_read_real("General", "Room", 0)
	    ini_close()
	    draw_set_font(10)
	    draw_set_color(16777215)
	    draw_rectangle(54 + xx, 49 + yy, 265 + xx, 135 + yy, 0)
	    draw_set_color(0)
	    draw_rectangle(57 + xx, 52 + yy, 262 + xx, 132 + yy, 0)
	    draw_set_color(16777215)
	    minutes= floor(time / 1800)
	    seconds= round((time / 1800 - minutes) * 60)
	    if(seconds == 60) seconds= 59
	    if(seconds < 10) seconds= "0" + string(seconds)
	    script_execute(54/* scr_roomname */, roome)
	    draw_text(70 + xx, 60 + yy, name)
	    draw_text(140 + xx, 60 + yy, "LV " + string(love))
	    draw_text(210 + xx, 60 + yy, string(minutes) + ":" + string(seconds))
	    draw_text(70 + xx, 80 + yy, roomname)
	    draw_text(xx + 85, yy + 110, "Save")
	    draw_text(xx + 175, yy + 110, "Return")
	}
	if(con == 2) {
	    punch= caster_load("music/sfx_gigapunch.ogg")
	    explosion= caster_load("music/explosion.ogg")
	    caster_play(punch, 0.7, 0.9)
	    crack= 1
	    shake= 6
	    instance_create(0, 0, 1582/* obj_vsflowey_shaker */)
	    con= 3
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 4) {
	    caster_play(punch, 0.85, 0.83)
	    crack= 2
	    shake= 8
	    drawthis= 0
	    instance_create(0, 0, 1582/* obj_vsflowey_shaker */)
	    con= 5
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 6) {
	    caster_play(punch, 1, 0.76)
	    crack= 3
	    shake= 10
	    drawthis= 0
	    instance_create(0, 0, 1582/* obj_vsflowey_shaker */)
	    con= 7
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 8) {
	    crack= -1
	    drawthis= -1
	    con= 9
	    i= 0
	    instance_create(0, 0, 1582/* obj_vsflowey_shaker */)
	    fl= instance_create(nowxx + 114, nowyy + 56, 1575/* obj_floweyfacer */)
	    caster_play(explosion, 1, 1)
	    repeat(6)  {
	        in= instance_create(nowxx + 54, nowyy + 49, 1576/* obj_fileerased_part */)
	        in.frame= i
	        i++
	    }
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 10) {
	    fl.type= 1
	    obj_mainchara_fake.cutscene= 1
	    con= 11
	    $Alarm4.start((6) / 30.0)
	}
	if(con == 12) {
	    hellmus= caster_load("music/yourbestfriend_3.ogg")
	    fl.type= 2
	    con= 13
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 13) {
	    obj_mainchara_fake.y+= 6
	    obj_floweyfacer.y-= 2
	}
	if(con == 14) {
	    fl.type= 1
	    con= 15
	    $Alarm4.start((8) / 30.0)
	}
	if(con == 16) {
	    // obj_floweyfacer
	    with(1575) {
	        moved= 2
	        xx= x
	        yy= y
	    }
	    fl.type= 0
	    con= 17
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 18) {
	    caster_loop(hellmus, 0.8, 0.7)
	    GS.msg[0]= "Howdy!/"
	    GS.msg[1]= "It\'s me, FLOWEY./"
	    GS.msg[2]= "\\E2FLOWEY the FLOWER!/"
	    GS.msg[3]= "\\E0I owe you a HUGE thanks./"
	    GS.msg[4]= "\\E9You really did a number&on that old fool./"
	    GS.msg[5]= "\\E0Without you^1, I NEVER could&have gotten past him./"
	    GS.msg[6]= "\\E7But now^1, with YOUR help.../"
	    GS.msg[7]= "\\E8 %"
	    GS.msg[8]= "\\TFHe\'s DEAD./"
	    GS.msg[9]= "\\E6And I\'VE got the human&SOULS!/%%"
	    GS.typer= 9
	    GS.msg[10]= "%%%"
	    mywriter= instance_create(view_xview[0] + 30, view_yview[0] + 100, 1598/* obj_flowey_writer */)
	    con= 19
	}
	if(con == 19 and not is_instance_valid(mywriter)) {
	    laugh= caster_load("music/f_newlaugh.ogg")
	    fl.type= 1
	    con= 20
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 21) {
	    obj_floweyfacer.set= 1
	    fl.type= 2
	    caster_play(laugh, 1, 0.9)
	    con= 22
	    $Alarm4.start((70) / 30.0)
	}
	if(con == 23) {
	    fl.type= 1
	    con= 24
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 25) {
	    fl.type= 0
	    con= 26
	}
	if(con == 26) {
	    GS.msg[0]= "\\E0Boy!/"
	    GS.msg[1]= "\\E0I\'ve been empty for so&long.../"
	    GS.msg[2]= "\\E4It feels great to have a&SOUL inside me again./"
	    GS.msg[3]= "\\E1Mmmm^1, I can feel them&wriggling.../"
	    GS.msg[4]= "\\E6Awww^1, you\'re feeling&left out^1, aren\'t you?/"
	    GS.msg[5]= "\\E1Well^1, that\'s just perfect./"
	    GS.msg[6]= "\\E0After all^1, I only have&six souls./"
	    GS.msg[7]= "\\E1I still need one more.../"
	    GS.msg[8]= "\\TFB\\E2efore I become GOD./"
	    GS.msg[9]= "\\E3And then^1, with my&newfound powers.../"
	    GS.msg[10]= "\\E7Monsters./"
	    GS.msg[11]= "\\E5Humans./"
	    GS.msg[12]= "\\E5Everyone^2./"
	    GS.msg[13]= "\\E8I\'ll show them all the REAL&meaning of this world./%%"
	    GS.msg[14]= "%%%"
	    GS.typer= 9
	    mywriter= instance_create(view_xview[0] + 30, view_yview[0] + 100, 1598/* obj_flowey_writer */)
	    con= 27
	}
	if(con == 27) {
	    if(instance_exists(1598/* obj_flowey_writer */)) {
	        if(obj_flowey_writer.stringno == 12) {
	            // obj_floweyfacer
	            with(1575) {
	                if(type == 0) {
	                    frame= 0
	                    sprite_index= 2200/* spr_tv_floweyface_everyone */
	                    type= 3
	                }
	            }
	        }
	        if(obj_flowey_writer.stringno == 13) {
	            // obj_floweyfacer
	            with(1575) {
	                if(type == 3) {
	                    image_speed= 0
	                    frame= 0
	                    type= 0
	                }
	            }
	        }
	    }
	    if(not instance_exists(1598/* obj_flowey_writer */)) {
	        con= 28
	        fl.type= 1
	        $Alarm4.start((20) / 30.0)
	    }
	}
	if(con == 29) {
	    GS.faceemotion= 0
	    fl.type= 2
	    fl.set= 2
	    caster_play(laugh, 1, 0.8)
	    con= 30
	    $Alarm4.start((70) / 30.0)
	}
	if(con == 31) {
	    fl.type= 1
	    con= 32
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 33) {
	    fl.type= 0
	    con= 34
	}
	if(con == 34) {
	    GS.msg[0]= "\\E0Oh^1, and forget about escaping&to your old SAVE FILE./"
	    GS.msg[1]= "\\TFI\\E2t\'s gone FOREVER./"
	    if(not file_exists("file0")) {
	        GS.msg[0]= "\\E0Golly^1, if only you&had a SAVE FILE you&could run away to.../"
	        GS.msg[1]= "\\TFB\\E2ut you were just&too STUPID to make one!/"
	    }
	    GS.msg[2]= "\\TfB\\E3ut don\'t worry./"
	    GS.msg[3]= "\\E0Your old friend FLOWEY.../"
	    GS.msg[4]= "\\E1Has worked out a replacement&for you!/"
	    GS.msg[5]= "\\TFI\\E6\'ll SAVE over your own&death./"
	    GS.msg[6]= "\\E7So you can watch me tear&you to bloody pieces.../"
	    GS.msg[7]= "\\E8Over^1, and over^1, and over.../%%"
	    GS.msg[14]= "%%%"
	    GS.typer= 9
	    mywriter= instance_create(view_xview[0] + 30, view_yview[0] + 100, 1598/* obj_flowey_writer */)
	    con= 35
	}
	if(con == 35 and not instance_exists(1598/* obj_flowey_writer */)) {
	    obj_mainchara_fake.velocity.y= -2
	    obj_mainchara_fake.image_speed= 0.334
	    obj_mainchara_fake.moving= 1
	    con= 36
	    $Alarm4.start((6) / 30.0)
	}
	if(con == 37) {
	    obj_mainchara_fake.velocity.y= 0
	    obj_mainchara_fake.image_speed= 0
	    obj_mainchara_fake.moving= 0
	    con= 38
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 39) {
	    GS.msg[0]= "\\E9... what?/"
	    GS.msg[1]= "Do you really think&you can stop ME?/"
	    GS.msg[2]= "\\TfH\\E4ee hee hee.../%%"
	    GS.msg[14]= "%%%"
	    GS.typer= 16
	    mywriter= instance_create(view_xview[0] + 30, view_yview[0] + 100, 1598/* obj_flowey_writer */)
	    con= 40
	}
	if(con == 40 and not instance_exists(1598/* obj_flowey_writer */)) {
	    GS.faceemotion= 5
	    GS.msg[0]= "\\E5You really ARE an idiot^4.%%"
	    GS.msg[14]= "%%%"
	    caster_free(-3)
	    GS.typer= 78
	    mywriter= instance_create(view_xview[0] + 30, view_yview[0] + 100, 1598/* obj_flowey_writer */)
	    con= 41
	}
	if(con == 41 and not instance_exists(1598/* obj_flowey_writer */)) {
	    // obj_floweyfacer
	    with(1575) instance_destroy()
	    instance_create(0, 0, 1574/* obj_floweybattler2 */)
	    con= 42
	}
	if(crack == 1) draw_sprite(2262/* spr_fileerased_crack */, 0, 54 + xx, 49 + yy)
	if(crack == 2 or crack == 3) {
	    draw_sprite(2261/* spr_fileerased */, 0, 54 + xx, 49 + yy)
	    draw_sprite(2262/* spr_fileerased_crack */, crack - 1, 54 + xx, 49 + yy)
	}
	if(shake >= 0) {
	    xx= nowxx + shake * choose(1, -1)
	    yy= nowyy + shake * choose(1, -1)
	    shake--
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
