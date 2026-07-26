# Auto-converted from GameMaker: obj_umbrellabox
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	if(GS.flag[85] == 1) frame= 1
	con= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 583
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* NO!/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(con == 99999) {
	    GS.interact= 1
	    obj_mainchara.x= 66
	    con= 1
	    GS.msg[0]= "* (The cavern is too narrow&  for an umbrella.)/%%"
	    scr_regulartext()
	}
	if(con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 0
	    con= 0
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
