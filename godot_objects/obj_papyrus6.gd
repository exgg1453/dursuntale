# Auto-converted from GameMaker: obj_papyrus6
extends Node2D

func _ready():
	scale.y= 999
	conversation= 0
	if(scr_murderlv() >= 4 and GS.flag[27] == 0) {
	    GS.flag[62]= 1
	    instance_destroy()
	    exit
	} else  {
	    if(GS.flag[62] > 0) instance_destroy()
	    else  {
	        papyrus= instance_create(450, 90, 1032/* obj_papyrus_actor */)
	        papyrus.sprite_index= papyrus.rtsprite
	    }
	    exit
	}

func _gm_event_2_4():
	conversation++

func _gm_event_2_1():
	if(conversation == 9) conversation= 10
	if(conversation == 11) conversation= 12
	if(conversation == 17) conversation= 18
	if(conversation == 24) conversation= 25

func _process(delta: float):
	if(conversation == 1) {
	    myinteract= 3
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 1
	    GS.interact= 1
	    conversation= 2
	}
	if(conversation == 2) {
	    papyrus.sprite_index= papyrus.ltsprite
	    papyrus.frame= 0
	    conversation= 3
	    xxblcon= instance_create(papyrus.x + 3, papyrus.y - 12, 1337/* obj_cosmeticblcon */)
	    $Alarm4.start((20) / 30.0)
	}
	if(conversation == 4) {
	    GS.msc= 240
	    GS.msg[0]= "HUMAN!/%%"
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 1
	    GS.interact= 1
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 6
	}
	if(conversation == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    papyrus.velocity.x= 4
	    papyrus.npcdir= 1
	    GS.interact= 0
	    conversation= 7
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(conversation == 0) {
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
