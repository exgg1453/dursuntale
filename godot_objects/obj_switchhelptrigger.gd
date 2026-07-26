# Auto-converted from GameMaker: obj_switchhelptrigger
extends Node2D

func _ready():
	scale.y= 1
	scale.x= 100
	conversation= 0
	if(GS.flag[51] != 2) instance_destroy()

func _process(delta: float):
	if(conversation == 2 and not instance_exists(779/* obj_dialoguer */)) {
	    GS.interact= 0
	    GS.flag[51]++
	    instance_destroy()
	}
	if(conversation == 1) {
	    GS.interact= 1
	    myinteract= 3
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.msg[0]= "* (You noticed there was&  a blue switch behind the&  top pillar.)/%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 2
	}

func _on_alarm_0_timeout():
	if(GS.flag[51] == 2) {
	    other.x= other.xprevious
	    other.y= other.yprevious
	    GS.interact= 1
	    conversation= 1
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
