# Auto-converted from GameMaker: obj_flowey_writer
extends Node2D

func _ready():
	script_execute(171/* SCR_TEXTTYPE_f */, GS.typer)
	x= round(x)
	y= round(y)
	doak= 0
	stringno= 0
	stringpos= 1
	lineno= 0
	halt= 0
	writingx= round(writingx)
	writingy= round(writingy)
	myx= writingx
	myy= writingy
	n= 0
	while(GS.msg[n] != "%%%") {
	    mystring[n]= GS.msg[n]
	    n++
	}
	originalstring= mystring[0]
	dfy= 0
	$Alarm0.start((textspeed) / 30.0)

func _on_destroy():
	if(stringpos < string_length(originalstring)) {
	    stringpos++
	    $Alarm0.start((textspeed) / 30.0)
	    if(string_char_at(originalstring, stringpos) == "^" and string_char_at(originalstring, stringpos + 1) != "0") {
	        n= real(string_char_at(originalstring, stringpos + 1))
	        $Alarm0.start((n * 10) / 30.0)
	    }
	    if(string_char_at(originalstring, stringpos) != "" and string_char_at(originalstring, stringpos) != " " and string_char_at(originalstring, stringpos) != "&" and string_char_at(originalstring, stringpos) != "^" and string_char_at(originalstring, stringpos - 1) != "^" and string_char_at(originalstring, stringpos) != "\" + chr(ord('"')) and string_char_at(originalstring, stringpos - 1) != "\" + chr(ord('"')) and string_char_at(originalstring, stringpos) != "/" and string_char_at(originalstring, stringpos) != "%") {
	        snd_stop(txtsound)
	        snd_play(txtsound)
	    }
	    if(string_char_at(originalstring, stringpos) == "&")
	        stringpos++
	    if(string_char_at(originalstring, stringpos) == "\" + chr(ord('"'))+" + ")
	        stringpos+= 2
	}

func _process_begin(delta: float):
	myletter= string_char_at(originalstring, stringpos)
	if(shake > 38) {
	    speed= 2
	    direction+= 20
	}
	if(shake == 42) {
	    speed= 4
	    direction-= 19
	}
	if(halt == 3 or dfy == 1) instance_destroy()

func _process(delta: float):
	if(keyboard_multicheck_pressed(0/* NOKEY */) == 1) event_user(0)

func _gm_event_7_10():
	if(halt == 1) {
	    myletter= " "
	    stringpos= 1
	    stringno++
	    originalstring= mystring[stringno]
	    myx= writingx
	    myy= writingy
	    lineno= 0
	    halt= 0
	    $Alarm0.start((textspeed) / 30.0)
	}
	if(halt == 2) instance_destroy()
	if(halt == 4) {
	    GS.myfight= 0
	    GS.mnfight= 1
	    keyboard_clear(13/* ENTER */)
	    instance_destroy()
	}

func _on_outside_room():
	myx= writingx
	myy= writingy
	n= 1
	while(n < stringpos + 1) {
	    nskip= 0
	    if(string_char_at(originalstring, n) == "&") {
	        script_execute(148/* SCR_NEWLINE */)
	        n++
	    }
	    if(string_char_at(originalstring, n) == "^") {
	        if(string_char_at(originalstring, n + 1) == "0") nskip= 1
	        else  n+= 2
	    }
	    if(string_char_at(originalstring, n) == "\" + chr(ord('"'))+" + ") {
	        if(string_char_at(originalstring, n + 1) == "R")
	            mycolor= 255
	        if(string_char_at(originalstring, n + 1) == "G")
	            mycolor= 65280
	        if(string_char_at(originalstring, n + 1) == "W")
	            mycolor= 16777215
	        if(string_char_at(originalstring, n + 1) == "Y")
	            mycolor= 65535
	        if(string_char_at(originalstring, n + 1) == "X")
	            mycolor= 0
	        if(string_char_at(originalstring, n + 1) == "B")
	            mycolor= 16711680
	        if(string_char_at(originalstring, n + 1) == "O")
	            mycolor= 4235519
	        if(string_char_at(originalstring, n + 1) == "P")
	            mycolor= 16711935
	        if(string_char_at(originalstring, n + 1) == "C" and GS.inbattle == 0) {
	            if(not instance_exists(783/* obj_choicer */))
	                choicer= instance_create(0, 0, 783/* obj_choicer */)
	            choicer.creator= id
	            halt= 5
	        }
	        if(string_char_at(originalstring, n + 1) == "M") {
	            GS.flag[20]= real(string_char_at(originalstring, n + 2))
	            n++
	        }
	        if(string_char_at(originalstring, n + 1) == "E") {
	            GS.faceemotion= real(string_char_at(originalstring, n + 2))
	            n++
	        }
	        if(string_char_at(originalstring, n + 1) == "F") {
	            GS.facechoice= real(string_char_at(originalstring, n + 2))
	            GS.facechange= 1
	            n++
	        }
	        if(string_char_at(originalstring, n + 1) == "T") {
	            newtyper= string_char_at(originalstring, n + 2)
	            if(newtyper == "T") GS.typer= 4
	            if(newtyper == "t") GS.typer= 48
	            if(newtyper == "0") GS.typer= 5
	            if(newtyper == "S") GS.typer= 10
	            if(newtyper == "f") GS.typer= 9
	            if(newtyper == "F") GS.typer= 16
	            if(newtyper == "s") GS.typer= 17
	            if(newtyper == "P") GS.typer= 18
	            if(newtyper == "M") GS.typer= 27
	            if(newtyper == "U") GS.typer= 37
	            if(newtyper == "A") GS.typer= 47
	            script_execute(150/* SCR_TEXTTYPE */, GS.typer)
	            GS.facechange= 1
	            n++
	        }
	        n+= 2
	    }
	    if(string_char_at(originalstring, n) == "/") {
	        halt= 1
	        if(string_char_at(originalstring, n + 1) == "%") halt= 2
	        if(string_char_at(originalstring, n + 1) == "^" and string_char_at(originalstring, n + 2) != "0")
	            halt= 4
	        if(string_char_at(originalstring, n + 1) == "*") halt= 6
	        break
	    } else  {
	        if(string_char_at(originalstring, n) == "%") {
	            if(string_char_at(originalstring, n + 1) == "%") {
	                instance_destroy()
	                break
	            } else  {
	                stringpos= 1
	                stringno++
	                originalstring= mystring[stringno]
	                myx= writingx
	                myy= writingy
	                lineno= 0
	                $Alarm0.start((textspeed) / 30.0)
	                myletter= " "
	                break
	            }
	        } else  {
	            if(myx > writingxend) script_execute(148/* SCR_NEWLINE */)
	            myletter= string_char_at(originalstring, n)
	            if(GS.typer == 18) {
	                if(myletter == "l" or myletter == "i") myx+= 2
	                if(myletter == "I") myx+= 2
	                if(myletter == "!") myx+= 2
	                if(myletter == ".") myx+= 2
	                if(myletter == "S") myx++
	                if(myletter == "?") myx+= 2
	                if(myletter == "D") myx++
	                if(myletter == "A") myx++
	                if(myletter == "\'") myx++
	            }
	            draw_set_font(myfont)
	            draw_set_color(mycolor)
	            if(shake > 38) {
	                if(shake == 39) {
	                    direction+= 10
	                    draw_text(myx + velocity.x, myy + velocity.y, myletter)
	                }
	                if(shake == 40)
	                    draw_text(myx + velocity.x, myy + velocity.y, myletter)
	                if(shake == 41) {
	                    direction+= 10 * n
	                    draw_text(myx + velocity.x, myy + velocity.y, myletter)
	                    direction-= 10 * n
	                }
	                if(shake == 42) {
	                    direction+= 20 * n
	                    draw_text(myx + velocity.x, myy + velocity.y, myletter)
	                    direction-= 20 * n
	                }
	                if(shake == 43) {
	                    direction+= 30 * n
	                    draw_text(myx + velocity.x * 0.7 + 10, myy + velocity.y * 0.7, myletter)
	                    direction-= 30 * n
	                }
	            } else  {
	                if(GS.typer == 70 or GS.typer == 71 or GS.typer == 74 or GS.typer == 75 or GS.typer == 76 or GS.typer == 77)
	                    draw_text_transformed(myx + random(shake) - shake / 2, myy + random(shake) - shake / 2, myletter, 2, 2, 0)
	                else 
	                    draw_text(myx + random(shake) - shake / 2, myy + random(shake) - shake / 2, myletter)
	            }
	            myx+= spacing
	            n+= nskip
	            n++
	        }
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
