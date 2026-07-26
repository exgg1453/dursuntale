# Auto-converted from GameMaker: obj_papyrus5
extends Node2D

func _ready():
	xplot= 55
	if(GS.plot >= xplot) instance_destroy()
	else  {
	    conversation= 0
	    scale.y= 999
	    if(GS.plot >= xplot - 1) {
	        papyrus= instance_create(300, 60, 1026/* obj_papyrus_room */)
	        conversation= 7
	    } else  papyrus= instance_create(100, 60, 1026/* obj_papyrus_room */)
	    papyrus.sprite_index= 1316/* spr_papyrus_dt */
	    obj_mainchara.cutscene= 1
	}

func _gm_event_2_4():
	conversation++

func _gm_event_2_2():
	GS.plot= 37
	caster_loop(GS.currentsong, 1, 0.95)
	GS.interact= 0

func _gm_event_2_1():
	if(conversation == 9) conversation= 10
	if(conversation == 11) conversation= 12
	if(conversation == 17) conversation= 18
	if(conversation == 24) conversation= 25

func _process_end(delta: float):
	if(instance_exists(1570/* obj_mainchara */) and obj_mainchara.cutscene == 1) {
	    o= 1570
	    if(obj_mainchara.x >= 450) view_object[0]= -4
	    if(obj_mainchara.x < 450) {
	        view_object[0]= 1570
	        view_xview[0]= round(o.x - view_wview[0] / 2 + o.sprite_width / 2)
	        view_yview[0]= round(o.y - view_hview[0] / 2 + o.sprite_height / 2)
	    }
	}

func _process(delta: float):
	if(conversation == 1 and GS.interact == 0) {
	    myinteract= 3
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 1
	    GS.interact= 1
	    p2= instance_create(papyrus.x, papyrus.y, 1032/* obj_papyrus_actor */)
	    with(papyrus) instance_destroy()
	    papyrus= p2
	    papyrus.velocity.x= 3
	    papyrus.sprite_index= papyrus.rsprite
	    conversation= 2
	    GS.plot= xplot - 1
	}
	if(conversation == 2 and instance_exists(1032/* obj_papyrus_actor */) and papyrus.x >= x - 56) {
	    papyrus.velocity.x= 0
	    papyrus.sprite_index= papyrus.rtsprite
	    papyrus.frame= 0
	    conversation= 3
	    $Alarm4.start((20) / 30.0)
	}
	if(conversation == 4) {
	    GS.msc= 0
	    GS.msg[0]= "HUMAN!/"
	    GS.msg[1]= "\\E3HMMM..^1.&HOW DO I SAY&THIS.../"
	    GS.msg[2]= "\\E0YOU WERE TAKING A&LONG TIME TO&ARRIVE^1, SO.../"
	    GS.msg[3]= "I DECIDED TO&IMPROVE THIS&PUZZLE.../"
	    GS.msg[4]= "BY ARRANGING THE&SNOW TO LOOK MORE&LIKE MY FACE./"
	    GS.msg[5]= "\\E3UNFORTUNATELY^1,&THE SNOW FROZE&TO THE GROUND./"
	    GS.msg[6]= "\\E1NOW THE SOLUTION&IS DIFFERENT!/"
	    GS.msg[7]= "AND^1,AS USUAL^1, MY&LAZY BROTHER IS&NOWHERE AROUND./"
	    GS.msg[8]= "\\E3I SUPPOSE WHAT&I AM SAYING&IS.../"
	    GS.msg[9]= "\\E0WORRY NOT^1, HUMAN!/"
	    GS.msg[10]= "I^1, THE GREAT&PAPYRUS^1, WILL SOLVE&THIS CONUNDRUM!/"
	    GS.msg[11]= "THEN WE CAN BOTH&PROCEED!/"
	    GS.msg[12]= "MEANWHILE^1, FEEL&FREE TO TRY THE&PUZZLE YOURSELF!/"
	    GS.msg[13]= "I\'LL TRY NOT TO&GIVE AWAY THE&ANSWER!!!/%%"
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 1
	    GS.interact= 1
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 5
	}
	if(conversation == 5 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno >= 9) {
	    papyrus.fun= 1
	    papyrus.image_speed= 0.5
	    papyrus.sprite_index= 1310/* spr_papyrus_cape */
	    conversation= 5.1
	}
	if(conversation == 5.1 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno >= 12) {
	    papyrus.fun= 0
	    papyrus.sprite_index= papyrus.dtsprite
	    conversation= 6
	}
	if(conversation == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    p3= instance_create(papyrus.x, papyrus.y, 1026/* obj_papyrus_room */)
	    with(papyrus) instance_destroy()
	    papyrus= p3
	    GS.interact= 0
	    conversation= 7
	}
	if(conversation == 7 and obj_mainchara.x > 400 and papyrus.x < 300)
	    papyrus.x+= 4
	if(conversation == 9) {
	    GS.interact= 1
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 0
	    conversation= 10
	    $Alarm4.start((20) / 30.0)
	}
	if(conversation == 11) {
	    GS.msc= 0
	    instance_create(20, 100, 1339/* obj_stalkerflowey */)
	    GS.msg[0]= "WOW!!^1!&YOU SOLVED IT!!/"
	    if(papyrus.talkedto == 0)
	        GS.msg[1]= "AND YOU DID IT&ALL WITHOUT MY&HELP.../"
	    else  GS.msg[1]= "MY ADVICE HELPED^1!&IT REALLY HELPED&YOU!!/"
	    p4= instance_create(papyrus.x, papyrus.y, 1032/* obj_papyrus_actor */)
	    with(papyrus) instance_destroy()
	    papyrus= p4
	    papyrus.sprite_index= papyrus.dtsprite
	    GS.msg[2]= "INCREDIBLE^1!&I\'M IMPRESSED!!/"
	    GS.msg[3]= "YOU MUST CARE&ABOUT PUZZLES&LIKE I DO!/"
	    GS.msg[4]= "WELL^1, I\'M SURE&YOU\'LL LOVE THE&NEXT PUZZLE THEN!/"
	    GS.msg[5]= "IT MIGHT EVEN&BE TOO EASY FOR&YOU!!/"
	    GS.msg[6]= "NYEH^1!&HEH HEH^1!&HEHEHEH!!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 12
	}
	if(conversation == 12 and not instance_exists(782/* OBJ_WRITER */)) {
	    papyrus.npcdir= 1
	    with(papyrus) path_start(30/* path_papyrus2 */, 5, 0, 0/* path_action_stop */)
	    $Alarm4.start((60) / 30.0)
	    conversation= 13
	}
	if(conversation == 14) {
	    instance_destroy()
	    GS.interact= 0
	}

func _on_alarm_0_timeout():
	if(conversation == 0 and GS.interact == 0) {
	    conversation= 1
	    other.x= other.xprevious
	    other.y= other.yprevious
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
