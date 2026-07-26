# Auto-converted from GameMaker: obj_forcedright
extends Node2D

func _ready():
	scale.x= 3
	t= 0
	if(room == 57 and scr_murderlv() >= 3) {
	    if(GS.flag[64] == 0) GS.flag[64]= 1
	    if(GS.plot <= 48) GS.plot= 49
	}

func _gm_event_2_2():
	if(t < 13) {
	    dog1.speed= 0
	    dog2.speed= 0
	}
	if(t == 7) t= 8
	if(t == 3) t= 4
	if(t == 2) {
	    t= 3
	    $Alarm2.start((20) / 30.0)
	}
	if(t == 11) t= 12
	if(t == 15) t= 16

func _on_destroy():
	GS.facing= 0
	obj_mainchara.velocity.x= 0
	obj_mainchara.frame= 0
	obj_mainchara.image_speed= 0
	t= 2
	dog1= instance_create(obj_mainchara.x - 34, get_viewport_rect().size.y - 40, 996/* obj_mandog_actor */)
	dog2= instance_create(obj_mainchara.x + 20, get_viewport_rect().size.y - 40, 997/* obj_womandog_actor */)
	dog1.velocity.y= -1
	dog2.velocity.y= -1
	$Alarm2.start((142) / 30.0)

func _process(delta: float):
	if(t == 1) {
	    obj_mainchara.image_speed= 0.25
	    if(vol > 0.06) {
	        vol-= 0.04
	        caster_set_volume(GS.currentsong, vol)
	    } else  {
	        vol= 0
	        caster_pause(GS.currentsong)
	    }
	}
	if(t == 4) {
	    dogmeander= caster_load("music/dogmeander.ogg")
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.interact= 1
	    GS.msg[0]= "* What\'s that smell^1?&* (Where\'s that smell?)/"
	    GS.msg[1]= "* If you\'re a smell^1...&* (... identify yoursmellf!)/%%"
	    t= 5
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(t == 5 and not instance_exists(779/* obj_dialoguer */)) {
	    caster_play(dogmeander, 1, 1.4)
	    t= 6
	    with(dog1) path_start(37/* path_mdog */, 4, 0, 0/* path_action_stop */)
	    with(dog2) path_start(36/* path_wdog */, 4, 0, 0/* path_action_stop */)
	}
	if(t == 6 and instance_exists(996/* obj_mandog_actor */) and dog1.path_position == 1) {
	    dog1.path_speed= 0
	    dog2.path_speed= 0
	    $Alarm2.start((30) / 30.0)
	    t= 7
	}
	if(t == 8) {
	    caster_free(dogmeander)
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* Hmmm..^1.&* Here\'s that weird smell.../"
	    GS.msg[1]= "* It makes me want to&  eliminate./"
	    GS.msg[2]= "* (... Eliminate YOU!)/%%"
	    t= 9
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(t == 9 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.battlegroup= 25
	    GS.flag[200]= 0
	    GS.mercy= 1
	    instance_create(0, 0, 142/* obj_battler */)
	    t= 10
	}
	if(GS.plot == 50 and t == 10) {
	    GS.interact= 1
	    if(GS.flag[53] == 1) {
	        GS.plot= 51
	        GS.interact= 0
	        with(dog1) instance_destroy()
	        with(dog2) instance_destroy()
	        instance_destroy()
	        exit
	    } else  {
	        $Alarm2.start((11) / 30.0)
	        t= 11
	    }
	}
	if(t == 11) GS.interact= 1
	if(GS.plot == 50 and t == 12) {
	    GS.mercy= 0
	    GS.interact= 1
	    if(GS.flag[53] == 0 or GS.flag[53] == 2) {
	        GS.msg[0]= "* Dogs can pet other dogs??^1?&* (A new world has opened&  up for us...)/"
	        GS.msg[1]= "* Thanks^1, weird puppy!/%%"
	        if(GS.flag[53] == 2) {
	            GS.msg[0]= "* Weird smells can bring&  good things..^1.&* (Friendly fun fetch!)/"
	            GS.msg[1]= "* Thanks^1, weird smell^1!&* (It sure was fun to&  " + chr(ord('"')) + "stick" + chr(ord('"')) + " together!)/%%"
	        }
	        t= 14
	        scr_regulartext()
	    }
	}
	if(t == 14 and not instance_exists(779/* obj_dialoguer */)) {
	    vol= 99
	    dog1.velocity.y= 4
	    dog2.velocity.y= 4
	    $Alarm2.start((40) / 30.0)
	    t= 15
	}
	if(t == 15 and vol < vol1) {
	    vol+= 0.03
	    caster_set_volume(GS.currentsong, vol)
	}
	if(t == 16) {
	    GS.interact= 0
	    GS.plot= 51
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(GS.plot < 50 and t == 0) {
	    if(instance_exists(1387/* obj_encountererparent */)) {
	        // obj_encountererparent
	        with(1387) steps+= 200
	        GS.encounter= 0
	    }
	    t= 1
	    GS.interact= 1
	    obj_mainchara.velocity.x= 3
	    obj_mainchara.image_speed= 0.25
	    $Alarm0.start((30) / 30.0)
	    vol= caster_get_volume(GS.currentsong)
	    vol1= vol
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
