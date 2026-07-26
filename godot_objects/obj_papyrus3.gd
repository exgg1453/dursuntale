# Auto-converted from GameMaker: obj_papyrus3
extends CharacterBody2D

func _ready():
	if(GS.plot >= 46) instance_destroy()
	else  {
	    conversation= 0
	    scale.y= 999
	    sans= instance_create(240, 94, 1033/* obj_sans_actor */)
	    papyrus= instance_create(240, 120, 1032/* obj_papyrus_actor */)
	    papyrus.sprite_index= 1327/* spr_papyrus_ut */
	    sans.sprite_index= 1355/* spr_sans_dt */
	}
	look= 0
	spinagain= 0
	murder= 0
	if(scr_murderlv() >= 3) murder= 1

func _gm_event_2_2():
	GS.plot= 37
	caster_loop(GS.currentsong, 1, 0.95)
	GS.interact= 0

func _gm_event_2_1():
	if(conversation == 9) conversation= 10
	if(conversation == 11) conversation= 12
	if(conversation == 17) conversation= 18
	if(conversation == 24) conversation= 25

func _on_destroy():
	// obj_cosmeticblcon
	with(1337) instance_destroy()
	conversation= 4

func _process(delta: float):
	if(conversation == 1) {
	    fade= instance_create(0, 0, 92/* obj_musfadeout */)
	    fade.fadespeed= 0.5
	    GS.currentsong= caster_load("music/papyrus.ogg")
	    caster_loop(GS.currentsong, 0.6, 1)
	    myinteract= 3
	    GS.msc= 0
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 0
	    GS.interact= 1
	    papyrus.sprite_index= papyrus.ltsprite
	    sans.sprite_index= sans.ltsprite
	    GS.msg[0]= "HUMAN!!^1!&I HOPE YOU\'RE&READY FOR.../%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 2
	}
	if(conversation == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    conversation= 3
	    xxblcon= instance_create(papyrus.x + 3, papyrus.y - 12, 1337/* obj_cosmeticblcon */)
	    $Alarm0.start((45) / 30.0)
	}
	if(conversation == 4) {
	    GS.msc= 0
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 1
	    GS.interact= 1
	    papyrus.sprite_index= 1337/* spr_papyrus_lt_mad */
	    GS.msg[0]= "SANS!^1!&WHERE\'S THE&PUZZLE!!!/"
	    scr_sansface(1, 0)
	    GS.msg[2]= "* it\'s right there^1.&* on the ground./"
	    GS.msg[3]= "\\E1* trust me^1.&* there\'s no way they can&  get past this one./%%"
	    if(murder == 1)
	        GS.msg[3]= "\\E1* trust me^1.&* there\'s no way they\'ll&  skip this one./%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 6
	}
	if(conversation == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    instance_create(10, 0, 1008/* obj_puzzlewall2 */)
	    papyrus.sprite_index= papyrus.ltsprite
	    sans.sprite_index= sans.ltsprite
	    obj_mainchara.cutscene= 1
	    view_object[0]= -4
	    conversation= 7
	    x= 220
	    GS.interact= 0
	    solid= 0
	}
	if(conversation == 8 and not instance_exists(782/* OBJ_WRITER */))
	    conversation= 22
	if(conversation == 22) {
	    GS.interact= 1
	    GS.msc= 228
	    GS.faceemotion= 1
	    GS.facechoice= 4
	    GS.typer= 19
	    if(murder == 1) {
	        GS.msc= 0
	        if(GS.flag[254] == 1) {
	            GS.msg[0]= "WHAT THE HECK!!^1!&THEY DIDN\'T SKIP&IT!?!?/"
	            scr_sansface(1, 2)
	            GS.msg[2]= "* i\'m tellin\' ya^1.&* everyone likes word&  searches./"
	            scr_papface(3, 4)
	            GS.msg[4]= "OH MY GOD!!!/"
	            GS.msg[5]= "I CAN\'T WORK IN&THIS ENVIRONMENT!!/%%"
	        } else  {
	            GS.msg[0]= "SANS!!^1!&THAT DID NOTHING!!!/"
	            scr_sansface(1, 1)
	            GS.msg[2]= "* whoops./"
	            GS.msg[3]= "\\E2* knew i should have&  put down junior jumble&  instead./"
	            scr_papface(4, 4)
	            GS.msg[5]= "WHAT?!^1?&JUNIOR JUMBLE!?/"
	            GS.msg[6]= "\\E0FINALLY^1, SOMETHING&WE CAN BOTH&AGREE ON./%%"
	        }
	    }
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 23
	}
	if(conversation == 23 and not instance_exists(782/* OBJ_WRITER */)) {
	    papyrus.velocity.x= 5
	    papyrus.fun= 1
	    papyrus.sprite_index= papyrus.rsprite
	    papyrus.image_speed= 0.25
	    hhh= instance_create(0, 0, 92/* obj_musfadeout */)
	    hhh.fadespeed= 0.05
	    $Alarm1.start((30) / 30.0)
	    conversation= 24
	}
	if(conversation == 25) {
	    GS.currentsong= caster_load("music/snowy.ogg")
	    caster_loop(GS.currentsong, 1, 0.95)
	    GS.plot= 47
	    GS.interact= 0
	    if(instance_exists(1008/* obj_puzzlewall2 */)) {
	        // obj_puzzlewall2
	        with(1008) instance_destroy()
	    }
	    instance_create(sans.x, sans.y, 1022/* obj_sans_room */)
	    with(sans) instance_destroy()
	    with(papyrus) instance_destroy()
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(conversation == 0) conversation= 1
	if(conversation == 7) conversation= 8
	if(conversation == 21) conversation= 22

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
