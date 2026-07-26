# Auto-converted from GameMaker: obj_undyne_actor
extends Node2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	image_speed= 0
	dsprite= 1404
	usprite= 1412
	lsprite= 1414
	rsprite= 1416
	dtsprite= 1407
	utsprite= 1413
	ltsprite= 1415
	rtsprite= 1417
	myinteract= 0
	facing= 0
	fun= 0
	npcdir= 0
	d= 0

func _gm_event_2_6():
	pd++
	y+= 2 * sin(pd / 2)
	x+= 2 * cos(pd / 2)
	if(up == 1) grandv+= 0.13
	else  grandv-= 0.13
	if(grandv > 3) up= 0
	y-= grandv
	$Alarm6.start((1) / 30.0)

func _process(delta: float):
	if(d == 0) scr_depth()
	if(fun == 0) {
	    if(instance_exists(777/* obj_face_undyne */))
	        frame= obj_face_undyne.frame
	    else  {
	        myinteract= 0
	        if(speed == 0 and path_speed == 0) {
	            frame= 0
	            image_speed= 0
	        }
	        if(speed > 0) image_speed= 0.2
	        if(path_speed > 0) image_speed= 0.2
	        if(path_position == 1) {
	            frame= 0
	            image_speed= 0
	        }
	        if(npcdir == 1) scr_npcdir(0)
	    }
	}
	if(GS.flag[20] > 0) {
	    if(GS.flag[20] == 1) sprite_index= 1409/* spr_undyne_besties */
	    if(GS.flag[20] == 2) sprite_index= 1410/* spr_undyne_youremine */
	    if(GS.flag[20] == 3) sprite_index= 1408/* spr_undyne_polite */
	    if(GS.faceemotion == 9) sprite_index= 1408/* spr_undyne_polite */
	}

func _on_alarm_0_timeout():
	if(other.active == 0) other.active= 1

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
