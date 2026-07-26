# Auto-converted from GameMaker: obj_killerlab_event
extends Node2D

func _ready():
	scale.y= 10
	if(GS.plot > 159) {
	    instance_destroy()
	    exit
	} else  {
	    if(scr_murderlv() < 12) instance_destroy()
	    else  {
	        con= 0
	        GS.flag[20]= 0
	        mett= instance_create(820, 100, 1172/* obj_mettaton_actor */)
	        mett.image_speed= 0.125
	    }
	    exit
	}

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    con= 2
	    nowx= view_xview[0]
	    obj_mainchara.cutscene= 1
	}
	if(con == 2) {
	    view_xview[0]+= 3
	    if(view_xview[0] >= nowx + 78) {
	        view_xview[0]= nowx + 78
	        con= 2.1
	        $Alarm4.start((30) / 30.0)
	    }
	}
	if(con == 3.1) {
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.typer= 27
	    GS.msc= 0
	    GS.msg[0]= "* OH^1, THERE YOU ARE./"
	    GS.msg[1]= "\\M5* YOU UGLY LITTLE CREATURE^1.&* YOU\'VE MADE QUITE A NAME&  FOR YOURSELF./"
	    GS.msg[2]= "\\M3* SUCH INFAMY...^1!&* I\'M IMPRESSED./"
	    GS.msg[3]= "\\M4* OH^1. YES^1.&* IF YOU\'RE LOOKING FOR ALPHYS^1,&  SHE\'S NOT HERE./"
	    GS.msg[4]= "\\M0* WHILE YOU WERE BUSY DOING&  YOUR^1, AHEM^1, THING.../"
	    GS.msg[5]= "* SHE WAS RUNNING AROUND&  EVACUATING PEOPLE TO SAFETY./"
	    GS.msg[6]= "\\M4* NOW THEY\'RE IN A PLACE&  WHERE YOU\'LL NEVER GET TO&  THEM./"
	    GS.msg[7]= "\\M2* DECIDING NOT TO FIGHT YOU^1.&* MY MY^1, SHE REALLY IS THE&  ONLY SMART ONE^1, ISN\'T SHE?/%%"
	    con= 4
	    d= instance_create(0, 0, 779/* obj_dialoguer */)
	    d.side= 0
	}
	if(con == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	    mc= scr_marker(obj_mainchara.x, obj_mainchara.y, 1045)
	    mc.image_speed= 0.25
	    mc.velocity.x= 2
	    obj_mainchara.visible= 0
	    con= 5
	}
	if(con == 5 and mc.x >= mc.xstart + 20) {
	    mc.velocity.x= 0
	    mc.image_speed= 0
	    mc.frame= 0
	    con= 6
	    $Alarm4.start((45) / 30.0)
	}
	if(con == 7) {
	    GS.msg[0]= "\\M0* OH^1?&* HOW SASSY./"
	    GS.msg[1]= "\\M4* YOU\'RE JUST ITCHING TO GET&  YOUR HANDS ON ME^1, AREN\'T&  YOU?/"
	    GS.msg[2]= "\\M5* WELL..^1. T-O-O B-A-D!/"
	    GS.msg[3]= "\\M4* THIS WORLD NEEDS STARS MORE&  THAN IT NEEDS CORPSES!/"
	    GS.msg[4]= "\\M1* TOODLES!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 8
	}
	if(con == 8 and not instance_exists(782/* OBJ_WRITER */)) {
	    mett.velocity.x= 8
	    con= 9
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 10) {
	    view_xview[0]-= 2
	    if(view_xview[0] <= nowx + 20) con= 11
	}
	if(con == 11) {
	    obj_mainchara.x= mc.x
	    obj_mainchara.visible= 1
	    obj_mainchara.cutscene= 0
	    with(mc) instance_destroy()
	    GS.interact= 0
	    GS.flag[367]= 1
	    GS.flag[368]= 1
	    GS.flag[369]= 99
	    GS.flag[371]= 1
	    GS.flag[374]= 1
	    GS.flag[375]= 1
	    GS.flag[399]= 1
	    GS.flag[400]= 1
	    GS.flag[417]= 1
	    GS.flag[418]= 1
	    GS.plot= 160
	    con= 12
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(con == 0 and GS.interact == 0) {
	    con= 1
	    GS.interact= 1
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
