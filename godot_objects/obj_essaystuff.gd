# Auto-converted from GameMaker: obj_essaystuff
extends Node2D

func _ready():
	mystring= " "
	$Alarm0.start((450) / 30.0)
	con= 0
	cantype= 1
	// obj_mettattackgen
	with(414) instance_destroy()
	draw_on= 1
	dotimer= 0
	GS.border= 0
	endbuffer= 180
	if(file_exists("undertale.ini")) {
	    ini_open("undertale.ini")
	    essaynum= ini_read_real("MTT", "EssayNo", 0)
	    ini_close()
	}
	if(essaynum == 1) endbuffer= 150
	if(essaynum == 2) endbuffer= 120
	if(essaynum >= 3) endbuffer= 100

func _on_destroy():
	cantype= 0
	con= 1

func _on_outside_room():
	draw_set_color(16777215)
	draw_set_font(1)
	draw_text_ext(GS.idealborder[0] + 25, GS.idealborder[2] + 15, mystring, 25, 450)
	if(cantype == 1)
	    draw_text(430, 50, "ESSAY PROMPT:#Why do you#love most about#Mettaton?#(No X or Z)")
	else  draw_text(430, 200, "TIME UP!!!")
	dotimer++
	if(dotimer > 4) {
	    if(draw_on == 0) draw_on= 1
	    else  draw_on= 0
	    dotimer= 0
	}
	if(draw_on == 1 and string_length(mystring) < 3)
	    draw_text(obj_heart.x - 30, obj_heart.y + 20, "[START TYPING]")
	if(cantype == 1 and Input.is_key_pressed(1)) {
	    exc= 0
	    if(Input.is_action_pressed("move_right")) exc= 1
	    if(Input.is_action_pressed("move_left")) exc= 1
	    if(Input.is_action_pressed("move_up")) exc= 1
	    if(Input.is_action_pressed("move_down")) exc= 1
	    if(Input.is_key_pressed(8)) exc= 1
	    if(Input.is_key_pressed(16)) exc= 1
	    if(Input.is_action_pressed("ui_accept")) exc= 1
	    if(Input.is_action_pressed("ui_cancel")) exc= 1
	    if(exc == 0) {
	        if(endbuffer < 30) endbuffer= 30
	        mystring+= keyboard_lastchar
	    }
	    if(Input.is_action_pressed("ui_confirm") and not Input.is_action_pressed("ui_accept"))
	        mystring+= "z"
	    if(Input.is_action_pressed("ui_cancel") and not Input.is_key_pressed(16))
	        mystring+= "x"
	}
	endbuffer--
	if(endbuffer < 0 and alarm[0] > 10) $Alarm0.start((10) / 30.0)
	if(Input.is_key_pressed(8) and cantype == 1 and string_length(mystring) > 1) {
	    stl= string_length(mystring)
	    mystring= string_delete(mystring, stl, 1)
	}
	GS.msg[0]= ""
	if(con == 1) {
	    leng= string_length(mystring)
	    if(string_length(mystring) == 1)
	        GS.msg[0]= "Speechless...?&Who can blame you?/%%"
	    if(string_length(mystring) == 2)
	        GS.msg[0]= "Well... that\'s concise./%%"
	    if(string_length(mystring) > 2)
	        GS.msg[0]= "Beautiful. Sometimes&the fewest words&speak the loudest./%%"
	    if(string_length(mystring) > 13)
	        GS.msg[0]= "Nice. You get a&gold star./%%"
	    if(string_length(mystring) > 50)
	        GS.msg[0]= "Oh my... what a&great answer./%%"
	    if(string_length(mystring) > 90) {
	        GS.msg[0]= "Oooooh, you said so&much about me.../"
	        GS.msg[1]= "I love how&passionate you are./"
	        GS.msg[2]= "... even though I&don\'t understand&what you said.../%%"
	    }
	    if(string_length(mystring) > 140)
	        GS.msg[0]= "Beautiful.&Why don\'t you&write a book?/%%"
	    spec= 0
	    swear= 0
	    nice= 0
	    beaut= 0
	    mystring_l= string_lower(mystring)
	    if(string_pos("beaut", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("hot", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("sexy", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("pretty", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("handsome", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("gorgeous", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("sparkl", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("charm", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("attract", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("cute", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("smokin", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("elegant", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("good look", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("goodlook", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("good-look", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("grace", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("comely", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("fine", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("foxy", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("looker", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("dreamboat", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("stun", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("shapely", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("ravishing", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("allur", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("entic", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("seduct", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("enchant", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("appeal", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("tantaliz", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("adorable", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("radiant", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("capitvat", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	    }
	    if(string_pos("leg", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	        spec= 1
	    }
	    if(string_pos("arm", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	        spec= 2
	    }
	    if(string_pos("hair", mystring_l) > 0) {
	        beaut+= 2
	        nice++
	        spec= 3
	    }
	    if(beaut > 1)
	        GS.msg[0]= "Nice detail...&You\'re right, I do&look quite nice./%%"
	    if(beaut > 3)
	        GS.msg[0]= "Wonderful! Amazing! A+...&I AM completely stunning./%%"
	    if(beaut > 5)
	        GS.msg[0]= "Oh, I\'m blushing...&You\'re completely right,&I am beautiful in&every way./%%"
	    if(beaut > 7)
	        GS.msg[0]= "Oh my... I\'m speechless...&You\'ve completely&captured how&beautiful I am./%%"
	    if(spec == 1)
	        GS.msg[0]= "That\'s right.&Legs was the&correct answer!/%%"
	    if(spec == 2)
	        GS.msg[0]= "How creative. Arms...&most people just&think about my legs./%%"
	    if(spec == 3)
	        GS.msg[0]= "My hair... yes,&I use metal hair&gel./%%"
	    if(string_pos("personality", mystring_l) > 0) spec= 3.1
	    if(string_pos("voice", mystring_l) > 0) spec= 3.2
	    if(string_pos("dancing", mystring_l) > 0) spec= 3.3
	    if(string_pos("dance", mystring_l) > 0) spec= 3.3
	    if(spec == 3.1)
	        GS.msg[0]= "Yes^1, my personality&is quite charming^1,&isn\'t it?/%%"
	    if(spec == 3.2) {
	        GS.msg[0]= "They say I have&the voice of a&Siren..^1./"
	        GS.msg[1]= "... awooga!/%%"
	    }
	    if(spec == 3.3)
	        GS.msg[0]= "Dancing...^1?&Thank you^1, I\'m&self-taught./%%"
	    if(string_pos("ugly", mystring_l) > 0) spec= 4
	    if(string_pos("hideous", mystring_l) > 0) spec= 4
	    if(string_pos("repulsive", mystring_l) > 0) spec= 4
	    if(string_pos("unattractive", mystring_l) > 0) spec= 4
	    if(string_pos("look bad", mystring_l) > 0) spec= 4
	    if(string_pos("stupid", mystring_l) > 0) spec= 4
	    if(string_pos("idiot", mystring_l) > 0) spec= 4
	    if(string_pos("jerk", mystring_l) > 0) spec= 4
	    if(string_pos("asshole", mystring_l) > 0) spec= 4
	    if(string_pos("loser", mystring_l) > 0) spec= 4
	    if(string_pos("dumbass", mystring_l) > 0) spec= 4
	    if(string_pos("douche", mystring_l) > 0) spec= 4
	    if(string_pos("creep", mystring_l) > 0) spec= 4
	    if(spec == 4)
	        GS.msg[0]= "Huh? This essay is&supposed to be about&me, not about you.../%%"
	    if(string_pos("i love you", mystring_l) > 0) spec= 5
	    if(string_pos("i love your", mystring_l) > 0) spec= 0
	    if(spec == 5)
	        GS.msg[0]= "What a touching&confession! I\'ll add&it to the pile./%%"
	    if(string_pos("toby", mystring_l) > 0) spec= 6
	    if(spec == 6)
	        GS.msg[0]= "Toby? What the hell&is that?&Sounds... sexy./%%"
	    if(string_pos("fuck", mystring_l) > 0) swear= 1
	    if(string_pos("shit", mystring_l) > 0) swear= 1
	    if(string_pos("cock", mystring_l) > 0) swear= 1
	    if(string_pos("pussy", mystring_l) > 0) swear= 1
	    if(string_pos("penis", mystring_l) > 0) swear= 1
	    if(string_pos("vagina", mystring_l) > 0) swear= 1
	    if(string_pos("anus", mystring_l) > 0) swear= 1
	    if(string_pos("poop", mystring_l) > 0) swear= 1
	    if(string_pos("tity", mystring_l) > 0) swear= 1
	    if(string_pos("titty", mystring_l) > 0) swear= 1
	    if(string_pos("bepis", mystring_l) > 0) swear= 1
	    if(swear == 1) {
	        GS.msg[0]= "Oh my! This is a family&friendly TV show./"
	        GS.msg[1]= "Now stand still while&I murder you./%%"
	    }
	    done= 0
	    if(swear == 1 and done == 0) {
	        done= 1
	        // obj_ratingsmaster
	        with(402) {
	            curtype= 12
	            essay= -150
	            event_user(0)
	        }
	    }
	    if(spec == 6 and done == 0) {
	        done= 1
	        // obj_ratingsmaster
	        with(402) {
	            curtype= 12
	            essay= 300
	            event_user(0)
	        }
	    }
	    if(spec == 5 and done == 0) {
	        done= 1
	        // obj_ratingsmaster
	        with(402) {
	            curtype= 12
	            essay= 250
	            event_user(0)
	        }
	    }
	    if(spec == 4 and done == 0) {
	        done= 1
	        // obj_ratingsmaster
	        with(402) {
	            curtype= 12
	            essay= -200
	            event_user(0)
	        }
	    }
	    if(spec == 1 and done == 0) {
	        done= 1
	        // obj_ratingsmaster
	        with(402) {
	            curtype= 12
	            essay= 350
	            event_user(0)
	        }
	    }
	    if((spec == 2 or spec == 3) and done == 0) {
	        done= 1
	        // obj_ratingsmaster
	        with(402) {
	            curtype= 12
	            essay= 250
	            event_user(0)
	        }
	    }
	    if(spec > 3 and spec < 4 and done == 0) {
	        done= 1
	        // obj_ratingsmaster
	        with(402) {
	            curtype= 12
	            essay= 250
	            event_user(0)
	        }
	    }
	    if(done == 0 and beaut > 0) {
	        if(beaut >= 7 and done == 0) {
	            done= 1
	            // obj_ratingsmaster
	            with(402) {
	                curtype= 12
	                essay= 360
	                event_user(0)
	            }
	        }
	        if(beaut >= 5 and done == 0) {
	            done= 1
	            // obj_ratingsmaster
	            with(402) {
	                curtype= 12
	                essay= 280
	                event_user(0)
	            }
	        }
	        if(beaut >= 3 and done == 0) {
	            done= 1
	            // obj_ratingsmaster
	            with(402) {
	                curtype= 12
	                essay= 250
	                event_user(0)
	            }
	        }
	        if(beaut >= 1 and done == 0) {
	            done= 1
	            // obj_ratingsmaster
	            with(402) {
	                curtype= 12
	                essay= 200
	                event_user(0)
	            }
	        }
	    }
	    if(done == 0) {
	        if(leng >= 140 and done == 0) {
	            done= 1
	            // obj_ratingsmaster
	            with(402) {
	                curtype= 12
	                essay= 180
	                event_user(0)
	            }
	        }
	        if(leng >= 90 and done == 0) {
	            done= 1
	            // obj_ratingsmaster
	            with(402) {
	                curtype= 12
	                essay= 150
	                event_user(0)
	            }
	        }
	        if(leng >= 50 and done == 0) {
	            done= 1
	            // obj_ratingsmaster
	            with(402) {
	                curtype= 12
	                essay= 120
	                event_user(0)
	            }
	        }
	        if(leng >= 13 and done == 0) {
	            done= 1
	            // obj_ratingsmaster
	            with(402) {
	                curtype= 12
	                essay= 100
	                event_user(0)
	            }
	        }
	        if(leng <= 12 and done == 0) {
	            done= 1
	            // obj_ratingsmaster
	            with(402) {
	                curtype= 12
	                essay= 80
	                event_user(0)
	            }
	        }
	    }
	    ini_open("undertale.ini")
	    essaynum= ini_read_real("MTT", "EssayNo", 0)
	    ini_write_real("MTT", "EssayNo", essaynum + 1)
	    ini_close()
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    con= 4
	    GS.typer= 51
	    GS.msc= 0
	    blcon= instance_create(obj_mettatonex.x + 200, obj_mettatonex.y, 187/* obj_blconwdflowey */)
	    blconwd= instance_create(blcon.x + 20, blcon.y - 10, 784/* OBJ_NOMSCWRITER */)
	}
	if(con == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_mettatonex.attacked= 0
	    with(blcon) instance_destroy()
	    GS.msg[0]= "* Mettaton is saving your&  essay for future use."
	    GS.mnfight= 3
	    GS.myfight= -1
	    GS.turntimer= -1
	    instance_destroy()
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
