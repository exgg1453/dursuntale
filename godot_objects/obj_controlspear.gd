# Auto-converted from GameMaker: obj_controlspear
extends Node2D

func _ready():
	rotation_degrees= 140
	dirdir= 0
	active= 1
	part= 0
	undyne= obj_undynedate_inside.undyne
	hotchocolate= obj_undynedate_inside.hotchocolate
	teabox= obj_undynedate_inside.teabox
	sugar= obj_undynedate_inside.sugar
	soda= obj_undynedate_inside.soda
	sel_undyne= 0
	sel_hotchocolate= 0
	sel_teabox= 0
	sel_sugar= 0
	sel_soda= 0
	everselect= 0
	buffer= 0

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, 1, 1, rotation_degrees, 16777215, 1)
	if(active == 1) {
	    draw_set_color(16777215)
	    draw_rectangle(view_xview[view_current] + 16, view_yview[view_current] + 180, view_xview[view_current] + 304, view_yview[view_current] + 235, 0)
	    draw_set_color(0)
	    draw_rectangle(view_xview[view_current] + 19, view_yview[view_current] + 183, view_xview[view_current] + 301, view_yview[view_current] + 232, 0)
	    draw_set_color(16777215)
	    draw_set_font(2)
	    buffer= -1
	    if(everselect == 0)
	        mytext= "* Aim with arrows and select with [Z]."
	    if(everselect != 0) mytext= " "
	    if(everselect > 1) everselect--
	    if(active == 1) {
	        if(Input.is_action_pressed("move_left") and rotation_degrees < 170)
	            rotation_degrees+= 1.5
	        if(Input.is_action_pressed("move_right") and rotation_degrees > 10)
	            rotation_degrees-= 1.5
	    }
	    select= 0
	    draw_set_color(255)
	    getdir= rotation_degrees
	    xdir= lengthdir_x(300, getdir)
	    ydir= lengthdir_y(300, getdir)
	    col= -4
	    col2= collision_line(x, y, x + xdir, y + ydir, undyne, 0, 1)
	    if(collision_line(x, y, x + xdir, y + ydir, teabox, 0, 1)) {
	        if(everselect < 2 and not snd_isplaying(114/* snd_squeak */))
	            snd_play(114/* snd_squeak */)
	        everselect= 3
	        select= teabox
	        mytext= "* Teabox - Blatantly correct choice.#* Select with [Z]."
	    }
	    if(collision_line(x, y, x + xdir, y + ydir, hotchocolate, 0, 1)) {
	        if(everselect < 2 and not snd_isplaying(114/* snd_squeak */))
	            snd_play(114/* snd_squeak */)
	        everselect= 3
	        select= hotchocolate
	        mytext= "* Hot Chocolate - Green cylinder.#* Select with [Z]."
	    }
	    if(collision_line(x, y, x + xdir, y + ydir, soda, 0, 1)) {
	        if(everselect < 2 and not snd_isplaying(114/* snd_squeak */))
	            snd_play(114/* snd_squeak */)
	        everselect= 3
	        select= soda
	        mytext= "* Soda - Sickly yellow liquid.#* Select with [Z]."
	    }
	    if(collision_line(x, y, x + xdir, y + ydir, sugar, 0, 1)) {
	        if(everselect < 2 and not snd_isplaying(114/* snd_squeak */))
	            snd_play(114/* snd_squeak */)
	        everselect= 3
	        select= sugar
	        mytext= "* Sugar - Goes in tea.#* Select with [Z]."
	    }
	    if(col2 == undyne) {
	        if(everselect < 2 and not snd_isplaying(114/* snd_squeak */))
	            snd_play(114/* snd_squeak */)
	        everselect= 3
	        select= undyne
	        mytext= "* Undyne.#* Select with [Z]."
	    }
	    if(rotation_degrees >= 53 and rotation_degrees <= 66) {
	        if(everselect < 2 and not snd_isplaying(114/* snd_squeak */))
	            snd_play(114/* snd_squeak */)
	        select= 9
	        everselect= 3
	        mytext= "* Fridge - Full of food.#* Select with [Z]."
	    }
	    if(rotation_degrees >= 17 and rotation_degrees <= 41) {
	        if(everselect < 2 and not snd_isplaying(114/* snd_squeak */))
	            snd_play(114/* snd_squeak */)
	        select= 10
	        everselect= 3
	        mytext= "* Sword - Acquired taste.#* Select with [Z]."
	    }
	    if(keyboard_multicheck_pressed(0/* NOKEY */) and active == 1 and buffer < 1 and select != 0) {
	        GS.facechoice= 5
	        GS.msc= 0
	        GS.faceemotion= 0
	        active= 2
	        if(select == undyne) {
	            GS.faceemotion= 1
	            GS.msg[0]= "\\E1* ... are you.../"
	            GS.msg[1]= "\\E5* Hitting on me????/%%"
	            if(sel_undyne > 0) {
	                GS.faceemotion= 5
	                GS.msg[0]= "* ????????????????/%%"
	            }
	            sel_undyne++
	        }
	        if(select == sugar) {
	            GS.faceemotion= 9
	            GS.msc= 708
	            if(sel_sugar > 0) {
	                GS.msc= 0
	                GS.msg[0]= "* The sugar is for&  tea^1, mmm\'kay?/%%"
	            }
	            sel_sugar++
	        }
	        if(select == soda) {
	            GS.faceemotion= 9
	            GS.msg[0]= "* Oh^1, soda?/"
	            GS.msg[1]= "\\E4* Actually^1, even though&  you pointed to it^1,&  you don\'t look happy./"
	            GS.msg[2]= "\\E0* Heh^1, that\'s fine^1!&* I think soda\'s gross^1,&  too!/"
	            GS.msg[3]= "\\E4* It rots your teeth..^1.&* It rots your mind.../"
	            GS.msg[4]= "\\E1* IT ROTS YOUR FIGHTING&  SPIRIT!/"
	            GS.msg[5]= "\\E9* ... huh^1?&* Why do I have it?/"
	            GS.msg[6]= "\\E8* .../%%"
	            if(sel_soda > 0)
	                GS.msg[0]= "* What^1?&* You wanna throw the&  spear at it?/%%"
	            sel_soda++
	        }
	        if(select == hotchocolate) {
	            GS.faceemotion= 9
	            GS.msg[0]= "* Oh^1, you want some&  hot chocolate?/"
	            GS.msg[1]= "\\E1* Wait^1, wait^1, I just&  remembered..^1.&* That container\'s empty./"
	            GS.msg[2]= "\\E9* I stopped getting&  it because it was&  always a hassle.../"
	            GS.msg[3]= "\\E6* ASGORE kept getting&  marshmallows stuck in&  his beard./%%"
	            if(sel_hotchocolate > 0)
	                GS.msg[0]= "* That container\'s empty./%%"
	            sel_hotchocolate++
	        }
	        if(select == teabox) {
	            GS.faceemotion= 9
	            GS.msg[0]= "\\E9* ... tea^1, huh^1?&* Coming right up!/%%"
	            obj_undynedate_inside.con= 300
	            active= 3
	        }
	        if(select == 9) {
	            GS.faceemotion= 2
	            GS.msg[0]= "* The fridge!^1?&* You want to have&  the entire fridge!?/"
	            GS.msg[1]= "\\E1* No!/%%"
	        }
	        if(select == 10) {
	            GS.faceemotion= 3
	            GS.msg[0]= "* Believe me^1, I would&  GLADLY give you your&  fill of swords./"
	            GS.msg[1]= "\\E9* If you weren\'t my&  beloved houseguest!/%%"
	        }
	        gh= instance_create(0, 0, 779/* obj_dialoguer */)
	        if(select != sugar) gh.side= 1
	    }
	    draw_set_color(16777215)
	    draw_text(24, 186, mytext)
	}
	if(active == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    active= 1
	    buffer= 12
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
