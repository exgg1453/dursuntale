# Auto-converted from GameMaker: obj_damndummy
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
	scr_depth()
	con= 0
	if(GS.plot > 115 and room == 115) instance_destroy()
	float= 0
	offground= 0
	siner= 0

func _gm_event_2_3():
	if(visible == 0) visible= 1
	else  visible= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 591
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	object_index.talkedto++

func _gm_event_7_11():
	instance_create(x + 10, y + 32, 1084/* obj_waterpillar */)
	$Alarm3.start((6) / 30.0)

func _gm_event_7_10():
	float= 1

func _on_outside_room():
	if(float == 0)
	    draw_sprite(sprite_index, frame, x, y)
	if(float == 1) {
	    sinadd= 0
	    if(offground < 10) offground+= 2
	    else  float= 2
	}
	if(float == 2) {
	    sinadd= 4 * sin(siner / 6)
	    siner++
	}
	if(float == 1 or float == 2) {
	    if(sprite_index != 1128)
	        draw_sprite_stretched(1177, frame, x - sinadd / 2, y + 25 + offground, 20 + sinadd, 15)
	    else 
	        draw_sprite_stretched(1177, frame, x - sinadd / 2 - 2, y + 25 + offground, 20 + sinadd, 15)
	    draw_sprite_ext(sprite_index, frame, x, y - offground + sinadd, 1, 1, 0, 16777215, modulate.a)
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
