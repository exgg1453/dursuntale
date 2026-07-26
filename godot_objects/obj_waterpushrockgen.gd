# Auto-converted from GameMaker: obj_waterpushrockgen
extends Node2D

func _ready():
	$Alarm0.start((15) / 30.0)
	falling= 0
	fell= 0
	rate= 0
	colliding= 0
	rate_time= 90
	if(room == 84) {
	    x1= 220
	    y1= 180
	    x2= 380
	    y2= 260
	    triggery= 283
	}
	if(room == 91) {
	    x1= 80
	    x2= 240
	    y1= 180
	    y2= 200
	    triggery= 263
	}
	if(scr_murderlv() >= 8 and GS.flag[27] == 0) $Alarm0.start((-1) / 30.0)

func _on_destroy():
	if(GS.interact != 5) {
	    if(room == 84 and rate_time > 85) {
	        rate_time= 0
	        i= 0
	        instance_create(235, -20 - i * 16, 1137/* obj_waterpushrock */)
	        instance_create(325, -20 - i * 16, 1137/* obj_waterpushrock */)
	        instance_create(255, -260 - i * 16, 1137/* obj_waterpushrock */)
	        instance_create(345, -260 - i * 16, 1137/* obj_waterpushrock */)
	        instance_create(235, -440 - i * 16, 1137/* obj_waterpushrock */)
	        instance_create(255, -460 - i * 16, 1137/* obj_waterpushrock */)
	        instance_create(325, -480 - i * 16, 1137/* obj_waterpushrock */)
	        instance_create(345, -500 - i * 16, 1137/* obj_waterpushrock */)
	        $Alarm0.start((90) / 30.0)
	    } else  $Alarm0.start((5) / 30.0)
	    if(room == 91) {
	        instance_create(100, -10, 1137/* obj_waterpushrock */)
	        instance_create(220, -10, 1137/* obj_waterpushrock */)
	        instance_create(100, -40, 1137/* obj_waterpushrock */)
	        instance_create(220, -40, 1137/* obj_waterpushrock */)
	        instance_create(100, -80, 1137/* obj_waterpushrock */)
	        instance_create(220, -80, 1137/* obj_waterpushrock */)
	        $Alarm0.start((40) / 30.0)
	    }
	} else  $Alarm0.start((5) / 30.0)

func _process_end(delta: float):
	colliding= 0

func _process(delta: float):
	if(GS.interact != 5) rate_time++
	if(falling == 0 and collision_rectangle(x1, y1, x2, y2, 1570, 0, 1)) {
	    falling= 1
	    snd_play(134/* snd_fall2 */)
	    obj_mainchara.modulate.a= 0.5
	    // obj_dialoguer
	    with(779) instance_destroy()
	    // OBJ_WRITER
	    with(782) instance_destroy()
	    // obj_face
	    with(774) instance_destroy()
	    GS.interact= 1
	    obj_mainchara.velocity.y= 6
	    GS.phasing= 1
	}
	if(falling == 1 and obj_mainchara.y > triggery) {
	    if(fell == 0) {
	        obj_mainchara.dsprite= 1043
	        obj_mainchara.usprite= 1044
	        obj_mainchara.rsprite= 1045
	        obj_mainchara.lsprite= 1046
	        fell= 1
	    } else  {
	        obj_mainchara.dsprite= 1043
	        obj_mainchara.usprite= 1044
	        obj_mainchara.rsprite= 1045
	        obj_mainchara.lsprite= 1046
	        fell= 0
	    }
	    obj_mainchara.modulate.a= 1
	    obj_mainchara.x= round(obj_mainchara.x)
	    obj_mainchara.y= round(obj_mainchara.y)
	    obj_mainchara.velocity.y= 0
	    GS.interact= 0
	    GS.phasing= 0
	    falling= 0
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
