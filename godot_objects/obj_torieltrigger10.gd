# Auto-converted from GameMaker: obj_torieltrigger10
extends Node2D

func _ready():
	scale.y= 100
	conversation= 0
	if(GS.plot > 22) instance_destroy()
	dingus= 0

func _process(delta: float):
	dingus++
	if(GS.plot == 22 and dingus == 2) instance_create(370, 90, 861/* obj_toroverworld3 */)
	if(conversation == 2 and not instance_exists(779/* obj_dialoguer */)) {
	    // obj_toroverworld3
	    with(861) path_start(41/* path_walkright */, 4, 0, 0/* path_action_stop */)
	    GS.plot= 23
	    GS.interact= 0
	    instance_destroy()
	}
	if(instance_exists(861/* obj_toroverworld3 */) and conversation == 1) {
	    GS.interact= 1
	    myinteract= 3
	    GS.typer= 4
	    GS.facechoice= 1
	    GS.faceemotion= 6
	    GS.msc= 0
	    GS.msg[0]= "* Every human that falls&  down here meets&  the same fate./"
	    GS.msg[1]= "* I have seen it&  again and again./"
	    GS.msg[2]= "* They come./"
	    GS.msg[3]= "* They leave./"
	    GS.msg[4]= "* They die./"
	    GS.msg[5]= "* You naive child..^1.&* If you leave the&  RUINS.../"
	    GS.msg[6]= "\\W* They..^1.&* \\RASGORE\\W..^1.&* Will kill you./"
	    GS.msg[7]= "* I am only protecting&  you^1, do you understand?/"
	    GS.msg[8]= "* ... go to your room./%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 2
	}

func _on_alarm_0_timeout():
	other.x= other.xprevious
	other.y= other.yprevious
	GS.interact= 1
	conversation= 1

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
