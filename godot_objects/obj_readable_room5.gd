# Auto-converted from GameMaker: obj_readable_room5
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	read= 0
	if(room == 154 and GS.plot < 135) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "%%"
	if(room == 224) {
	    GS.msg[0]= "* (There are a lot of striped&  shirts in here.)/%%"
	    if(scr_murderlv() >= 16) GS.msg[0]= "* Our clothes./%%"
	}
	if(room == 223) {
	    GS.msg[0]= "* (It\'s ASGORE\'s journal.)&* (All the current page says&  is \'Nice day today!\')/"
	    GS.msg[1]= "* (The ink is still almost wet.)/%%"
	    if(GS.flag[7] == 1) GS.msg[1]= "* (The ink\'s dry now.)/%%"
	    if(scr_murderlv() >= 16)
	        GS.msg[0]= "* The entries are always the&  same./%%"
	    if(x < 208) GS.msg[0]= "* (It\'s just a chair.)/%%"
	}
	if(room == 59) GS.msc= 696
	if(room == 141) {
	    GS.msg[0]= "* (It\'s a teacup shaped like&  a yellow lizard.^1)&* (It\'s full of soda.)/%%"
	    if(GS.plot < 126 and scr_murderlv() < 12)
	        GS.msg[0]= "* (It\'s too dark to see&  near the walls.)/%%"
	    if(y >= 125 and x > 800) GS.msc= 827
	}
	if(room == 142) {
	    if(x < 130) {
	        GS.msg[0]= "* (It\'s a promo poster for&  Mettaton\'s TV premiere.)/"
	        GS.msg[1]= "* (On the flap it says " + chr(ord('"')) + "Thank&  you for making my dreams&  come true." + chr(ord('"')) + ")/%%"
	    }
	    if(x < 204 and x > 144) {
	        GS.msg[0]= "* (An incredible invention.)/"
	        GS.msg[1]= "* (When not in use^1, this bed&  folds into an extremely-&  easy-to-draw box.)/%%"
	    }
	    if(x < 575 and x > 474)
	        GS.msg[0]= "* (Pink goop drips from this&  strange machine.)/%%"
	    if(x > 575) GS.msc= 647
	}
	if(room == 102) {
	    GS.msg[0]= "* A haunting song echoes&  down the corridor...&* Won\'t you play along?/"
	    GS.msg[1]= "* Only the first 8 are fine./%%"
	}
	if(room == 91) {
	    GS.msg[0]= "* (It\'s an illustration of a&  strange creature...)/"
	    GS.msg[1]= "* (There\'s something very&  unsettling about this drawing.)/%%"
	}
	if(room == 74) {
	    GS.msg[0]= "* Love^1, hope^1, compassion..^1.&* This is what people say&  monster SOULs are made of./"
	    GS.msg[1]= "* But the absolute nature of&  " + chr(ord('"')) + "SOUL" + chr(ord('"')) + " is unknown./"
	    GS.msg[2]= "* After all^1, humans have proven&  their SOULs don\'t need these&  things to exist./%%"
	}
	if(room == 118) {
	    GS.msg[0]= "* (There\'s a silverware drawer.^1)&* (It has forks^1, spoons^1,&  knives...)/"
	    GS.msg[1]= "* (... tiny swords^1, axes^1,&  spears^1, nunchucks...)/%%"
	}
	if(room == 118 and x < 80) {
	    GS.facechoice= 5
	    GS.faceemotion= 4
	    GS.typer= 37
	    GS.msg[0]= "* I can\'t believe he&  leapt through the&  window like that./"
	    GS.msg[1]= "\\E6* Normally he NAILS&  the landing./%%"
	}
	if(room == 138) {
	    GS.msg[0]= "* (Small puddle forming.)/%%"
	    if(GS.flag[353] > 7) GS.msg[0]= "* (Medium puddle forming.)/%%"
	    if(GS.flag[353] > 15) GS.msg[0]= "* (Large puddle forming.)/%%"
	    if(GS.flag[353] > 15 and GS.flag[7] == 1)
	        GS.msg[0]= "* (A small tree is growing in&  the puddle.)/%%"
	}
	if(room == 141 and x > 828 and x < 868 and y < 90)
	    GS.msg[0]= "* (It\'s a bathroom sign.)/%%"
	if(room == 78) {
	    if(x < 128) {
	        if(GS.flag[497] < 3) {
	            GS.msg[0]= "* (Inside the drawer is a silver&  key.)/"
	            GS.msg[1]= "* (You put it on your keychain.)/%%"
	            GS.flag[497]= 3
	        } else 
	            GS.msg[0]= "* (Clothes and trombones are&  shoved in haphazardly.)/%%"
	    } else 
	        GS.msg[0]= "* (It appears to be a self-&  sustaining tornado made of&  trash.)/%%"
	}
	if(room == 154) GS.msg[0]= "* (It\'s glued to the table.)/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

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
