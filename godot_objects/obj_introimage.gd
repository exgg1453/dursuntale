# Auto-converted from GameMaker: obj_introimage
extends Node2D

func _ready():
	skip= 0
	act= 0
	$Alarm2.start((4) / 30.0)
	intromusic= caster_load("music/story.ogg")
	image_speed= 0
	visible= 0

func _gm_event_2_2():
	visible= 1
	act= 1
	dongs= 0
	image_speed= 0
	vol= 1
	caster_play(intromusic, 1, 0.91)
	GS.typer= 11
	GS.faceemotion= 0
	GS.facechoice= 0
	GS.msc= 0
	_spawn("obj_introtangle", 0, 0)
	fadercreator= 0
	skip= 0
	GS.msg[0]= "Long ago^1, two races&ruled over Earth^1:&HUMANS and MONSTERS^5. \\E1 ^1 %"
	GS.msg[1]= "One day^1, war broke&out between the two&races^5. \\E0 ^1 %"
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
	mywriter= _spawn("OBJ_WRITER", 40, 140)
	$Alarm0.start((5) / 30.0)

func _gm_event_2_1():
	caster_stop(intromusic)
	caster_free(intromusic)
	room_goto_next()

func _on_destroy():
	if(fadercreator != GS.faceemotion) _spawn("obj_introfader", 0, 0)
	$Alarm0.start((3) / 30.0)
	fadercreator= GS.faceemotion

func _process_begin(delta: float):
	if(act == 1) {
	    if(not is_instance_valid(OBJ_WRITER) and skip == 0) {
	        skip= 1
	        fader= _spawn("obj_unfader", 0, 0)
	        fader.tspeed= 0.05
	        $Alarm1.start((30) / 30.0)
	    }
	    if(skip == 1) {
	        vol-= 0.05
	        caster_set_volume(intromusic, vol)
	    }
	    if(GS.faceemotion == 2 and dongs == 0) {
	        dongs= 1
	        _spawn("obj_introlast", x, y)
	    }
	}

func _process(delta: float):
	if(act == 1 and keyboard_multicheck_pressed(0/* NOKEY */) and skip == 0) {
	    skip= 1
	    fader= _spawn("obj_unfader", 0, 0)
	    fader.tspeed= 0.05
	    $Alarm1.start((30) / 30.0)
	    with(OBJ_WRITER) instance_destroy()
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
