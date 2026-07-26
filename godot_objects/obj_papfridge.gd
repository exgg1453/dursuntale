# Auto-converted from GameMaker: obj_papfridge
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

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(instance_exists(1025/* obj_papyrusparent */)) {
	    scr_papface(0, 0)
	    GS.msg[1]= "AH-HA^1!&INTERESTED IN&MY FOOD MUSEUM?/"
	    GS.msg[2]= "PLEASE^1.&PERUSE MY&CULINARY ARTSHOW./"
	    GS.msg[3]= "\\TS \\F0 \\T0 %"
	    GS.msg[4]= "* (Half of the fridge is&  filled with containers&  all labelled " + chr(ord('"')) + "spaghetti." + chr(ord('"')) + ")/"
	    GS.msg[5]= "* (The other half contains&  nothing but an empty&  bag of chips.)/%%"
	    if(talkedto > 0) GS.msg[1]= "GREAT FRIDGE^1,&ISN\'T IT?/%%"
	} else  {
	    GS.msg[0]= "* (Half of the fridge is&  filled with containers&  all labelled " + chr(ord('"')) + "spaghetti." + chr(ord('"')) + ")/"
	    GS.msg[1]= "* (The other half contains&  nothing but an empty&  bag of chips.)/%%"
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
	if(myinteract == 3 and not is_instance_valid(mydialoguer)) {
	    GS.interact= 0
	    myinteract= 0
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
