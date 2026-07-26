# Auto-converted from GameMaker: obj_torieltrigger6
extends Node2D

func _ready():
	scale.x= 50
	conversation= 0
	if(GS.plot > 17) instance_destroy()
	else  {
	    GS.typer= 4
	    GS.interact= 1
	    GS.facechoice= 1
	    GS.faceemotion= 0
	    GS.msc= 0
	    $Alarm0.start((1) / 30.0)
	    GS.msg[0]= "* Do you smell that^1?/"
	    GS.msg[1]= "* Surprise!/"
	    GS.msg[2]= "* It is a butterscotch-&  cinnamon pie./"
	    GS.msg[3]= "* I thought we might&  celebrate your&  arrival./"
	    GS.msg[4]= "* I want you to have&  a nice time living&  here./"
	    GS.msg[5]= "* So I will hold off&  on snail pie for&  tonight./"
	    GS.msg[6]= "* Here^1, I have another&  surprise for you./%%"
	    if(GS.flag[6] == 1) {
	        GS.msg[0]= "* Do you smell that^1?/"
	        GS.msg[1]= "\\E1* Er^1, I assume that&  expression means you&  do./"
	        GS.msg[2]= "\\E0* S..^1. surprise!/"
	        GS.msg[3]= "* I have baked a snail&  pie./"
	        GS.msg[4]= "* I thought we might&  celebrate your&  arrival./"
	        GS.msg[5]= "* I want you to have&  a nice time living&  here./"
	        GS.msg[6]= "\\E1* So I.../"
	        GS.msg[7]= "\\E0* Here^1, I have another&  surprise for you./%%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 1
	}
	volume= 1
	fademusicout= 0

func _on_destroy():
	toriel= instance_create(140, 120, 861/* obj_toroverworld3 */)

func _process(delta: float):
	if(conversation == 1 and not instance_exists(779/* obj_dialoguer */)) {
	    GS.interact= 0
	    conversation= 2
	    with(toriel) path_start(41/* path_walkright */, 4, 0, 0/* path_action_stop */)
	    GS.plot= 18
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
