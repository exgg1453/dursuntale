# Auto-converted from GameMaker: obj_barrierevent
extends Node2D

func _ready():
	con= 0
	asg= instance_create(130, 145, 1322/* obj_asgore_actor */)
	GS.interact= 1
	caster_free(-3)
	GS.currentsong= caster_load("music/barrier.ogg")
	caster_loop(GS.currentsong, 0.8, 0.8)
	if(GS.tempvalue[10] > 0) con= 10
	GS.facing= 2
	GS.border= 0
	SCR_BORDERSETUP()

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 0) {
	    con= 1
	    $Alarm4.start((180) / 30.0)
	}
	if(con == 1) {
	    GS.interact= 1
	    GS.facing= 2
	}
	if(con == 2) {
	    GS.msc= 762
	    GS.typer= 60
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    if(GS.flag[457] == 0) GS.msc= 762
	    else  GS.msc= 764
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 3
	}
	if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 11
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 11) GS.facing= 2
	if(con == 12) {
	    asg.sprite_index= asg.rsprite
	    con= 13
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 14) {
	    asg.sprite_index= asg.dtsprite
	    con= 15
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 16) {
	    GS.typer= 60
	    GS.facechoice= 7
	    GS.faceemotion= 1
	    GS.msc= 0
	    GS.msg[0]= "* Ready?/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 17
	}
	if(con == 17 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_free(-3)
	    snd_play(13/* snd_spearappear */)
	    h[0]= instance_create(60, 220, 1336/* obj_heartcontainer */)
	    h[0].image_blend= 32768
	    h[1]= instance_create(80, 220, 1336/* obj_heartcontainer */)
	    h[1].image_blend= 65535
	    h[2]= instance_create(100, 220, 1336/* obj_heartcontainer */)
	    h[2].image_blend= 4235519
	    h[3]= instance_create(120, 220, 1336/* obj_heartcontainer */)
	    h[4]= instance_create(200, 220, 1336/* obj_heartcontainer */)
	    h[4].image_blend= 8388736
	    h[5]= instance_create(220, 220, 1336/* obj_heartcontainer */)
	    h[5].image_blend= 16711680
	    h[6]= instance_create(240, 220, 1336/* obj_heartcontainer */)
	    h[6].image_blend= 16776960
	    con= 18
	    $Alarm4.start((150) / 30.0)
	}
	if(con == 19) {
	    GS.flag[15]= 0
	    GS.flag[16]= 1
	    caster_free(-3)
	    GS.battlegroup= 100
	    instance_create(0, 0, 142/* obj_battler */)
	    con= 20
	}
	if(con == 40 and not instance_exists(782/* OBJ_WRITER */)) {
	    instance_create(obj_mainchara.x, obj_mainchara.y + 15, 813/* obj_doorBmusicfade */)
	    con= 41
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
