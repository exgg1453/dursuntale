# Auto-converted from GameMaker: obj_floweytrigger
extends Node2D

func _ready():
	scale.x= 50
	conversation= 0
	if(GS.plot > 0) instance_destroy()
	faketor= 0
	alter= 0
	ini_open("undertale.ini")
	a= ini_read_real("Flowey", "Alter", 0)
	b= ini_read_real("Flowey", "K", 0)
	c= ini_read_real("Flowey", "SPECIALK", 0)
	ini_close()
	if(a > 0 or b > 0 or c > 0) alter= 1
	if(alter == 1) {
	    // obj_floweytalker1
	    with(875) visible= 0
	}

func _gm_event_2_4():
	conversation++

func _gm_event_2_3():
	GS.interact= 0

func _gm_event_2_2():
	instance_create(146, 260, 860/* obj_toroverworld1 */)
	GS.msc= 201
	GS.typer= 4
	GS.interact= 1
	GS.facechoice= 1
	conversation= 3
	if(faketor == 1) {
	    GS.msc= 0
	    GS.msg[0]= "\\E1* Hello..^1.&* Are you all right?/"
	    GS.msg[1]= "* You must be so lost&  and confused.../"
	    GS.msg[2]= "\\E2* Ah, do not be&  afraid^1, my child./"
	    GS.msg[3]= "\\W* I am \\BTORIEL\\W,&  caretaker of the&  \\RRUINS\\W./"
	    GS.msg[4]= "* I pass through here&  every day to see if&  anyone has fallen down./"
	    GS.msg[5]= "* You are the first&  human to come here&  in a long time./"
	    GS.msg[6]= "* I will do my best&  to protect you during&  your time here./"
	    GS.msg[7]= "* Come^1!&* I shall guide you&  through the catacombs./%%"
	    with(temptor) instance_destroy()
	}
	instance_create(0, 0, 779/* obj_dialoguer */)

func _on_destroy():
	room_persistent= 1
	GS.plot= 1
	$Alarm2.start((42) / 30.0)
	instance_create(0, 0, 143/* obj_battlerflowey */)

func _process(delta: float):
	if(conversation == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 3
	    $Alarm0.start((1) / 30.0)
	    conversation= 2
	    instance_create(0, 0, 147/* obj_fader */)
	}
	if(conversation == 3 and instance_exists(763/* obj_torface */))
	    conversation= 3.5
	if(conversation == 3.5 and not instance_exists(763/* obj_torface */)) {
	    room_persistent= 0
	    GS.specialbattle= 0
	    obj_toroverworld1.direction= 90
	    obj_toroverworld1.speed= 2
	    $Alarm3.start((15) / 30.0)
	    conversation= 4
	}
	if(conversation == 20 and not instance_exists(782/* OBJ_WRITER */)) {
	    mus= instance_create(0, 0, 92/* obj_musfadeout */)
	    GS.interact= 1
	    visible= 0
	    flow= 875
	    with(flow) visible= 0
	    flow_m= scr_marker(flow.x, flow.y, 1100)
	    with(flow_m) scr_depth()
	    flow_m.image_speed= 0.25
	    conversation= 21
	}
	if(conversation == 21 and not instance_exists(782/* OBJ_WRITER */) and flow_m.frame >= 5) {
	    flow_m.visible= 0
	    conversation= 21.2
	    $Alarm4.start((50) / 30.0)
	}
	if(conversation == 22.2 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.plot= 1
	    with(flow_m) instance_destroy()
	    with(mus) instance_destroy()
	    caster_free(GS.currentsong)
	    conversation= 23
	}
	if(conversation == 23) {
	    temptor= scr_marker(146, view_yview[0] - 60, 1103)
	    temptor.image_speed= 0.25
	    temptor.velocity.y= 2
	    GS.currentsong= caster_load("music/toriel.ogg")
	    caster_loop(GS.currentsong, 0.7, 0.86)
	    conversation= 24
	}
	if(conversation == 24) {
	    with(temptor) scr_depth()
	    if(temptor.y >= 258) {
	        faketor= 1
	        temptor.frame= 0
	        temptor.speed= 0
	        temptor.image_speed= 0
	        conversation= 25
	        $Alarm2.start((30) / 30.0)
	    }
	}

func _on_alarm_0_timeout():
	if(GS.plot == 0) {
	    other.x= other.xprevious
	    other.y= other.yprevious
	    GS.interact= 1
	    if(alter == 0) {
	        ini_open("undertale.ini")
	        g= ini_read_real("Flowey", "Met1", 0)
	        truename= ini_read_real("Flowey", "truename", 0)
	        IK= ini_read_real("Flowey", "IK", 0)
	        NK= ini_read_real("Flowey", "NK", 0)
	        GS.currentsong= caster_load("music/flowey.ogg")
	        caster_loop(GS.currentsong, 1, 1)
	        GS.typer= 9
	        GS.facechoice= 2
	        GS.faceemotion= 0
	        GS.msc= 200
	        spec= 0
	        if(g == 1) {
	            GS.msc= 0
	            GS.msg[0]= "\\W* Howdy^2!&* I\'m\\Y FLOWEY\\W.^2 &* \\YFLOWEY\\W the \\YFLOWER\\W!/"
	            GS.msg[1]= "* Hee hee hee.../"
	            GS.msg[2]= "* Why\'d you make me&  introduce myself?/"
	            GS.msg[3]= "* It\'s rude to act&  like you don\'t&  know who I am./"
	            GS.msg[4]= "* Someone ought to teach&  you proper manners./"
	            GS.msg[5]= "* I guess little old me&  will have to do./"
	            GS.msg[6]= "* Ready^2?&* Here we go!/%%"
	        }
	        if(g > 1) {
	            GS.msc= 0
	            GS.msg[0]= "* Don\'t you have anything&  better to do?/%%"
	        }
	        conversation= 1
	        if(NK > 0 or IK > 0 or truename > 0) spec= 1
	        if(spec == 1) {
	            GS.msc= 0
	            ini_write_real("Flowey", "Alter", 1)
	            GS.msg[0]= "* Error/%%"
	            if(truename == 1) {
	                GS.msg[0]= "* Really^1, " + GS.charname + "?/"
	                GS.msg[1]= "\\E5* Well^1, do what you&  will./"
	                GS.msg[2]= "\\E4* I\'ll be waiting for&  you!/%%"
	            }
	            if(IK > 0) {
	                GS.msg[0]= "\\E0* Hey^1.&* Remember./"
	                GS.msg[1]= "\\E2* DON\'T kill anyone./"
	                GS.msg[2]= "\\E2* .../"
	                GS.msg[3]= "\\E1* I can\'t believe this&  is a REAL thing I&  have to remind you./"
	                GS.msg[4]= "\\E0* Hee hee hee.../"
	                GS.msg[5]= "* Good luck!/%%"
	            }
	            if(NK > 0) {
	                GS.msg[0]= "* Remember.../"
	                GS.msg[1]= "\\E1* THIS time^1, you\'ve&  GOT to become friends&  with everyone./"
	                GS.msg[2]= "\\E2* OK?/"
	                GS.msg[3]= "\\E5* If you DON\'T^1, you\'ll&  be miserable FOREVER./"
	                GS.msg[4]= "\\E1* And we wouldn\'t want&  THAT^1, would we?/"
	                GS.msg[5]= "\\E0* No..^1.&* We just want you&  to be happy^1, right?/"
	                GS.msg[6]= "* Good luck. /%%"
	            }
	            conversation= 19
	            $Alarm4.start((5) / 30.0)
	        }
	        ini_write_real("Flowey", "Met1", g + 1)
	        ini_close()
	        if(not instance_exists(779/* obj_dialoguer */)) instance_create(0, 0, 779/* obj_dialoguer */)
	    } else  {
	        GS.plot= 1
	        conversation= 23
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
