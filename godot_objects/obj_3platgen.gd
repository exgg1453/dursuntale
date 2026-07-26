# Auto-converted from GameMaker: obj_3platgen
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	$Alarm1.start((1) / 30.0)
	$Alarm2.start((1) / 30.0)
	g= 4
	gg= 4
	gg2= 4
	type= 3
	skl= 0
	sd= 0

func _gm_event_2_3():
	zone= 0
	if(obj_heart.y >= GS.idealborder[2] + 40) zone= 1
	if(obj_heart.y >= GS.idealborder[2] + 80) zone= 2
	reroll= 0
	gg2= gg
	gg= g
	g= choose(0, 1, 2)
	if(gg == g and gg2 == gg) reroll= 1
	if(g == 0 and zone == 0) reroll= 1
	if(g == 1 and zone == 2) reroll= 1
	if(reroll == 1) g= choose(0, 1, 2)
	if(g == 0) {
	    gb= instance_create(0, 0, 498/* obj_gasterblaster */)
	    if(sd == 0) gb.idealx= GS.idealborder[0] - 60
	    else  {
	        gb.idealx= GS.idealborder[1] + 60
	        gb.x= 640
	    }
	    gb.idealy= GS.idealborder[3] - 20
	    if(sd == 0) gb.idealrot= 90
	    else  gb.idealrot= -90
	}
	if(g == 1) {
	    gb= instance_create(0, 0, 498/* obj_gasterblaster */)
	    if(sd == 0) gb.idealx= GS.idealborder[0] - 60
	    else  {
	        gb.idealx= GS.idealborder[1] + 60
	        gb.x= 640
	    }
	    gb.idealy= GS.idealborder[2] + 35
	    if(sd == 0) gb.idealrot= 90
	    else  gb.idealrot= -90
	}
	if(g == 2) {
	    gb= instance_create(0, 0, 498/* obj_gasterblaster */)
	    if(sd == 0) gb.idealx= GS.idealborder[0] - 60
	    else  {
	        gb.idealx= GS.idealborder[1] + 60
	        gb.x= 640
	    }
	    gb.idealy= GS.idealborder[2] + 75
	    if(sd == 0) gb.idealrot= 90
	    else  gb.idealrot= -90
	}
	// obj_gasterblaster
	with(498) {
	    pause= 17
	    terminal= 3
	    scale.y= 2
	}
	if(type == 3) {
	    // obj_gasterblaster
	    with(498) pause= 17
	}
	if(sd == 0) sd= 1
	else  sd= 0
	$Alarm3.start((26) / 30.0)
	if(type == 3) $Alarm3.start((21) / 30.0)

func _gm_event_2_2():
	zone= 0
	if(obj_heart.y >= GS.idealborder[2] + 40) zone= 1
	if(obj_heart.y >= GS.idealborder[2] + 80) zone= 2
	reroll= 0
	gg2= gg
	gg= g
	g= choose(0, 1, 2)
	if(gg == g and gg2 == gg) reroll= 1
	if(g == 0 and zone == 0) reroll= 1
	if(g == 1 and zone == 2) reroll= 1
	if(reroll == 1) g= choose(0, 1, 2)
	if(g == 0) scr_sbo(35, -4, 50, 0)
	if(g == 1) scr_sbo(90, -4, 50, 2)
	if(g == 2) {
	    scr_bwall(80, 4, 50, 1)
	    bone.scale.y= 0.8
	}
	if(type == 0) $Alarm2.start((15) / 30.0)
	if(type == 1) $Alarm2.start((15) / 30.0)

func _gm_event_2_1():
	if(type == 0) {
	    $Alarm1.start((100) / 30.0)
	    scr_hplat(80, 2, 125, 60)
	}
	if(type == 1) {
	    $Alarm1.start((70) / 30.0)
	    scr_hplat(80, 4, 80, 80)
	}
	if(type == 2 or type == 3) {
	    $Alarm1.start((40) / 30.0)
	    scr_hplat(80, 4, 80, 25)
	}

func _on_destroy():
	if(type == 0) {
	    $Alarm0.start((100) / 30.0)
	    scr_hplat(40, -2, 125, 60)
	}
	if(type == 1) {
	    $Alarm0.start((55) / 30.0)
	    scr_hplat(40, -4, 65, 60)
	}
	if(type == 2 or type == 3) {
	    $Alarm0.start((35) / 30.0)
	    scr_hplat(40, -4, 65, 25)
	    $Alarm2.start((-1) / 30.0)
	    if(skl == 0) {
	        skl= 1
	        $Alarm3.start((1) / 30.0)
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
