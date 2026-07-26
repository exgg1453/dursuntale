# Auto-converted from GameMaker: obj_labtv_event
# GM parent: obj_interactable
extends Node2D

func _ready():
	con= 0
	myinteract= 0
	talkedto= 0
	heartx= 0
	hearty= 0
	nextcon= 0
	alph= 0
	scale.x= 2

func _gm_event_2_4():
	con++

func _on_outside_room():
	if(myinteract == 1 and GS.interact == 0 and con == 0) {
	    GS.interact= 1
	    con= 1
	}
	if(con == 1) {
	    GS.facechoice= 0
	    GS.typer= 5
	    GS.msc= 0
	    GS.msg[0]= "* (There\'s a VHS player with a&  few tapes picked out beside&  it...)/"
	    GS.msg[1]= "* (They seem to be labelled&  in a specific order.)/"
	    GS.msg[2]= "* (Will you watch one...?)/%%"
	    if(talkedto == 1) GS.msg[0]= "* (Choose a tape to watch.)/%%"
	    talkedto= 1
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 2
	    buffer= 5
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    buffer--
	    draw_set_color(16777215)
	    draw_rectangle(view_xview[view_current] + 16, view_yview[view_current] + 5, view_xview[view_current] + 304, view_yview[view_current] + 80, 0)
	    draw_set_color(0)
	    draw_rectangle(view_xview[view_current] + 19, view_yview[view_current] + 8, view_xview[view_current] + 301, view_yview[view_current] + 77, 0)
	    draw_set_color(16777215)
	    draw_set_font(2)
	    draw_text(view_xview[0] + 50, view_yview[0] + 15, "Cancel")
	    draw_text(view_xview[0] + 160, view_yview[0] + 15, "Tape 1")
	    draw_text(view_xview[0] + 50, view_yview[0] + 35, "Tape 2")
	    draw_text(view_xview[0] + 160, view_yview[0] + 35, "Tape 3")
	    draw_text(view_xview[0] + 50, view_yview[0] + 55, "Tape 4")
	    draw_text(view_xview[0] + 160, view_yview[0] + 55, "Tape 5")
	    draw_sprite(49/* spr_heartsmall */, 0, view_xview[0] + 30 + heartx * 110, view_yview[0] + 20 + 20 * hearty)
	    if(buffer < 0) {
	        if(Input.is_action_pressed("move_up") and hearty > 0)
	            hearty--
	        if(Input.is_action_pressed("move_down") and hearty < 2) {
	            if(heartx == 0) {
	                if(hearty == 1) hearty++
	                if(hearty == 0) hearty++
	            }
	            if(heartx == 1) {
	                if(hearty == 1) hearty++
	                if(hearty == 0) hearty++
	            }
	        }
	        if(Input.is_action_pressed("move_right") and heartx == 0) {
	            if(hearty == 0) heartx++
	            if(hearty == 1) heartx++
	            if(hearty == 2) heartx++
	        }
	        if(Input.is_action_pressed("move_left") and heartx == 1) {
	            if(hearty == 0) heartx--
	            if(hearty == 1) heartx--
	            if(hearty == 2) heartx--
	        }
	        if(keyboard_multicheck_pressed(0/* NOKEY */)) {
	            con= 100
	            if(heartx == 0 and hearty == 0) con= 100
	            if(heartx == 1 and hearty == 0) {
	                con= 10
	                nextcon= 20
	            }
	            if(heartx == 0 and hearty == 1) {
	                con= 10
	                nextcon= 30
	            }
	            if(heartx == 1 and hearty == 1) {
	                con= 10
	                nextcon= 40
	            }
	            if(heartx == 0 and hearty == 2) {
	                con= 10
	                nextcon= 50
	            }
	            if(heartx == 1 and hearty == 2) {
	                con= 10
	                nextcon= 60
	            }
	        }
	    }
	}
	if(con == 10) {
	    ivol= caster_get_volume(GS.currentsong)
	    vol= ivol
	    alph= 0
	    snd_play(108/* snd_item */)
	    con= 11
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 12) {
	    con= 13
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 13) {
	    if(vol > 0) vol-= 0.04
	    else  vol= 0
	    caster_set_volume(GS.currentsong, vol)
	    alph+= 0.04
	    if(alph > 1) alph= 1
	}
	if(con == 14) {
	    caster_pause(GS.currentsong)
	    con= nextcon
	}
	if(con == 20) {
	    hh= caster_load("music/house2.ogg")
	    caster_loop(hh, 0.7, 0.8)
	    con= 21
	}
	if(con == 21) {
	    GS.msc= 0
	    GS.typer= 4
	    GS.faceemotion= 0
	    GS.facechoice= 0
	    GS.msg[0]= "* Psssst^1.&* Gorey^1, wake up. \\Ta/"
	    GS.msg[1]= "* Mmm^1?&* What is it^1, dear?/"
	    GS.msg[2]= "* ... err^1, and why do you&  have that video camera? \\TT/"
	    GS.msg[3]= "* Shush^1!&* I want to get your&  reaction./"
	    GS.msg[4]= "* Gorey^1, dearest^1.&* What is my favorite&  vegetable?\\Ta/"
	    GS.msg[5]= "* Hmmm..^1.&* Carrots^1, right?\\TT/"
	    GS.msg[6]= "* No no no^1!&* My FAVORITE vegetable is.../"
	    GS.msg[7]= "* Eda-MOM-e./"
	    GS.msg[8]= "* ... get it???\\Ta/"
	    GS.msg[9]= "* .../"
	    GS.msg[10]= "* Go back to bed^1, dear.\\TT/"
	    GS.msg[11]= "* No no!^1!&* Not yet^1!&* Hee hee hee./"
	    GS.msg[12]= "* Now^1, If I were a dog^1,&  what breed of dog would&  I be?\\Ta/"
	    GS.msg[13]= "* Hmmm..^1. I don\'t know^1, honey^1.&* What kind of dog would&  you be?\\TT/"
	    GS.msg[14]= "* I would be.../"
	    GS.msg[15]= "* A MOMERANIAN.\\Ta/"
	    GS.msg[16]= "* Hohoho!/"
	    GS.msg[17]= "* You sure are excited to&  have this child./"
	    GS.msg[18]= "* You know^1, if you keep&  making jokes like&  this.../"
	    GS.msg[19]= "* One day^1, you could be.../"
	    GS.msg[20]= "* ... a famous MOMedian.\\TT/"
	    GS.msg[21]= "* .../"
	    GS.msg[22]= "* Well^1, I am going to bed.\\Ta/"
	    GS.msg[23]= "* Hey^1!&* Come on^1, Tori^1!&* That one was funny!\\TT/"
	    GS.msg[24]= "* Hahaha^1, I know^1.&* I am just teasing you./"
	    GS.msg[25]= "* Goodnight^1, dear.\\Ta/"
	    GS.msg[26]= "* Goodnight, honey.\\TT/"
	    GS.msg[27]= "* .../"
	    GS.msg[28]= "* Oh dear^1, perhaps it is too&  dark in here for the&  video to come out.../%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    hhvol= 0.7
	    con= 22
	}
	if(con == 22 and not instance_exists(782/* OBJ_WRITER */)) {
	    hhvol-= 0.04
	    caster_set_volume(hh, hhvol)
	    if(hhvol <= 0) {
	        caster_free(hh)
	        con= 90
	    }
	}
	if(con == 30) {
	    hh= caster_load("music/birdnoise.ogg")
	    caster_loop(hh, 0.9, 0.8)
	    con= 31
	}
	if(con == 31) {
	    GS.msc= 0
	    GS.typer= 76
	    GS.faceemotion= 0
	    GS.facechoice= 0
	    GS.msg[0]= "* Okay^1, " + GS.charname + "^1, are you ready?/"
	    GS.msg[1]= "* Do your creepy face!/"
	    GS.msg[2]= "* AHHHHH!^1!&* Hee hee hee!/"
	    GS.msg[3]= "* Oh^1!&* Wait^1!&* I had the lens cap on.../"
	    GS.msg[4]= "* What!^1?&* You\'re not gonna do it&  again...?/"
	    GS.msg[5]= "* Come on^1, quit tricking me^1!&* Haha!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    hhvol= 0.7
	    con= 32
	}
	if(con == 32 and not instance_exists(782/* OBJ_WRITER */)) {
	    hhvol-= 0.04
	    caster_set_volume(hh, hhvol)
	    if(hhvol <= 0) {
	        caster_free(hh)
	        con= 90
	    }
	}
	if(con == 40) {
	    hh= caster_load("music/birdnoise.ogg")
	    caster_loop(hh, 0.9, 0.9)
	    con= 41
	}
	if(con == 41) {
	    GS.msc= 0
	    GS.typer= 76
	    GS.faceemotion= 0
	    GS.facechoice= 0
	    GS.msg[0]= "* Howdy^1, " + GS.charname + "^1!&* Smile for the camera!/"
	    GS.msg[1]= "* Ha^1, this time I got YOU^1!&* I left the cap on..^1.&* ON PURPOSE!/"
	    GS.msg[2]= "* Now you\'re smiling for&  noooo reason^1!&* Hee hee hee!/"
	    GS.msg[3]= "* What^1?&* Oh^1, yeah^1, I remember./"
	    GS.msg[4]= "* When we tried to make&  butterscotch pie for Dad^1,&  right?/"
	    GS.msg[5]= "* The recipe asked for cups&  of butter.../"
	    GS.msg[6]= "* But we accidentally put&  in buttercups instead./"
	    GS.msg[7]= "* Yeah^1!&* Those flowers got him&  really sick./"
	    GS.msg[8]= "* I felt so bad^1.&* We made Mom really upset./"
	    GS.msg[9]= "* I should have laughed it&  off^1, like you did.../"
	    GS.msg[10]= "* Um^1, anyway^1, where are you&  going with this?/"
	    GS.msg[11]= "* Huh^1?&* Turn off the camera...^1?&* OK./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    hhvol= 0.7
	    con= 42
	}
	if(con == 42 and not instance_exists(782/* OBJ_WRITER */)) {
	    hhvol-= 0.04
	    caster_set_volume(hh, hhvol)
	    if(hhvol <= 0) {
	        caster_free(hh)
	        con= 90
	    }
	}
	if(con == 50) {
	    hh= caster_load("music/birdnoise.ogg")
	    caster_loop(hh, 0.9, 1)
	    con= 51
	}
	if(con == 51) {
	    GS.msc= 0
	    GS.typer= 76
	    GS.faceemotion= 0
	    GS.facechoice= 0
	    GS.msg[0]= "* I..^1. I don\'t like this idea^1,&  " + GS.charname + "./"
	    GS.msg[1]= "* Wh.^1. what^1?&* N-no, I\'m not.../"
	    GS.msg[2]= "* ... big kids don\'t cry./"
	    GS.msg[3]= "* Yeah^1, you\'re right./"
	    GS.msg[4]= "* No^1!&* I\'d never doubt you^1, " + GS.charname + "..^1.&* Never!/"
	    GS.msg[5]= "* Y..^1. yeah^1!&* We\'ll be strong^1!&* We\'ll free everyone./"
	    GS.msg[6]= "* I\'ll go get the flowers./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    hhvol= 0.7
	    con= 52
	}
	if(con == 52 and not instance_exists(782/* OBJ_WRITER */)) {
	    hhvol-= 0.04
	    caster_set_volume(hh, hhvol)
	    if(hhvol <= 0) {
	        caster_free(hh)
	        con= 90
	    }
	}
	if(con == 60) {
	    hh= caster_load("music/oogloop.ogg")
	    caster_loop(hh, 0.7, 0.6)
	    con= 61
	}
	if(con == 61) {
	    GS.msc= 0
	    GS.typer= 4
	    GS.faceemotion= 0
	    GS.facechoice= 0
	    GS.msg[0]= "* " + GS.charname + "..^1.&* Can you hear me^1?&* We want you to wake up...\\Ta/"
	    GS.msg[1]= "* " + GS.charname + "^1!&* You have to stay determined!/"
	    GS.msg[2]= "* You can\'t give up..^1.&* You are the future of humans&  and monsters...\\TR/"
	    GS.msg[3]= "* .../"
	    GS.msg[4]= "* Psst... " + GS.charname + "..^1.&* Please..^1. wake up.../"
	    GS.msg[5]= "* I don\'t like this plan&  anymore./"
	    GS.msg[6]= "* I..^1. I.../"
	    GS.msg[7]= "* ..^1. no^1, I said..^1.&* I said I\'d never doubt you./"
	    GS.msg[8]= "* Six^1, right^1?&* We just have to get six.../"
	    GS.msg[9]= "* And we\'ll do it together^1,&  right?/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    hhvol= 0.7
	    con= 62
	}
	if(con == 62 and not instance_exists(782/* OBJ_WRITER */)) {
	    hhvol-= 0.04
	    caster_set_volume(hh, hhvol)
	    if(hhvol <= 0) {
	        caster_free(hh)
	        con= 90
	    }
	}
	if(con == 90) {
	    caster_resume(GS.currentsong)
	    if(vol < ivol) vol+= 0.05
	    else  vol= ivol
	    caster_set_volume(GS.currentsong, vol)
	    alph-= 0.05
	    if(alph < 0) {
	        alph= 0
	        con= 100
	    }
	}
	if(con == 100) {
	    con= 0
	    myinteract= 0
	    GS.interact= 0
	    GS.facing= 0
	}
	if(alph > 0) {
	    draw_set_color(0)
	    draw_set_alpha(alph)
	    draw_rectangle(-10, -10, 999, 999, 0)
	    draw_set_alpha(1)
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
