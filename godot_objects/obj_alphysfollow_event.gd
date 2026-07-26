# Auto-converted from GameMaker: obj_alphysfollow_event
extends Node2D

func _ready():
	GS.flag[16]= 0
	con= 1
	if(GS.plot > 198) instance_destroy()
	follow= 0
	nowx= 9999

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1 and GS.interact == 0 and obj_mainchara.x > 400) {
	    al= instance_create(view_xview[0] - 40, obj_mainchara.ystart, 1170/* obj_alphys_npc */)
	    al.mask_index= 1644
	    al.fun= 1
	    al.image_speed= 0.2
	    al.sprite_index= al.rsprite
	    al.velocity.x= 2
	    con= 2
	    $Alarm4.start((50) / 30.0)
	    GS.interact= 1
	}
	if(con == 3) {
	    al.speed= 0
	    al.image_speed= 0
	    con= 4
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 5) {
	    GS.flag[430]= 1
	    GS.msc= 0
	    GS.typer= 47
	    GS.facechoice= 6
	    GS.faceemotion= 6
	    GS.msg[0]= "* S..^1. Sorry about&  that!/"
	    GS.msg[1]= "\\E5* L-let\'s k-keep&  going!/%%"
	    con= 6
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 0
	    con= 7
	    follow= 1
	    nowx= obj_mainchara.x
	    nowax= obj_mainchara.x - al.x
	}
	if(follow == 1) {
	    if(al.x <= obj_mainchara.x - nowax) {
	        al.x= obj_mainchara.x - nowax
	        al.image_speed= obj_mainchara.image_speed
	    } else  al.image_speed= 0
	    if(obj_mainchara.x > 1050) {
	        follow= 0
	        al.image_speed= 0
	    }
	}
	if(con == 7 and obj_mainchara.x > nowx + 200 and GS.interact == 0) {
	    GS.interact= 1
	    GS.flag[430]= 1
	    GS.msc= 0
	    GS.typer= 47
	    GS.faceemotion= 5
	    GS.facechoice= 6
	    GS.msg[0]= "* S-so you\'re about&  to meet ASGORE^1,&  h-huh?/"
	    GS.msg[1]= "\\E6* You must be..^1.&* Y-you must be.../"
	    GS.msg[2]= "\\E5* Pr..^1. pretty&  excited about all&  that^1, huh?/%%"
	    con= 8
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 8 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 0
	    con= 9
	    follow= 1
	    nowx= obj_mainchara.x
	    nowax= obj_mainchara.x - al.x
	}
	if(con == 9 and obj_mainchara.x > nowx + 200 and GS.interact == 0) {
	    GS.interact= 1
	    GS.flag[430]= 1
	    GS.msc= 0
	    GS.typer= 47
	    GS.faceemotion= 4
	    GS.facechoice= 6
	    GS.msg[0]= "* You\'ll f-f-finally.../"
	    GS.msg[1]= "\\E7* You\'ll finally get&  to go home!/%%"
	    con= 10
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 0
	    con= 11
	    follow= 1
	    nowx= obj_mainchara.x
	    nowax= obj_mainchara.x - al.x
	}
	if(con == 50) {
	    con= 51
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 52) {
	    GS.interact= 1
	    GS.flag[430]= 1
	    GS.msc= 0
	    GS.typer= 47
	    GS.faceemotion= 0
	    GS.facechoice= 6
	    GS.msg[0]= "* W..^1.&* Wait!/%%"
	    obj_alphys_npc.sprite_index= 1645/* spr_alphys_r_sad */
	    con= 53
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 53 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.facing= 3
	    con= 54
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 55) {
	    obj_alphys_npc.sprite_index= 1643/* spr_alphys_r */
	    GS.interact= 1
	    GS.flag[430]= 2
	    GS.msc= 0
	    GS.typer= 47
	    GS.faceemotion= 1
	    GS.facechoice= 6
	    GS.msg[0]= "* I mean^1, um..^1.&* I.../"
	    GS.msg[1]= "\\E1* I was just going&  to..^1.&* ...um.../"
	    GS.msg[2]= "\\E2* Say goodbye^1, and.../"
	    GS.msg[3]= "* .../"
	    GS.msg[4]= "\\E3* .../"
	    GS.msg[5]= "\\E4* .../"
	    GS.msg[6]= "* I can\'t take&  this anymore./%%"
	    con= 56
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 56 and not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 6)
	    al.sprite_index= al.usprite
	if(con == 56 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_alphys_npc.sprite_index= 1647/* spr_alphys_l_sad2 */
	    con= 57
	    $Alarm4.start((45) / 30.0)
	}
	if(con == 58) {
	    GS.interact= 1
	    GS.flag[430]= 2
	    GS.msc= 0
	    GS.typer= 47
	    GS.faceemotion= 6
	    GS.facechoice= 6
	    GS.msg[0]= "* I.../"
	    GS.msg[1]= "\\E5* I lied to you./"
	    GS.msg[2]= "\\E7* A human SOUL isn\'t&  strong enough to&  cross the barrier alone./"
	    GS.msg[3]= "\\E6* It takes at least&  a human soul.../"
	    GS.msg[4]= "\\E5* And a monster&  soul./"
	    GS.msg[5]= "\\E5* .../%%"
	    obj_alphys_npc.sprite_index= 1647/* spr_alphys_l_sad2 */
	    con= 59
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 59 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 60
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 61) {
	    al.sprite_index= 1646/* spr_alphys_r_sad2 */
	    con= 62
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 63) {
	    GS.interact= 1
	    GS.flag[430]= 2
	    GS.msc= 0
	    GS.typer= 47
	    GS.faceemotion= 6
	    GS.facechoice= 6
	    GS.msg[0]= "* If you want to&  go home.../"
	    GS.msg[1]= "\\E5* You\'ll have to&  take his soul./"
	    GS.msg[2]= "\\E7* You\'ll have to&  kill ASGORE./%%"
	    obj_alphys_npc.sprite_index= 1646/* spr_alphys_r_sad2 */
	    con= 64
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 64 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 65
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 66 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_alphys_npc.sprite_index= 1647/* spr_alphys_l_sad2 */
	    follow= 0
	    al.image_speed= 0.2
	    al.velocity.x= -1
	    con= 67
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 68) {
	    al.image_speed= 0
	    al.speed= 0
	    con= 68.1
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 69.1) con= 69
	if(con == 69) {
	    GS.interact= 1
	    GS.flag[430]= 2
	    GS.msc= 0
	    GS.typer= 47
	    GS.faceemotion= 7
	    GS.facechoice= 6
	    GS.msg[0]= "* I\'m sorry./%%"
	    obj_alphys_npc.sprite_index= 1647/* spr_alphys_l_sad2 */
	    con= 70
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 70 and not instance_exists(782/* OBJ_WRITER */)) {
	    al.velocity.x= -4
	    al.image_speed= 0.3334
	    GS.facing= 2
	    con= 71
	    follow= 0
	    GS.interact= 0
	    GS.flag[492]= 1
	    GS.plot= 199
	    instance_destroy()
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
