# Auto-converted from GameMaker: obj_fearundynenpc1
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1353
	usprite= 1362
	lsprite= 1367
	rsprite= 1363
	dtsprite= 1353
	utsprite= 1362
	ltsprite= 1367
	rtsprite= 1363
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	w= 0

func _gm_event_2_4():
	w++

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* We\'re about to visit Snowdin&  for the first time./"
	GS.msg[1]= "* You just came from there^1,&  right?/"
	GS.msg[2]= "* How is it...?/%%"
	if(GS.plot > 105)
	    GS.msg[0]= "* You should go back to&  Snowdin./%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	scr_npc_anim()
	if(w == 1) {
	    $Alarm4.start((10) / 30.0)
	    w= 2
	}
	if(w == 3) {
	    w= 4
	    $Alarm4.start((30) / 30.0)
	}
	if(w == 5) {
	    velocity.x= -4
	    w= 6
	    $Alarm4.start((20) / 30.0)
	}
	if(w == 7) {
	    w= 8
	    velocity.x= 0
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
