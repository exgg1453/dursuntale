# Auto-converted from GameMaker: obj_puzzlewall1
extends CharacterBody2D

func _ready():
	talkedto= 0
	conversation= 0
	scale.y= 999

func _process(delta: float):
	if(conversation == 1) {
	    obj_mainchara.x+= 4
	    GS.facing= 1
	    GS.msc= 0
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 0
	    GS.interact= 1
	    GS.msg[0]= "COME ON!&DON\'T BE SO&RUDE!!!/"
	    GS.msg[1]= "I SET UP&THIS PUZZLE&JUST FOR YOU!/%%"
	    if(talkedto == 1) {
	        GS.msg[0]= "\\E3DO YOU TREAT&YOUR MOTHER&THIS WAY.../"
	        GS.msg[1]= "WHEN SHE MAKES&YOU A PUZZLE&?!?!?/%%"
	    }
	    if(talkedto > 1) GS.msg[0]= "\\E3HUMANS.../%%"
	    talkedto++
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 2
	}
	if(conversation == 2) GS.facing= 1
	if(conversation == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 0
	    conversation= 0
	}

func _on_alarm_0_timeout():
	if(conversation == 0) conversation= 1

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
