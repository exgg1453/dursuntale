# Auto-converted from GameMaker: obj_floweytrigger2
extends Node2D

func _ready():
	scale.y= 1
	scale.x= 100
	conversation= 0
	q= 0
	ini_open("undertale.ini")
	a= ini_read_real("Flowey", "Alter", 0)
	b= ini_read_real("Flowey", "K", 0)
	c= ini_read_real("Flowey", "SPECIALK", 0)
	d= ini_read_real("Flowey", "alter2", 0)
	ini_close()
	if(a > 0 or b > 0 or c > 0) q= 1
	if(scr_murderlv() >= 2) q= 0
	if(d > 0) q= 1
	if(q == 1) {
	    // obj_floweytalker1
	    with(875) instance_destroy()
	    instance_destroy()
	}
	if(GS.plot > 27) {
	    // obj_floweytalker1
	    with(875) instance_destroy()
	    instance_destroy()
	}
	dingus= 0

func _gm_event_2_2():
	GS.plot= 28
	GS.interact= 0
	instance_destroy()

func _gm_event_2_1():
	GS.plot= 28
	obj_floweytalker1.sprite_index= 1100/* spr_floweysink */
	obj_floweytalker1.frame= 1
	obj_floweytalker1.image_speed= 0.5
	GS.interact= 0
	instance_destroy()

func _process(delta: float):
	if((conversation == 2 or conversation == 4) and not instance_exists(779/* obj_dialoguer */)) {
	    GS.interact= 1
	    $Alarm1.start((150) / 30.0)
	    if(conversation == 2) snd_play(52/* snd_floweylaugh */)
	    else  {
	        snd_play(86/* snd_wonderfulidea */)
	        $Alarm1.start((80) / 30.0)
	    }
	    obj_floweytalker1.image_speed= 0.25
	    conversation= 999
	}
	if(conversation == 3 and not instance_exists(779/* obj_dialoguer */)) {
	    GS.interact= 1
	    obj_floweytalker1.sprite_index= 1097/* spr_floweygrow */
	    obj_floweytalker1.image_speed= 0.33333334
	    obj_floweytalker1.frame= 0
	    $Alarm2.start((240) / 30.0)
	    conversation= 999
	}
	if(conversation == 1) {
	    GS.interact= 1
	    myinteract= 3
	    GS.typer= 9
	    GS.facechoice= 2
	    GS.faceemotion= 0
	    GS.msc= 0
	    ini_open("undertale.ini")
	    TK= ini_read_real("Toriel", "TK", 0)
	    TS= ini_read_real("Toriel", "TS", 0)
	    FS= ini_read_real("Flowey", "FloweyExplain1", 0)
	    ini_close()
	    GS.msg[0]= "* Error/%%"
	    if(GS.flag[45] == 4) {
	        GS.msg[0]= "* Hee hee hee.../"
	        GS.msg[1]= "\\E2* I hope you like your&  choice./"
	        GS.msg[2]= "* After all^1, it\'s not&  as if you can go&  back and change fate./"
	        GS.msg[3]= "\\E0* In this world^1, it\'s kill&  or be killed./"
	        GS.msg[4]= "\\E2* That old hag thought&  she could break the&  rules./"
	        GS.msg[5]= "\\E1* She tried so hard&  to save you humans./"
	        GS.msg[6]= "\\E0* But when it came&  down to it.../"
	        GS.msg[7]= "\\TF*\\E5 Hee hee.../"
	        GS.msg[8]= "\\E4* SHE COULDN\'T EVEN&  SAVE HERSELF./"
	        GS.msg[9]= "* WHAT AN IDIOT!!/%%"
	        conversation= 2
	        if(TK == 2) {
	            GS.msg[0]= "\\E2* Heheheheh./"
	            GS.msg[1]= "* You just can\'t&  get enough^1, can you!?/"
	            GS.msg[2]= "\\E4* .../"
	            GS.msg[3]= "\\E6* How many more&  times will you&  kill her?/"
	            GS.msg[4]= "* Ha ha ha ha ha.../"
	            GS.msg[5]= "\\E4*\\TF You disgusting animal./"
	            GS.msg[6]= "* You didn\'t even&  TRY to spare her./%%"
	            conversation= 2
	        }
	        if(TK > 2) {
	            GS.msg[0]= "* Wow^1, you really&  can\'t get enough./"
	            GS.msg[1]= "\\E5* You kind of remind&  me of my/%%"
	            conversation= 2
	        }
	        if(TS > 0 and TK > 0) {
	            ini_open("undertale.ini")
	            ini_write_real("Flowey", "FloweyExplain1", 1)
	            ini_close()
	            GS.msg[0]= "* Wow^1, you\'re utterly&  repulsive./"
	            GS.msg[1]= "\\E6* You spared her life.../"
	            GS.msg[2]= "* Then you decided that&  just wasn\'t interesting&  enough for you./"
	            GS.msg[3]= "\\E7* So you murdered her&  just to see what&  would happen./"
	            GS.msg[4]= "\\E5* You killed her out&  of boredom./"
	            GS.msg[5]= "* Truly disgusting.../%%"
	            if(FS == 0) {
	                GS.msg[5]= "* Hee hee.../"
	                GS.msg[6]= "\\E4* You naive idiot./"
	                GS.msg[7]= "* Do you think you&  are the only one&  with that power?/"
	                GS.msg[8]= "\\E4* The power to reshape&  the world.../"
	                GS.msg[9]= "* Purely by your&  own determination./"
	                GS.msg[10]= "* The ability to&  play God!/"
	                GS.msg[11]= "* The ability to " + chr(ord('"')) + "SAVE." + chr(ord('"')) + "/"
	                GS.msg[12]= "\\E0* I thought I was&  the only one with&  that power^1. But.../"
	                GS.msg[13]= "\\E1* I can\'t SAVE anymore./"
	                GS.msg[14]= "* Apparently YOUR&  desires for this&  world override MINE./"
	                GS.msg[15]= "\\E5* Well well./"
	                GS.msg[16]= "* Enjoy that power&  while you can./"
	                GS.msg[17]= "\\E4* I\'ll be watching./%%"
	                conversation= 3
	            }
	        }
	        if(scr_murderlv() >= 2) {
	            ini_open("undertale.ini")
	            ini_write_real("Flowey", "truename", 1)
	            ini_write_real("Flowey", "alter2", 1)
	            ini_close()
	            GS.msg[0]= "* Hahaha.../"
	            GS.msg[1]= "\\E1* You\'re not really human^1,&  are you?/"
	            GS.msg[2]= "\\E1* No.^2 You\'re empty inside^2.&* \\E4Just like me^1.&* In fact.../"
	            GS.msg[3]= "\\E8* You\'re " + GS.charname + ",^1 right?/"
	            GS.msg[4]= "\\E0* We\'re still inseperable^1,&  after all these years.../"
	            GS.msg[5]= "* Listen^1.&* I have a plan to become&  all powerful./"
	            GS.msg[6]= "\\E2* Even more powerful than&  you and your stolen&  soul./"
	            GS.msg[7]= "\\E4* Let\'s destroy everything&  in this wretched world./"
	            GS.msg[8]= "\\E6* Everyone^1, everything in&  these \\E7worthless&  memories.../"
	            GS.msg[9]= "\\E5* Let\'s turn \'em all&  to dust./%%"
	            conversation= 4
	        }
	    } else  {
	        if(GS.flag[45] == 5) {
	            GS.faceemotion= 2
	            GS.msg[0]= "* Clever.&* Verrrryyy clever./"
	            GS.msg[1]= "* You think you\'re really&  smart^1, don\'t you?/"
	            GS.msg[2]= "\\E0* In this world^1, it\'s kill&  or be killed./"
	            GS.msg[3]= "\\E1* So you were able to&  play by your own&  rules./"
	            GS.msg[4]= "*\\E4 You spared the life&  of a single person./"
	            GS.msg[5]= "* Hee hee hee.../"
	            if(GS.kills > 0) {
	                GS.msg[6]= "* Froggit^1, Whimsun^1.&* Vegetoid^1, Loox^1.&* Migosp^1, Moldsmal./"
	                GS.msg[7]= "* Think about those names./"
	                GS.msg[8]= "* Do you think any of&  those monsters have&  families?/"
	                GS.msg[9]= "* Do you think any of&  them have friends?/"
	                GS.msg[10]= "\\E6* Each one could have&  been someone else\'s&  Toriel./"
	                GS.msg[11]= "\\E7* Selfish brat./"
	                GS.msg[12]= "* Somebody is dead&  because of you./%%"
	                conversation= 2
	            }
	            if(GS.kills == 0) {
	                GS.msg[6]= "\\E2* I bet you feel&  really great./"
	                GS.msg[7]= "* You didn\'t kill&  anybody this time./"
	                GS.msg[8]= "\\E0* But what will you&  do if you meet a&  relentless killer?/"
	                GS.msg[9]= "* You\'ll die and you\'ll&  die and you\'ll&  die./"
	                GS.msg[10]= "\\E1* Until you tire of&  trying./"
	                GS.msg[11]= "\\E0* What will you do&  then?/"
	                GS.msg[12]= "\\E5* Will you kill&  out of frustration?/"
	                GS.msg[13]= "* Or will you give&  up entirely on&  this world.../"
	                GS.msg[14]= "\\E4* ... and let ME inherit&  the power to control&  it?/"
	                GS.msg[15]= "\\E5* I am the prince of&  this world\'s future./"
	                GS.msg[16]= "* Don\'t worry^1, my little&  monarch^1, my plan&  isn\'t regicide./"
	                GS.msg[17]= "* This is SO much&  more interesting./%%"
	                conversation= 3
	            }
	            if(TK > 0 and FS == 0) {
	                ini_open("undertale.ini")
	                ini_write_real("Flowey", "FloweyExplain1", 1)
	                ini_close()
	                GS.msg[6]= "* But don\'t act so&  cocky./"
	                GS.msg[7]= "* I know what you did./"
	                GS.msg[8]= "\\E6* You murdered her./"
	                GS.msg[9]= "\\E7* And then you went&  back^1, because you&  regretted it./"
	                GS.msg[10]= "* Ha ha ha ha.../"
	                GS.msg[11]= "\\E5* You naive idiot./"
	                GS.msg[12]= "* Do you think you&  are the only one&  with that power?/"
	                GS.msg[13]= "\\E4* The power to reshape&  the world.../"
	                GS.msg[14]= "* Purely by your&  own determination./"
	                GS.msg[15]= "* The ability to&  play God!/"
	                GS.msg[16]= "* The ability to " + chr(ord('"')) + "SAVE." + chr(ord('"')) + "/"
	                GS.msg[17]= "\\E0* I thought I was&  the only one with&  that power^1. But.../"
	                GS.msg[18]= "\\E1* I can\'t SAVE anymore./"
	                GS.msg[19]= "* Apparently YOUR&  desires for this&  world override MINE./"
	                GS.msg[20]= "\\E5* Well well./"
	                GS.msg[21]= "* Enjoy that power&  while you can./"
	                GS.msg[22]= "\\E4* I\'ll be watching./%%"
	                conversation= 3
	            }
	        }
	    }
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	}

func _on_alarm_0_timeout():
	other.x= other.xprevious
	other.y= other.yprevious
	GS.interact= 1
	conversation= 1

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
