# Auto-converted from GameMaker: obj_papyrus_guide
# GM parent: obj_papyrusparent
extends CharacterBody2D

func _ready():
	if(GS.flag[67] == 1) {
	    instance_destroy()
	    exit
	} else  {
	    dsprite= 1313
	    usprite= 1325
	    lsprite= 1330
	    rsprite= 1328
	    dtsprite= 1316
	    utsprite= 1327
	    ltsprite= 1334
	    rtsprite= 1335
	    myinteract= 0
	    facing= 0
	    direction= 270
	    talkedto= 0
	    image_speed= 0
	    fun= 0
	    spot= 2
	    myscore= 0
	    workout= 0
	    intro= 0
	    if(GS.entrance == 2) {
	        spot= 5
	        x= 26
	        y-= 80
	        solid= 0
	        velocity.y= 6
	        sprite_index= 1313/* spr_papyrus_d */
	        image_speed= 0.25
	    }
	    if(GS.flag[88] >= 4) instance_destroy()
	    exit
	}

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 19
	GS.facechoice= 4
	GS.faceemotion= 0
	GS.msg[0]= "WELCOME TO SCENIC&MY HOUSE!/"
	GS.msg[1]= "ENJOY AND TAKE&YOUR TIME!!!/%%"
	if(workout == 1)
	    GS.msg[0]= "WOW!&BEING A GOOD HOST&IS A REAL WORKOUT!/%%"
	if(workout == 2) {
	    GS.faceemotion= 3
	    GS.msg[0]= "\\E3I CAN\'T FEEL MY&LEGS.../"
	    GS.msg[1]= "\\E0THAT MUST MEAN&I\'M BEING A&GREAT HOST!!!/%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(fun == 0) {
	    if(instance_exists(775/* obj_face_papyrus */))
	        frame= obj_face_papyrus.frame
	    else  {
	        if(speed == 0 and path_speed == 0) frame= 0
	    }
	}
	if(speed == 0) scr_npc_watch(0)
	if(instance_exists(1414/* obj_kitchenchecker */) and spot > 0 and obj_kitchenchecker.level == 0 and GS.interact == 0) {
	    if(spot == 2) {
	        myscore++
	        if(myscore > 3) {
	            snd_play(28/* snd_bell */)
	            velocity.x*= 1.1
	        }
	    }
	    spot= 1
	}
	if(spot == 1) {
	    solid= 0
	    if(velocity.x == 0) velocity.x= 5
	    if(velocity.x < 0) velocity.x= -velocity.x
	    image_speed= 0.5
	    sprite_index= 1328/* spr_papyrus_r */
	    if(x > 183) {
	        x= ceil(x)
	        velocity.x= 0
	        spot= 0
	        sprite_index= 1327/* spr_papyrus_ut */
	        solid= 1
	        if(myscore > 10) snd_play(49/* snd_levelup */)
	        myscore= 0
	    }
	}
	if(instance_exists(1414/* obj_kitchenchecker */) and spot < 2 and obj_kitchenchecker.level == 1 and GS.interact == 0) {
	    if(spot == 1) {
	        myscore++
	        if(myscore > 3) {
	            snd_play(28/* snd_bell */)
	            velocity.x*= 1.1
	        }
	    }
	    spot= 2
	}
	if(spot == 2) {
	    solid= 0
	    if(velocity.x == 0) velocity.x= -5
	    if(velocity.x > 0) velocity.x= -velocity.x
	    image_speed= 0.5
	    sprite_index= 1330/* spr_papyrus_l */
	    if(x < 27) {
	        x= floor(x)
	        velocity.x= 0
	        spot= 3
	        sprite_index= 1335/* spr_papyrus_rt */
	        solid= 1
	        if(myscore > 10) snd_play(49/* snd_levelup */)
	        myscore= 0
	    }
	}
	if(spot == 5 and y >= ystart) {
	    y= ystart
	    velocity.y= 0
	    spot= 3
	    sprite_index= 1335/* spr_papyrus_rt */
	}
	if(myscore > 3 and workout == 0) workout= 1
	if(myscore > 10 and workout == 1) workout= 2

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
