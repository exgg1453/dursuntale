# Auto-converted from GameMaker: obj_wrongnumbersong
extends Node2D

func _ready():
	con= 0
	if(GS.flag[7] == 1) instance_destroy()
	if(GS.flag[277] == 1) instance_destroy()
	if(GS.flag[5] >= 40) instance_destroy()
	if(GS.flag[5] <= 1) instance_destroy()
	if(GS.plot >= 120) instance_destroy()

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    con= 0.1
	    $Alarm4.start((30) / 30.0)
	    snd_play(104/* snd_phone */)
	}
	if(con == 1.1) {
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    caster_pause(GS.currentsong)
	    snd_play(104/* snd_phone */)
	    GS.msc= 0
	    GS.typer= 5
	    GS.msg[0]= "* (Ring... ring...)/"
	    GS.msg[1]= "* Hello^1!&* Can I speak to G.../"
	    GS.msg[2]= "* ...&* Wait a second./"
	    GS.msg[3]= "* Is this the wrong number?/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 2
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    wrns= caster_loop(413, 0.8, 1)
	    GS.msg[0]= "* Oh it\'s the wrong number^1!&* The wrong number song!/"
	    GS.msg[1]= "* We\'re very very sorry that&  we got it wrong!/"
	    GS.msg[2]= "* Oh it\'s the wrong number^1!&* The wrong number song!/"
	    GS.msg[3]= "* We\'re very very sorry that&  we got it wrong!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 3
	}
	if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_stop(wrns)
	    GS.msg[0]= "* (Click...)/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 4
	}
	if(con == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_resume(GS.currentsong)
	    con= 5
	    GS.flag[277]= 1
	    GS.interact= 0
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(GS.interact == 0 and con == 0) {
	    GS.interact= 1
	    con= 1
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
