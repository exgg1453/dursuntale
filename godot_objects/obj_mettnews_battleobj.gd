# Auto-converted from GameMaker: obj_mettnews_battleobj
# GM parent: obj_readable
extends Node2D

func _ready():
	$Alarm9.start((1) / 30.0)
	bombtype= 1
	image_speed= 0.1
	myinteract= 0
	con= 0
	scr_depth()
	tangible= 1
	siner= 0
	cc= 0
	watercancel= 0
	b_buffer= 0

func _gm_event_2_9():
	if(bombtype == 1) sprite_index= 1517/* spr_tobdog_sleep_fire */
	if(bombtype == 2) sprite_index= 1774/* spr_glassofwater */
	if(bombtype == 3) sprite_index= 1768/* spr_script */
	if(bombtype == 4) sprite_index= 1777/* spr_basketball_bomb */
	if(bombtype == 5) sprite_index= 1772/* spr_regpresent */
	if(bombtype == 6) sprite_index= 1770/* spr_videogame */

func _gm_event_2_4():
	con++

func _process(delta: float):
	b_buffer= 0
	if(myinteract == 1 and GS.interact == 0 and tangible == 1 and con == 0) {
	    GS.interact= 1
	    con= 1
	    myinteract= 0
	}
	if(con == 1) {
	    // obj_mettnews_battleobj
	    with(1225) b_buffer= 50
	    con= 2
	    $Alarm4.start((33) / 30.0)
	    GS.flag[15]= 1
	    GS.battlegroup= 69 + bombtype
	    instance_create(0, 0, 142/* obj_battler */)
	}
	if(con == 3) {
	    con= 4
	    $Alarm4.start((12) / 30.0)
	}
	if(con == 4) {
	    visible= 0
	    GS.interact= 1
	}
	if(con == 5) {
	    con= 90
	    GS.flag[15]= 0
	    GS.flag[395]++
	    anti= 0
	    if(instance_exists(1226/* obj_doomtimer */) and obj_doomtimer.dx >= 120)
	        anti= 1
	    if(obj_mettnewsevent.failure == 1) anti= 1
	    if(GS.flag[395] == 1 and anti == 0) con= 7
	    if(GS.flag[395] == 5 and anti == 0) con= 60
	    if(GS.flag[395] == 6) obj_mettnewsevent.con= 160
	}
	if(con == 7) {
	    GS.facechoice= 6
	    GS.faceemotion= 6
	    GS.typer= 47
	    GS.msg[0]= "* Error./%%"
	    GS.msc= 0
	    if(bombtype == 1 or bombtype == 2 or bombtype == 4) {
	        GS.msg[0]= "* Great job^1!&* Keep heading around the&  room!/"
	        GS.msg[1]= "* Try to go for the&  one in the bottom-&  left next!/%%"
	    }
	    if(bombtype == 3) {
	        GS.msg[0]= "* Great job^1!&* Keep heading around the&  room!/"
	        GS.msg[1]= "* Try to go for the&  one in the top-&  right next!/%%"
	    }
	    if(bombtype == 5)
	        GS.msg[0]= "* Great job^1!&* Head to the left&  next!/%%"
	    if(bombtype == 6)
	        GS.msg[0]= "* Great job^1!&* Head to the right&  next!/%%"
	    if(GS.flag[288] == 1) {
	        GS.faceemotion= 1
	        GS.msg[0]= "* You couldn\'t even&  get one bomb...!?/%%"
	    }
	    con= 90
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 60) {
	    obj_mettnews_battleobj.watercancel= 1
	    GS.facechoice= 6
	    GS.faceemotion= 6
	    GS.typer= 47
	    ex= 0
	    if(ex == 0) GS.msc= 0
	    if(instance_exists(obj_mettnewsevent.newdog) and bombtype != 1)
	        ex= 1
	    if(instance_exists(obj_mettnewsevent.newwater) and bombtype != 2)
	        ex= 2
	    if(instance_exists(obj_mettnewsevent.newscript) and bombtype != 3)
	        ex= 3
	    if(instance_exists(obj_mettnewsevent.newbasketball) and bombtype != 4)
	        ex= 4
	    if(instance_exists(obj_mettnewsevent.newpresent) and bombtype != 5)
	        ex= 5
	    if(instance_exists(obj_mettnewsevent.newgame) and bombtype != 6)
	        ex= 6
	    GS.msg[0]= "* Error,/%%"
	    if(ex == 1)
	        GS.msg[0]= "* Great job^1!&* Head for the center^1!&* There\'s one left there!/%%"
	    if(ex == 2) {
	        GS.msg[0]= "* Great job^1!&* Head for the center!/"
	        GS.msg[1]= "* I\'m using^1, uh^1, EM fields&  to trap the glass of&  water there!/%%"
	    }
	    if(ex == 3)
	        GS.msg[0]= "* Great job^1!&* There\'s only one left&  in the bottom-right!/%%"
	    if(ex == 4)
	        GS.msg[0]= "* Great job^1!&* There\'s only one left&  at the top!/%%"
	    if(ex == 5)
	        GS.msg[0]= "* Great job^1!&* There\'s only one left&  at the top-right!/%%"
	    if(ex == 6)
	        GS.msg[0]= "* Great job^1!&* There\'s only one left&  at the bottom-left!/%%"
	    if(GS.flag[288] == 1) {
	        GS.faceemotion= 1
	        GS.msg[0]= "* It\'s..^1. it\'s.../%%"
	    }
	    con= 90
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 90 and not instance_exists(782/* OBJ_WRITER */)) {
	    // obj_mettnews_battleobj
	    with(1225) b_buffer= 6
	    GS.interact= 0
	    instance_destroy()
	}
	if(bombtype == 2) {
	    if(cc == 0) {
	        cc= 1
	        path_start(35/* path_waterglass */, 8, 1, 0/* path_action_stop */)
	    }
	    if(watercancel == 1) {
	        path_end()
	        if(distance_to_point(360, 300) > 20) move_towards_point(360, 300, 5)
	        else  speed= 0
	    }
	}
	if(bombtype == 3) {
	    if(cc == 0) {
	        velocity.x= 5
	        cc= 1
	    }
	    if(x < xstart - 80) velocity.x= 5
	    if(x > xstart) velocity.x= -5
	}
	if(bombtype == 4) {
	    if(cc == 0) {
	        cc= 1
	        velocity.x= 6
	    }
	    if(x < xstart - 80) velocity.x= 5
	    if(x > xstart + 80) velocity.x= -5
	    siner++
	    ypl= sin(siner / 4) * 6
	    y+= ypl
	    tangible= 1
	}

func _on_alarm_0_timeout():
	if(GS.interact == 0 and tangible == 1 and b_buffer <= 0)
	    myinteract= 1

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
