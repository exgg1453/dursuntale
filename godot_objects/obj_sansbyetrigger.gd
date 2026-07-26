# Auto-converted from GameMaker: obj_sansbyetrigger
extends CharacterBody2D

func _ready():
	conversation= 0
	scale.y= 999

func _gm_event_2_2():
	GS.plot= 37
	caster_loop(GS.currentsong, 1, 0.95)
	if(scr_murderlv() >= 2) caster_set_pitch(GS.currentsong, 0.6)
	GS.interact= 0

func _process(delta: float):
	if(conversation == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(obj_mainchara.x > obj_sans_interactable1.x)
	        obj_sans_interactable1.velocity.x= -3
	    if(obj_mainchara.x < obj_sans_interactable1.x)
	        obj_sans_interactable1.velocity.x= 4
	    obj_sans_interactable1.image_speed= 0.25
	    $Alarm2.start((20) / 30.0)
	    conversation= 3
	}
	if(GS.plot == 37) instance_destroy()

func _on_alarm_0_timeout():
	caster_free(-3)
	GS.currentsong= caster_load("music/snowy.ogg")
	myinteract= 3
	GS.msc= 0
	GS.typer= 17
	GS.facechoice= 3
	GS.faceemotion= 0
	GS.interact= 1
	GS.msg[0]= "* actually^1, hey..^1.&* hate to bother ya^1, but&  can you do me a favor?/"
	GS.msg[1]= "* i was thinking..^1.&* my brother\'s been&  kind of down lately.../"
	GS.msg[2]= "* he\'s never seen a human&  before^1. and seeing you&  might just make his day./"
	GS.msg[3]= "* don\'t worry^1, he\'s not&  dangerous./"
	GS.msg[4]= "\\E1* even if he tries to be./"
	GS.msg[5]= "\\E0* thanks a million^1.&* i\'ll be up ahead./%%"
	if(scr_murderlv() >= 2) {
	    GS.msg[0]= "\\E0* well^1, i\'ll be straight-&  forward with you./"
	    GS.msg[1]= "\\E1* my brother\'d really&  like to see a human.../"
	    GS.msg[2]= "\\E2* so^1, y\'know^1, it\'d&  really help me out.../"
	    GS.msg[3]= "\\E1* if you kept pretending&  to be one./%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	conversation= 2

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
