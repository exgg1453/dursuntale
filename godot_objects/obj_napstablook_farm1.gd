# Auto-converted from GameMaker: obj_napstablook_farm1
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1129
	usprite= 1131
	lsprite= 1126
	rsprite= 1127
	dtsprite= 1129
	utsprite= 1131
	ltsprite= 1126
	rtsprite= 1127
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	fun= 0
	if(GS.flag[7] == 1) instance_destroy()
	if(scr_murderlv() >= 10) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* awkward..^1.&* i\'m working right now.../"
	GS.msg[1]= "* i mean.../"
	GS.msg[2]= "* welcome to blook family&  snail farm.../"
	GS.msg[3]= "* ... yeah^1.&* i\'m the only employee./"
	GS.msg[4]= "* this place used to get a lot&  of business.../"
	GS.msg[5]= "* but our main customer&  disappeared one day.../"
	GS.msg[6]= "* now it\'s just some hairy&  guy that shows up once&  a month.../%%"
	if(talkedto > 0) {
	    GS.msg[0]= "* really^1, i\'m working..^1.&* i don\'t want the boss&  to get mad at me.../"
	    GS.msg[1]= "* especially since i\'m my&  own boss.../%%"
	}
	if(GS.flag[350] == 1) {
	    GS.msg[0]= "* hmmm..^1. i should probably&  try to make friends&  with my neighbor/"
	    GS.msg[1]= "* she\'s kind of scary^1, but&  i feel like i\'m always&  too late to make friends.../"
	    GS.msg[2]= "* i should at least try.../%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	scr_npc_anim()
	script_execute(106/* scr_npcdir */, 2)
	modulate.a= 0
	if(instance_exists(1570/* obj_mainchara */)) {
	    dist= distance_to_object(1570)
	    if(dist < 60) {
	        disto= 5 / (dist + 2)
	        if(disto > 1) disto= 1
	        modulate.a= disto
	    }
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
