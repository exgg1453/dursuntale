# Auto-converted from GameMaker: obj_assortedtrash
# GM parent: obj_readablesolid
extends Node2D

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
	con= 0
	if(y > 420) sprite_index= 1619/* spr_watercomputer */
	if(y > 500) sprite_index= 1475/* spr_rustbike */
	con= 0
	scr_depth()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(y > 540) {
	    GS.msg[0]= "* (You rest your hand on&  the rusted bike.^1)/"
	    GS.msg[1]= "* (Its horn wheezes a honk&  of despair.)/%%"
	    con= 1
	}
	if(y < 500 and y > 420)
	    GS.msg[0]= "* (A beat-up desktop computer.^1)&* (The inside is empty.)/%%"
	if(y < 340 and y > 280) {
	    GS.msg[0]= "* (It\'s a DVD case for an&  anime.)/"
	    GS.msg[1]= "* (Desperate claw marks cover&  the edges.)/%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	object_index.talkedto++

func _process_end(delta: float):
	scr_depth()
	if(con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(48/* snd_slidewhist */)
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
