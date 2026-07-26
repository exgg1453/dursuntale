# Auto-converted from GameMaker: obj_stable
# GM parent: obj_readable
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
	open= 0
	scr_depth()
	mysolid= instance_create(214, 52, 2/* obj_solidsmall */)
	if(GS.flag[92] > 0) open= 1
	if(GS.flag[92] > 3) {
	    open= 2
	    with(mysolid) instance_destroy()
	}
	con= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.msg[0]= "error/%%"
	if(GS.flag[92] == 0) {
	    GS.msc= 593
	    GS.typer= 5
	}
	if(GS.flag[92] > 0) {
	    GS.msc= 595
	    if(GS.flag[92] == 2) GS.msc= 596
	    if(GS.flag[92] == 3) GS.msc= 597
	    GS.typer= 34
	}
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* test/%%"
	if(GS.flag[92] != 4) {
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    talkedto++
	} else  bibblybeebly= 349382

func _gm_event_7_12():
	con= 3
	GS.flag[92]= 4

func _gm_event_7_11():
	con= 1
	GS.flag[92]= 1

func _on_outside_room():
	draw_sprite(sprite_index, 0, x, y)
	if(open == 2) draw_sprite(sprite_index, 1, x, y)
	if(open == 1) {
	    dist= distance_to_object(1570)
	    if(dist < 20) {
	        disto= 10 / (dist + 1)
	        if(disto > 1) disto= 1
	        draw_sprite_part_ext(1569, 0, 0, 0, 40, 20, x + 10, y + 10, 1, 1, 16777215, disto)
	    }
	}
	if(con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 2
	    open= 1
	}
	if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 4
	    open= 2
	    snd_play(106/* snd_noise */)
	    with(mysolid) instance_destroy()
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
