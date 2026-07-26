# Auto-converted from GameMaker: OBJ_INSTAWRITER
# GM parent: OBJ_WRITER
extends Node2D

func _ready():
	SCR_TEXTTYPE(GS.typer)
	stringno= 0
	stringpos= 1
	lineno= 0
	halt= 0
	myx= writingx
	myy= writingy
	x= round(x)
	y= round(y)
	script_execute(1/* SCR_TEXT */, GS.msc)
	n= 0
	while(GS.msg[n] != "%%%") {
	    mystring[n]= GS.msg[n]
	    n++
	}
	originalstring= mystring[0]
	dfy= 0
	stringpos= string_length(originalstring)

func _on_outside_room():
	myx= writingx
	myy= writingy
	n= 1
	while(n < stringpos + 1) {
	    if(string_char_at(originalstring, n) == "&") {
	        script_execute(148/* SCR_NEWLINE */)
	        n++
	    }
	    if(string_char_at(originalstring, n) == "^") n+= 2
	    if(string_char_at(originalstring, n) == "\" + chr(ord('"'))+" + ") {
	        if(string_char_at(originalstring, n + 1) == "R")
	            mycolor= 255
	        if(string_char_at(originalstring, n + 1) == "W")
	            mycolor= 16777215
	        if(string_char_at(originalstring, n + 1) == "X")
	            mycolor= 0
	        if(string_char_at(originalstring, n + 1) == "Y")
	            mycolor= 65535
	        if(string_char_at(originalstring, n + 1) == "G")
	            mycolor= 65280
	        if(string_char_at(originalstring, n + 1) == "B")
	            mycolor= 16711680
	        if(string_char_at(originalstring, n + 1) == "p")
	            mycolor= 13941759
	        if(string_char_at(originalstring, n + 1) == "P")
	            script_execute(149/* SCR_TEXTSETUP */, 4, 255, x, y, x + 150, 43, 4, 94, 10)
	        if(string_char_at(originalstring, n + 1) == "C") {
	            if(GS.inbattle == 0) {
	                if(not instance_exists(783/* obj_choicer */))
	                    choicer= instance_create(0, 0, 783/* obj_choicer */)
	                choicer.creator= id
	            }
	            if(GS.inbattle == 1) halt= 5
	        }
	        n+= 2
	    }
	    if(string_char_at(originalstring, n) == "/") {
	        halt= 1
	        if(string_char_at(originalstring, n + 1) == "%") halt= 2
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
	            } else 
	                draw_text(myx + random(shake) - shake / 2, myy + random(shake) - shake / 2, myletter)
	            myx+= spacing
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
