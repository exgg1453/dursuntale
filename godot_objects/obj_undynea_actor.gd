# Auto-converted from GameMaker: obj_undynea_actor
extends Node2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	image_speed= 0.334
	dsprite= 1446
	usprite= 1467
	lsprite= 1455
	rsprite= 1458
	dtsprite= 1454
	utsprite= 1468
	ltsprite= 1457
	rtsprite= 1459
	myinteract= 0
	facing= 0
	fun= 0
	npcdir= 0
	d= 0

func _gm_event_2_8():
	sprite_index= 1436/* spr_undyne_starkd */
	fun= 0

func _process(delta: float):
	if(d == 0) scr_depth()
	if(fun == 0) {
	    myinteract= 0
	    if(speed == 0) {
	        frame= 0
	        image_speed= 0
	    }
	    if(speed > 0) {
	        image_speed= 0.2
	        if(frame == 1 or frame == 3) snd_play(16/* snd_undynestep */)
	    }
	}
	if(fun == 3 and (frame == 1 or frame == 3))
	    snd_play(16/* snd_undynestep */)
	if(GS.flag[20] == 5) sprite_index= 1467/* spr_undynea_starku */
	if(GS.flag[20] == 6) sprite_index= 1463/* spr_undynea_starkl */

func _gm_event_7_12():
	$Alarm6.start((3) / 30.0)
	grandv= 0
	up= 1
	xm= 0
	ym= 0
	pd= 0

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
