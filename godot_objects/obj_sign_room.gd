# Auto-converted from GameMaker: obj_sign_room
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	image_speed= 0
	if(room == 304) sprite_index= 1592/* spr_magicalcrystal */
	if(room == 122) sprite_index= 1570/* spr_stable */
	talkedto= 0
	if(room == 118) sprite_index= 1495/* spr_tinychair */

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(room == 20 or room == 170)
	    GS.msg[0]= "* Spider Bake Sale&* All proceeds go to real&  spiders./%%"
	if(room == 12) {
	    GS.msg[0]= "1234567890123456789012345678901234567890/"
	    GS.msg[1]= "\\F1 %"
	    GS.msg[2]= "123456789012345678901234567890/"
	    GS.msg[3]= "\\Ts %"
	    GS.msg[4]= "123456789012345678901234567890/"
	    GS.msg[5]= "\\TP %"
	    GS.msg[6]= "123456789012345678901234567890/%%"
	}
	if(room == 220) {
	    GS.facechoice= 7
	    GS.typer= 60
	    GS.msg[0]= "* Test one./"
	    GS.msg[1]= "\\E1* Test two./"
	    GS.msg[2]= "\\E2* Test three./"
	    GS.msg[3]= "\\E3* Test four./%%"
	}
	if(room == 46) {
	    GS.msg[0]= "* (This is a box.)/"
	    GS.msg[1]= "* (You can put an item&  inside or take an item&  out.)/"
	    GS.msg[2]= "* (The same box will appear&  later^1, so don\'t worry&  about coming back.)/"
	    GS.msg[3]= "* (Sincerely^1, a box lover.)/%%"
	}
	if(room == 49) GS.msg[0]= "* (Absolutely NO MOVING!!!)/%%"
	if(room == 50) {
	    GS.msg[0]= "* North: Ice&* South: Ice&* West: Ice/"
	    GS.msg[1]= "* East: Snowdin Town/"
	    GS.msg[2]= "* (... and ice)/%%"
	}
	if(room == 53) {
	    GS.msg[0]= "* North: Ice&* South: Ice&* West: Ice/"
	    GS.msg[1]= "* East: Snowdin Town/"
	    GS.msg[2]= "* (... and ice)/%%"
	}
	if(room == 54) {
	    GS.msg[0]= "* SMELL DANGER RATING/"
	    GS.msg[1]= "\\W* Snow Smell - Snowman&  WHITE Rating&  Can become \\YYELLOW\\W Rating/"
	    GS.msg[2]= "\\W* Unsuspicious Smell - Puppy&  \\BBLUE\\W Rating&  Smell of rolling around./"
	    GS.msg[3]= "\\W* Weird Smell - Humans&  \\RGREEN\\W Rating&  Destroy at all costs!/%%"
	}
	if(room == 57) {
	    GS.msg[0]= "* Warning:&  Dog Marriage/%%"
	    if(talkedto == 1)
	        GS.msg[0]= "* (Yes^1, you read that correctly.)/%%"
	}
	if(room == 59 or room == 58)
	    GS.msg[0]= "* Turn every X into an O^1.&* Then press the switch./%%"
	if(room == 61) GS.msg[0]= "* AWARE OF DOG&* pleas pet dog/%%"
	if(room == 66) GS.msg[0]= "* (Woof.)/%%"
	if(room == 63)
	    GS.msg[0]= "* (You will not slide on&  an X^1, O^1, or triangle.)/%%"
	if(room == 84) {
	    GS.msg[0]= "* (This is a box.)/"
	    GS.msg[1]= "* (You can put an item in&  or take an item out.)/"
	    GS.msg[2]= "* (Why would you^1, though^1???)&* (You can\'t use items&  when they\'re in the box!)/"
	    GS.msg[3]= "* (Sincerely^1, a box hater.)/%%"
	}
	if(room == 86) {
	    GS.msg[0]= "* (This sign is written in&  very neat cursive.)/"
	    GS.msg[1]= "* Do not destroy the&  science grass./"
	    GS.msg[2]= "* It is used for science./%%"
	}
	if(room == 88) {
	    GS.msg[0]= "* Congratulations!/"
	    GS.msg[1]= "* You failed the puzzle!/%%"
	}
	if(room == 304)
	    GS.msg[0]= "* It\'s a crystal^1.&* You\'ve never seen one&  like this before./%%"
	if(room == 105) GS.msg[0]= "* (Please take one.)/%%"
	if(room == 116)
	    GS.msg[0]= "* North: Blook Acres&* East: Hotland&* ???: Temmie Village/%%"
	if(room == 122)
	    GS.msg[0]= "* (It\'s a stable for snails.^1)&* (A snable.)/%%"
	if(room == 130) {
	    GS.facechoice= 5
	    GS.msg[0]= "* This is a damned test!/"
	    GS.msg[1]= "* 0^1. \\E1 1^1. \\E1 1^1.\\E2 1^1.\\E3 1^1.\\E4 1^1.\\E5 1^1.\\E6 1^1. \\E7 1^1.\\E8 1^1./%%"
	}
	if(room == 131)
	    GS.msg[0]= "* (Last chance to wish&  before Hotland^1.)&* (Careful of pollen.)/%%"
	if(room == 118) GS.msc= 706
	if(room == 138) {
	    GS.facechoice= 8
	    GS.typer= 27
	    GS.faceemotion= 0
	    GS.msg[0]= "* B/"
	    GS.msg[1]= "\\E1* B/"
	    GS.msg[2]= "\\E2* B/"
	    GS.msg[3]= "\\E3* B/"
	    GS.msg[4]= "\\E4* B/"
	    GS.msg[5]= "\\E5* B/"
	    GS.msg[6]= "\\E6* B/"
	    GS.msg[7]= "\\E7* B/"
	    GS.msg[8]= "\\E8* B/"
	    GS.msg[9]= "\\E9* B/%%"
	}
	if(room == 68) {
	    GS.msg[0]= "* (Don\'t want to walk to the&  other side of town?)/"
	    GS.msg[1]= "* (Try the undersnow tunnels^1!)&* (They\'re efficiently laid out.)/%%"
	}
	if(room == 183) {
	    GS.msg[0]= "* East: Burgertown&* North: Cord&* West: Restraint/"
	    GS.msg[1]= "* This area\'s not done so no&  fun is allowed here yet./"
	    GS.msg[2]= "* Signed, the Manmengent/%%"
	}
	if(room == 128) {
	    GS.msg[0]= "* hOI!^1!&* welcom to..^1.&* TEM VILLAGE!!!/%%"
	    if(x > 270)
	        GS.msg[0]= "* hOI!^1!&* u shud check out..^1.&* TEM SHOP!!!/%%"
	    if(x > 330)
	        GS.msg[0]= "* yaYA!^1! i AGREES!^1!&* shud check..^1.&* TEM SHOP!!!/%%"
	}
	if(room == 185) {
	    GS.msg[0]= "* Learning how to draw^1?&* Come to the Art Lessons on&  the second floor!/"
	    GS.msg[1]= "* Located in a similar place./%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)

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
