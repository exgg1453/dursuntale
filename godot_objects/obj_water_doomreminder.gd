# Auto-converted from GameMaker: obj_water_doomreminder
extends Node2D

func _ready():
	scale.x= 10
	go= 0
	if(scr_murderlv() == 10 and GS.flag[27] == 0 and GS.plot < 120)
	    go= 1
	else  instance_destroy()
	con= 0

func _process(delta: float):
	if(con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 0
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(GS.interact == 0) {
	    GS.interact= 1
	    con= 1
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    pop= 18 - GS.flag[204]
	    if(pop < 0) pop= 0
	    GS.msg[0]= "\\R* Strongly felt " + string(pop) + " left^1.&* Shouldn\'t proceed yet./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
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
