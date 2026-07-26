# Auto-converted from GameMaker: obj_gameintro_fake
extends Node2D

func _ready():
	GS.interact= 0
	GS.facing= 0
	dongs= 0
	image_speed= 0
	intromusic= caster_load("music/story.ogg")
	stuck= caster_load("music/story_stuck.ogg")
	vol= 1
	caster_play(intromusic, 1, 0.91)
	GS.typer= 11
	GS.faceemotion= 0
	GS.facechoice= 0
	GS.msc= 0
	fadercreator= 0
	skip= 0
	GS.msg[0]= "Long ago^1, two races&ruled over Earth^1:&HUMANS and MONSTERS. \\E1 ^1 %"
	GS.msg[1]= "One day^1, th^7ey all&disappeared without&a trace."
	GS.msg[2]= "%%%"
	GS.msg[2]= "After a long battle^1,&the humans were&victorious^5. \\E1 ^1 %"
	GS.msg[3]= "They sealed the monsters&underground with a magic&spell^4. \\E0 ^1 %"
	GS.msg[4]= "Many years later^2.^2.^4.\\E1 ^1%"
	GS.msg[5]= "      MT. EBOTT&         201X^9 \\E0 %"
	GS.msg[6]= "Legends say that those&who climb the mountain&never return^5.^3 \\E1 %"
	GS.msg[7]= " \\E1 %"
	GS.msg[8]= " ^9 ^5 \\E0 %"
	GS.msg[9]= " ^9 ^5 ^2 \\E1 %"
	GS.msg[10]= " ^9 ^5 ^2 \\E2 %"
	GS.msg[11]= " ^9 ^9 ^9 ^9 ^9 ^9 \\E2 %%"
	GS.msg[12]= " ^9 ^9 ^9 ^9 ^9  \\E0 %%"
	GS.msg[13]= " ^9 ^9 ^9 ^9 ^9 ^9 \\E0 %"
	GS.msg[14]= " %%"
	GS.msg[15]= "%%%"
	mywriter= instance_create(40, 140, 1598/* obj_flowey_writer */)
	$Alarm0.start((200) / 30.0)
	skipper= 0

func _gm_event_2_2():
	skipper= 1

func _gm_event_2_1():
	room_goto_next()

func _on_destroy():
	sprite_index= 2269/* spr_fakeintro2 */
	obj_screen.messed= 3
	z_index= -99999
	caster_stop(-3)
	caster_loop(stuck, 1, 0.84)
	$Alarm1.start((170) / 30.0)
	$Alarm2.start((30) / 30.0)

func _process(delta: float):
	if(skipper == 1 and keyboard_multicheck_pressed(0/* NOKEY */))
	    room_goto_next()

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
