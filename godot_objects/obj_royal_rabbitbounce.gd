# Auto-converted from GameMaker: obj_royal_rabbitbounce
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	myinteract= 0
	siner= 0
	scr_depth()
	if(scr_murderlv() >= 12 and room == 139) {
	    ff= instance_create(180, 60, 1183/* obj_kitchenforcefield */)
	    with(ff) scale.x= 3
	    with(ff) scale.y= 1
	    instance_destroy()
	    exit
	} else  {
	    d= 0
	    if(GS.plot >= 136 and room == 139) {
	        instance_destroy()
	        exit
	    } else  {
	        if(GS.flag[402] == 1) {
	            instance_destroy()
	            exit
	        } else  {
	            dbud= instance_create(x + 23, y, 1358/* obj_npc_room */)
	            dbud.sprite_index= 1840/* spr_royalguard_dragon_d */
	            instance_create(x - 17, y + 25, 6/* obj_solidexwide */)
	            tt= 0
	            exit
	        }
	    }
	}

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Sorry..^1. UNDYNE^1, like^1, told&  us there was totally a&  human in the area./"
	GS.msg[1]= "* So^1, like^1, us Royal Guards are&  blocking off the elevators&  for now./"
	GS.msg[2]= "* Ngah^1! Even if the elevators&  aren\'t working anyway^1, we\'ll&  do our best^1, Ms. UNDYNE!/%%"
	if(tt == 1) {
	    GS.msg[0]= "* Like^1, NO WAY you\'re getting&  by us./"
	    GS.msg[1]= "* But^1, between you and me...&* I think you could go through&  that creepy lab over there./"
	    GS.msg[2]= "* Between you^1, me^1, and my&  bro here^1, I mean./"
	    GS.msg[3]= "* I tell him ALL my secrets./%%"
	}
	if(tt >= 2) {
	    GS.msg[0]= "* Hey^1!&* No loitering!/"
	    GS.msg[1]= "* Like^1, just kidding^1.&* I don\'t care^1.&* Like^1, loiter your heart out./%%"
	}
	if(room == 181) {
	    GS.msg[0]= "* Oh^1, hey./"
	    GS.msg[1]= "* We\'re^1, like^1, taking a rain&  check on that killing-you&  thing./"
	    GS.msg[2]= "* Like^1, don\'t tell Undyne&  about this^1, OK?/%%"
	    if(tt >= 1)
	        GS.msg[0]= "* You didn\'t tell her^1, did&  you...?/%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* Undyne told us that the&  Royal Guard is being disbanded./"
	        GS.msg[1]= "* Like^1, bummer..^1.&* Guess we\'ll have to get&  used to Love and Peace./%%"
	    }
	}
	tt++
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _on_outside_room():
	if(myinteract != 0) {
	    siner++
	    y-= cos(siner / 3) * 0.6
	    scale.y= 1 + sin(siner / 3) * 0.1
	    scale.x= 1 - sin(siner / 3) * 0.05
	} else  {
	    siner= 0
	    scale.y= 1
	    scale.x= 1
	    y= ystart
	}
	draw_sprite_ext(sprite_index, frame, x, y, scale.x, scale.y, 0, 16777215, modulate.a)

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
