# Auto-converted from GameMaker: obj_bigdog
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	if(GS.flag[54] == 1) instance_destroy()
	if(GS.flag[52] == 1 and GS.flag[53] == 1) sprite_index= 1210/* spr_npc_saddog */
	myinteract= 0
	image_speed= 0
	bluh= 0
	scr_depth()
	if(GS.flag[7] == 1 and room == 73) instance_destroy()
	jeffrey= 0
	if(room == 68) {
	    if(GS.flag[7] == 0) instance_destroy()
	    $Alarm1.start((1) / 30.0)
	}

func _gm_event_2_4():
	bluh++

func _gm_event_2_1():
	if(jeffrey == 0) {
	    sprite_index= 1274/* spr_bigdog_side */
	    al= _spawn("object_index", x - 55, y + 4)
	    al.jeffrey= 1
	    al.sprite_index= 2145/* spr_amalgam_dognpc */
	}

func _process(delta: float):
	if(myinteract == 453748) {
	    if(snd_isplaying(112/* snd_movemenu */) == 0) snd_play(112/* snd_movemenu */)
	    if(frame == 0) {
	        frame= 1
	        glow= 1
	    } else  {
	        frame= 0
	        glow= 0
	    }
	    myinteract= 0
	}
	if(myinteract == 1) {
	    GS.interact= 1
	    caster_pause(GS.currentsong)
	    frame= 1
	    $Alarm4.start((15) / 30.0)
	    myinteract= 0
	}
	if(bluh == 1) {
	    snd_play(23/* snd_bluh */)
	    frame= 2
	    bluh= 2
	    $Alarm4.start((35) / 30.0)
	}
	if(bluh == 3) {
	    GS.interact= 0
	    frame= 0
	    caster_resume(GS.currentsong)
	    bluh= 0
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
