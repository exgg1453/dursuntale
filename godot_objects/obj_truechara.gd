# Auto-converted from GameMaker: obj_truechara
extends Node2D

func _ready():
	obj_time.canquit= 0
	con= 0
	$Alarm4.start((120) / 30.0)
	bigshake= 0
	scale.x= 2
	scale.y= 2
	x= 320 - sprite_width / 2
	y= 240 - sprite_height / 2
	flashred= 0
	redsiner= 0
	ch_sfx1= caster_load("music/zzz_c.ogg")
	ch_sfx2= caster_load("music/zzz_c2.ogg")
	choicer= 0
	choice= 0
	buffer= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    GS.msc= 0
	    GS.typer= 104
	    GS.msg[0]= "Greetings./"
	    GS.msg[1]= "I^2 am " + GS.charname + "./%%"
	    instance_create(220, 320, 782/* OBJ_WRITER */)
	    con= 2
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_loop(ch_sfx1, 1, 1)
	    con= 3
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 4) {
	    GS.msc= 0
	    GS.typer= 104
	    GS.msg[0]= "Thank you./"
	    GS.msg[1]= "Your power awakened&me from death./"
	    GS.msg[2]= "My " + chr(ord('"')) + "human soul." + chr(ord('"')) + "/"
	    GS.msg[3]= "My " + chr(ord('"')) + "determination." + chr(ord('"')) + "/"
	    GS.msg[4]= "They were not mine^1,&but YOURS./"
	    GS.msg[5]= "At first^1, I&was so confused./"
	    GS.msg[6]= "Our plan had failed^1,&hadn\'t it?/"
	    GS.msg[7]= "Why was I brought&back to life?/"
	    GS.msg[8]= ".../"
	    GS.msg[9]= "You./"
	    GS.msg[10]= "With your guidance./"
	    GS.msg[11]= "I realized the purpose&of my reincarnation./"
	    GS.msg[12]= "Power./"
	    GS.msg[13]= "Together^1, we eradicated&the enemy and became&strong./"
	    GS.msg[14]= "HP. ATK. DEF.&GOLD. EXP. LV./"
	    GS.msg[15]= "Every time a number&increases^1, that&feeling.../"
	    GS.msg[16]= "That\'s me./"
	    GS.msg[17]= "" + chr(ord('"')) + "" + GS.charname + "." + chr(ord('"')) + "/"
	    GS.msg[18]= "Now./"
	    GS.msg[19]= "Now, we have reached&the absolute./"
	    GS.msg[20]= "There is nothing&left for us here./"
	    GS.msg[21]= "Let us erase this&pointless world^1, and&move on to the next./%%"
	    if(file_exists("system_information_963")) {
	        GS.msg[0]= "" + chr(ord('"')) + "" + GS.charname + "." + chr(ord('"')) + "/"
	        GS.msg[1]= "The demon that comes&when people call&its name./"
	        GS.msg[2]= "It doesn\'t matter when./"
	        GS.msg[3]= "It doesn\'t matter where./"
	        GS.msg[4]= "Time after time,&I will appear./"
	        GS.msg[5]= "And, with your help./"
	        GS.msg[6]= "We will eradicate the&enemy and become&strong./"
	        GS.msg[7]= "HP. ATK. DEF.&GOLD. EXP. LV./"
	        GS.msg[8]= "Every time a number&increases^1, that&feeling.../"
	        GS.msg[9]= "That\'s me./"
	        GS.msg[10]= "" + chr(ord('"')) + "" + GS.charname + "." + chr(ord('"')) + "/"
	        GS.msg[11]= ".../"
	        GS.msg[12]= "But./"
	        GS.msg[13]= "You and I are not&the same^1, are we?/"
	        GS.msg[14]= "This SOUL resonates&with a strange&feeling./"
	        GS.msg[15]= "There is a reason&you continue to&recreate this world./"
	        GS.msg[16]= "There is a reason&you continue to&destroy it./"
	        GS.msg[17]= "You./"
	        GS.msg[18]= "You are wracked with&a perverted&sentimentality./"
	        GS.msg[19]= "Hmm./"
	        GS.msg[20]= "I cannot understand&these feelings&any more./"
	        GS.msg[21]= "Despite this./"
	        GS.msg[22]= "I feel obligated to&suggest./"
	        GS.msg[23]= "Should you choose to&create this world&once more./"
	        GS.msg[24]= "Another path would&be better suited./"
	        GS.msg[25]= "Now, partner./"
	        GS.msg[26]= "Let us send this&world back into the&abyss./%%"
	    }
	    instance_create(150, 320, 782/* OBJ_WRITER */)
	    con= 5
	}
	if(con == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 6
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 7) {
	    con= 8
	    choicer= 1
	}
	if(con == 20) {
	    GS.msc= 0
	    GS.typer= 104
	    GS.msg[0]= "Right^1. You are a&great partner./"
	    GS.msg[1]= "We\'ll be together&forever^1, won\'t we?/%%"
	    con= 22
	    instance_create(150, 320, 782/* OBJ_WRITER */)
	}
	if(con == 22 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 1)
	    sprite_index= 654/* spr_truechara_weird */
	if(con == 22 and not instance_exists(782/* OBJ_WRITER */)) con= 60
	if(con == 30) {
	    GS.msc= 0
	    GS.typer= 104
	    GS.msg[0]= "No...?/"
	    GS.msg[1]= "Hmm.../"
	    GS.msg[2]= "How curious./"
	    GS.msg[3]= "You must have&misunderstood./"
	    GS.msg[4]= "SINCE WHEN WERE YOU&THE ONE IN CONTROL?/%%"
	    if(file_exists("system_information_963")) {
	        GS.msg[0]= "No...?/"
	        GS.msg[1]= "Hmm...&This feeling you have./"
	        GS.msg[2]= "This is what I&spoke of./"
	        GS.msg[3]= "Unfortunately,&regarding this.../"
	        GS.msg[4]= "YOU MADE YOUR CHOICE&LONG AGO./%%"
	    }
	    con= 31
	    instance_create(150, 320, 782/* OBJ_WRITER */)
	}
	if(con == 31 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 4)
	    sprite_index= 654/* spr_truechara_weird */
	if(con == 31 and not instance_exists(782/* OBJ_WRITER */)) con= 40
	if(con == 40) {
	    caster_stop(-3)
	    caster_play(ch_sfx2, 1, 0.95)
	    sprite_index= 655/* spr_truechara_laugh */
	    image_speed= 0.5
	    con= 41
	    flashred= 1
	    $Alarm4.start((120) / 30.0)
	    wx= 0
	    wy= 0
	    if(GS.osflavor == 1) {
	        window_set_fullscreen(0)
	        window_set_caption(" ")
	        window_center()
	        wx= window_get_x()
	        wy= window_get_y()
	    }
	}
	if(con == 41) {
	    x= get_viewport_rect().size.x / 2 + random(4) - random(4)
	    y= get_viewport_rect().size.y / 2 + random(4) - random(4)
	    scale.x+= 0.08
	    scale.y+= 0.08
	    if(GS.osflavor == 1)
	        window_set_position(wx + random(redsiner / 4 + 4) - random(redsiner / 4 + 4), wy + random(redsiner / 4 + 4) - random(redsiner / 4 + 4))
	}
	if(con == 42) {
	    con= 60
	    if(GS.osflavor == 1) window_center()
	    flashred= 0
	}
	if(con == 60) {
	    caster_free(-3)
	    snd_play(44/* snd_laz */)
	    image_speed= 0
	    frame= 0
	    sprite_index= 757/* spr_strike */
	    scale.x= 5
	    scale.y= 5
	    y= get_viewport_rect().size.y / 2 - sprite_height / 2
	    x= get_viewport_rect().size.x / 2 - sprite_width / 2
	    image_speed= 0.1
	    con= 61
	}
	if(con == 61 and frame >= 5.5) {
	    visible= 0
	    con= 62
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 63) {
	    snd_play(51/* snd_damage */)
	    instance_create(0, 0, 495/* obj_gameshake */)
	    con= 64
	}

func _on_outside_room():
	if(flashred == 1) {
	    redsiner++
	    draw_set_alpha(abs(sin(redsiner / 2)))
	    draw_set_color(255)
	    draw_rectangle(-20, -20, 999, 999, 0)
	    draw_set_alpha(1)
	}
	draw_sprite_ext(sprite_index, frame, x, y, scale.x, scale.y, 0, 16777215, 1)
	if(choicer == 1) {
	    buffer++
	    draw_set_font(1)
	    draw_set_color(16777215)
	    if(choice == 0) {
	        draw_set_color(65535)
	        draw_sprite(34/* spr_heart */, 0, 75, 357)
	    }
	    draw_text(100, 350, "ERASE")
	    draw_set_color(16777215)
	    if(choice == 1) {
	        draw_set_color(65535)
	        draw_sprite(34/* spr_heart */, 0, 455, 357)
	    }
	    draw_text(480, 350, "DO NOT")
	    if(Input.is_action_pressed("move_right") and choice == 0)
	        choice= 1
	    if(Input.is_action_pressed("move_left") and choice == 1)
	        choice= 0
	    if(keyboard_multicheck_pressed(0/* NOKEY */) and buffer >= 12) {
	        snd_play(111/* snd_select */)
	        choicer= 0
	        caster_stop(-3)
	        if(choice == 0) con= 19
	        if(choice == 1) con= 29
	        $Alarm4.start((30) / 30.0)
	    }
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
