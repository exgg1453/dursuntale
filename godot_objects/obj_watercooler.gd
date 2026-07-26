# Auto-converted from GameMaker: obj_watercooler
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	height= 21 - GS.flag[440]
	bubx[0]= 4 + random(10)
	buby[0]= 5 + random(15)
	bubx[1]= 4 + random(10)
	buby[1]= 5 + random(15)
	bubx[2]= 4 + random(10)
	buby[2]= 5 + random(15)
	siner= 0
	w_con= 1
	w_timer= 0
	pour_index= 0
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
	havewater= 0
	scr_depth()
	w_active= 0
	madepud= 0
	event_user(2)

func _on_destroy():
	myinteract= 3
	if(havewater == 0) GS.msc= 625
	else  GS.msc= 627
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* (Error.)/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _gm_event_7_12():
	if(GS.flag[353] > 0) {
	    if(madepud == 0) {
	        pud= instance_create(170, 63, 1348/* obj_readable_room5 */)
	        pudspr= scr_marker(170, 60, 1869)
	        pudspr.z_index= 900000
	        madepud= 1
	    }
	    if(GS.flag[353] > 0) {
	        if(GS.flag[353] > 7) pudspr.frame= 1
	        if(GS.flag[353] > 15) pudspr.frame= 2
	        if(GS.flag[353] > 15 and GS.flag[7] == 1)
	            pudspr.frame= 3
	    }
	}

func _gm_event_7_11():
	if(havewater == 0) {
	    GS.flag[366]= 1
	    havewater= 1
	    // obj_mainchara
	    with(1570) {
	        dsprite= 1037
	        rsprite= 1035
	        usprite= 1036
	        lsprite= 1034
	    }
	} else  {
	    event_user(2)
	    GS.flag[366]= 0
	    havewater= 0
	    // obj_mainchara
	    with(1570) {
	        dsprite= 1043
	        rsprite= 1045
	        usprite= 1044
	        lsprite= 1046
	    }
	}

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	height= 21 - GS.flag[440]
	if(height > 0)
	    draw_sprite_part(1866, 0, 0, 23 - height, 19, height, x, y + 23 - height)
	if(height > 5) {
	    siner++
	    i= 0
	    while(i < 3) {
	        draw_point_color(x + bubx[i], y + buby[i], 16777215)
	        buby[i]-= 0.1 + random(0.3)
	        bubx[i]+= sin((siner + i * 2) / 3) * 0.25
	        if(buby[i] + y < y + 23 - height + 1) {
	            buby[i]= 20
	            bubx[i]= 4 + random(10)
	        }
	        i++
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
