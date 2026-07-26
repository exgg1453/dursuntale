# Auto-converted from GameMaker: obj_undynea_actor2
extends Node2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	image_speed= 0.334
	dsprite= 1446
	usprite= 1466
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
	xhome= xstart
	yhome= ystart
	hvelocity.x= 0
	vvelocity.x= 0
	scrollspeed= 0.8

func _process(delta: float):
	if(d == 0) scr_depth()
	if(fun == 0) {
	    myinteract= 0
	    if(hvelocity.x == 0 and vvelocity.x == 0) {
	        frame= 0
	        image_speed= 0
	    }
	    if(abs(hvelocity.x) > 0 or abs(vvelocity.x) > 0) {
	        image_speed= 0.2
	        if(frame == 1 or frame == 3) snd_play(16/* snd_undynestep */)
	    }
	}
	gg= get_viewport_rect().size.x - view_wview[0]
	hh= get_viewport_rect().size.y - view_hview[0]
	if(view_xview[0] >= 0) {
	    x= xhome + floor(view_xview[0] - view_xview[0] * scrollspeed)
	    g= x - xprevious
	}
	if(view_xview[0] >= gg) {
	    x= xhome + floor(gg - gg * scrollspeed)
	    g= x - xprevious
	}
	if(view_yview[0] >= 0)
	    y= yhome + floor(view_yview[0] - view_yview[0] * scrollspeed)
	if(view_yview[0] >= hh)
	    y= yhome + floor(hh - hh * scrollspeed)
	xhome+= hvelocity.x
	yhome+= vvelocity.x

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
