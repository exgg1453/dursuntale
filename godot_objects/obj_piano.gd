# Auto-converted from GameMaker: obj_piano
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

func _on_destroy():
	myinteract= 3
	GS.msc= 660
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Come on! What are you doing!/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	scr_npc_anim()

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	draw_sprite(952/* spr_pxquit */, 0, 44, 27)
	draw_sprite(949/* spr_neutralpbutton */, 0, 43, 58)
	draw_sprite(948/* spr_leftpbutton */, 0, 54, 58)
	draw_sprite(947/* spr_downpbutton */, 0, 70, 55)
	draw_sprite(950/* spr_rightpbutton */, 0, 81, 58)
	draw_sprite(951/* spr_uppbutton */, 0, 97, 55)

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
