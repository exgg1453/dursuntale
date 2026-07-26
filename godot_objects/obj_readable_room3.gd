# Auto-converted from GameMaker: obj_readable_room3
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	talkedto= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "%%"
	if(room == 36)
	    GS.msg[0]= "* (A box of kids\' shoes in&  a disparity of sizes.)/%%"
	if(room == 224) {
	    GS.msg[0]= "* (It\'s a drawing of a&  golden flower.)/%%"
	    if(scr_murderlv() >= 16) GS.msg[0]= "\\R* My drawing./%%"
	}
	if(room == 35) {
	    GS.msg[0]= "* (Definitely bigger than&  a twin-sized bed.)/%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* (Earlier^1, you identified&  this as bigger than a&  twin-sized bed.)/"
	        GS.msg[1]= "* (But now^1, you realize&  it\'s actually one size&  bigger than a double.)/%%"
	    }
	}
	if(room == 221) GS.msg[0]= "* The coals are still warm./%%"
	if(room == 223)
	    GS.msg[0]= "* (Macaroni art of a flower.^1)&* (\'For King Dad!\')/%%"
	if(room == 34)
	    GS.msg[0]= "* Inside the drawer are&  flower seeds and some&  broken crayons./%%"
	if(room == 37)
	    GS.msg[0]= "* There is some white fur&  stuck in the drain./%%"
	if(room == 225)
	    GS.msg[0]= "* (There is some white fur&  stuck in the drain.)/%%"
	if(room == 74) {
	    GS.msg[0]= "* Because they are made of&  magic^1, monsters\' bodies are&  attuned to their SOUL./"
	    GS.msg[1]= "* If a monster doesn\'t want&  to fight^1, its defenses will&  weaken./"
	    GS.msg[2]= "* And the crueller the intentions&  of our enemies^1, the more&  their attacks will hurt us./"
	    GS.msg[3]= "* Therefore^1, if a being with&  a powerful SOUL struck with&  the desire to kill.../"
	    GS.msg[4]= "* Um^1, let\'s end the chapter&  here.../%%"
	}
	if(room == 45)
	    GS.msg[0]= "* ...!^1?&* There\'s a camera behind the&  sentry station./%%"
	if(room == 48)
	    GS.msg[0]= "* ...!^1?&* There is a camera behind the..^1.&  " + chr(ord('"')) + "sentry station." + chr(ord('"')) + "/%%"
	if(room == 53)
	    GS.msg[0]= "* ...!^1?&* There\'s a camera hidden inside&  this lump of snow./%%"
	if(room == 57)
	    GS.msg[0]= "* ...!^1?&* There\'s a camera hidden inside&  this tree./%%"
	if(room == 59)
	    GS.msg[0]= "* ...!^1?&* There\'s a camera hidden inside&  this tree./%%"
	if(room == 61)
	    GS.msg[0]= "* ...!^1?&* There\'s a camera behind the&  sentry station./%%"
	if(room == 67)
	    GS.msg[0]= "* ...!^1?&* There\'s a camera underneath&  the bridge./%%"
	if(room == 68)
	    GS.msg[0]= "* ...!^1?&* There\'s a camera hidden in&  the trees here./%%"
	if(room == 87)
	    GS.msg[0]= "* When four Bridge Seeds align&  in the water^1, they will&  sprout./%%"
	if(room == 88)
	    GS.msg[0]= "* If an error is made, the Bell&  Blossom can call Bridge Seeds&  back to where they started./%%"
	if(room == 90) GS.msg[0]= "* WISHING ROOM/%%"
	if(room == 91) {
	    GS.msg[0]= "* But humans have one weakness.&* Ironically, it is the strength&  of their SOUL./"
	    GS.msg[1]= "* Its power allows it to persist&  outside the human body, even&  after death./%%"
	}
	if(room == 101) {
	    GS.msg[0]= "* There is only one exception./"
	    GS.msg[1]= "* The SOUL of a special species&  of monster called a&  " + chr(ord('"')) + "Boss Monster." + chr(ord('"')) + "/"
	    GS.msg[2]= "* A Boss Monster\'s SOUL is&  strong enough to persist&  after death.../"
	    GS.msg[3]= "* If only for a few moments./"
	    GS.msg[4]= "* A human could absorb this&  SOUL.&* But this has never happened./"
	    GS.msg[5]= "* And now it never will./%%"
	}
	if(room == 126) {
	    GS.msg[0]= "* But this cursed place has&  no entrances or exits./"
	    GS.msg[1]= "* There is no way a human&  could come here./"
	    GS.msg[2]= "* We will remain trapped&  down here forever./%%"
	}
	if(room == 76) {
	    if(instance_exists(1025/* obj_papyrusparent */)) {
	        scr_papface(0, 0)
	        GS.msg[1]= "A CLASSIC IMAGE./"
	        GS.msg[2]= "IT ALWAYS REMINDS&ME OF WHAT\'S&IMPORTANT IN LIFE./%%"
	    } else  GS.msg[0]= "* (It\'s a painting of a&  cartoon bone.)/%%"
	}
	if(room == 117) GS.msg[0]= "* (Seems like a nice tree.)/%%"
	if(room == 77) GS.msc= 561
	if(room == 123)
	    GS.msg[0]= "* (Whenever the girl moves her&  net^1, this bug scurries straight&  into it.)/%%"
	if(room == 141) {
	    GS.msg[0]= "* (Seems like the notes to&  something^1, but it\'s all&  written in chicken scratch.)/"
	    GS.msg[1]= "* (It seems like a walkthrough&  to a game^1, or...?)/%%"
	    if(GS.plot < 126 and scr_murderlv() < 12)
	        GS.msg[0]= "* (It\'s too dark to see&  near the walls.)/%%"
	}
	if(room == 142) {
	    GS.msg[0]= "* (VHSes and DVDs of various&  cartoons.)/"
	    GS.msg[1]= "* (They are all labelled " + chr(ord('"')) + "Human&  History." + chr(ord('"')) + ")/%%"
	}
	if(room == 154) {
	    GS.msg[0]= "* (It\'s a specifically-regular&  -sized sink.)/%%"
	    if(GS.plot < 134)
	        GS.msg[0]= "* (It\'s too dark to see&  near the walls.)/%%"
	    if(instance_exists(1173/* obj_mettaton_npc */)) {
	        GS.typer= 27
	        GS.msg[0]= "* THIS ISN\'T A SHOW ABOUT&  WASHING YOUR HANDS, DARLING./"
	        GS.msg[1]= "* THAT\'S ON WEDNESDAYS!/%%"
	        if(GS.plot == 134) {
	            GS.msg[0]= "* THIS ISN\'T A SHOW ABOUT&  WASHING YOUR HANDS, DARLING./"
	            GS.msg[1]= "* THAT\'S ON WEDNESDAYS!/%%"
	        }
	    }
	}
	if(room == 118) {
	    GS.typer= 37
	    GS.facechoice= 5
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.msg[0]= "* One time^1, Alphys\'s..^1.&* Uh^1, friend??^1?&* Came over here./"
	    GS.msg[1]= "\\E4* All he did was&  lie seductively&  on the piano.../"
	    GS.msg[2]= "\\E5* And fed himself&  grapes./"
	    GS.msg[3]= "\\E4* I don\'t really&  like that guy./"
	    GS.msg[4]= "\\E3* But I admire&  his lifestyle./%%"
	    if(talkedto > 0)
	        GS.msg[0]= "* What^1?&* I\'m not gonna&  serenade you./%%"
	}
	if(room == 245) {
	    GS.msg[0]= "* ENTRY NUMBER 3/"
	    GS.msg[1]= "* But extracting a SOUL from&  a living monster would&  require incredible power.../"
	    GS.msg[2]= "* Besides being impractical^1,&  doing so would instantly&  destroy the SOUL\'s host./"
	    GS.msg[3]= "* And^1, unlike the persistent&  SOULs of humans.../"
	    GS.msg[4]= "* The SOULs of most monsters&  disappear immediately upon&  death./"
	    GS.msg[5]= "* If only I could make a&  monster\'s SOUL last.../%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	}
	if(room == 257)
	    GS.msg[0]= "* (There are a bunch of VHSes.^1)&* (Seems like it\'s mostly&  cartoons of some kind.)/%%"
	if(room == 258) {
	    GS.msg[0]= "* ENTRY NUMBER 21/"
	    GS.msg[1]= "* i spend all my time at&  the garbage dump now/"
	    GS.msg[2]= "* it\'s my element/%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	    if(GS.flag[490] == 0)
	        GS.msg[0]= "* (It\'s too dark to see near&  the walls.)/%%"
	}
	if(room == 246) GS.msc= 829
	if(room == 78)
	    GS.msg[0]= "* (It\'s a thank-you letter.^1)&* (It\'s addressed to Santa.)/%%"
	if(room == 80) {
	    GS.msg[0]= "* (Blueprints.^1)&* (You can\'t read the symbols&  they\'re written in...)/"
	    GS.msg[1]= "* (... or maybe it\'s just the&  handwriting.)/"
	    GS.msg[2]= "* (Looks like they relate to&  some kind of strange machine.)/%%"
	}
	if(room == 120) {
	    if(instance_exists(1132/* obj_napstablook_actor */)) {
	        GS.msg[0]= "* oh..^1. that\'s my tv.../"
	        GS.msg[1]= "* there\'s a show i like to&  watch on it..^1.&* sometimes.../%%"
	    } else  {
	        GS.msg[0]= "* (It\'s a spooky old TV.^1)&* (Most of the buttons are&  worn away...)/"
	        GS.msg[1]= "* (Though the channel changing&  buttons look good as new.)/%%"
	    }
	}
	if(room == 266)
	    GS.msg[0]= "* (Rope.^1)&* (Looks like this dog does&  all its own stunts.)/%%"
	if(room == 184)
	    GS.msg[0]= "* (It\'s some kind of TV show&  featuring Mettaton.)/%%"
	if(room == 128)
	    GS.msg[0]= "* (Statue of tem..^1. very famus^1)&* (VERY!!!!!!!!!)/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

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
