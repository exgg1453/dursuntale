# Auto-converted from GameMaker: obj_scrollaway_event
extends Node2D

func _ready():
	view_yview[0]= 620
	l1= 1000010
	l2= 1000000
	l2x= 999995
	l3= 999990
	con= 0
	tspeed= 0
	if(instance_exists(1249/* obj_mettboss_event */))
	    sixty= obj_mettboss_event.sixty

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 0) {
	    con= 1
	    snd_play(13/* snd_spearappear */)
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 1) {
	    tile_layer_shift(l2, 0, -1)
	    tile_layer_shift(l2x, 0, -1)
	    // obj_mettboss_event
	    with(1249) {
	        obj_mainchara.y--
	        mett.y--
	        sixty.y--
	    }
	}
	if(con == 2) {
	    remay= obj_mainchara.y
	    remby= obj_mettaton_actor.y
	    snd_play(21/* snd_impact */)
	    con= 3
	    $Alarm4.start((30) / 30.0)
	    blastup= -6
	    bltotal= 0
	    bl= 0
	    ttotal= 0
	    ttotal2= 0
	    cl= 0
	}
	if(con == 4) {
	    if(cl == 0) {
	        snd_play(14/* snd_spearrise */)
	        cl= 1
	    }
	    tspeed+= 0.4
	    if(tspeed > 22) tspeed= 22
	    if(bl == 0) {
	        blastup+= 0.2
	        bltotal+= blastup
	        tile_layer_shift(l2, 0, blastup)
	        tile_layer_shift(l2x, 0, blastup)
	        sixty.y+= blastup
	        obj_mainchara.y+= blastup
	        obj_mettaton_actor.y+= blastup
	        if(blastup > 0 and bltotal >= 20) blastup= -2
	    }
	    if(ttotal < 300) {
	        ttotal+= tspeed
	        ttotal2+= tspeed
	        tile_layer_shift(l1, 0, tspeed)
	        tile_layer_shift(l3, 0, tspeed)
	    }
	    obj_mettboss_event.bly+= tspeed
	    if(ttotal > 400) {
	        ttotal-= 400
	        tile_layer_shift(l1, 0, -400)
	    }
	    instance_create(0, 0, 1250/* obj_speedline */)
	}
	if(con == 6) {
	    // obj_speedline
	    with(1250) instance_destroy()
	    con= 7
	    tile_layer_shift(l2, 0, -bltotal + 20)
	    tile_layer_shift(l2x, 0, -bltotal + 20)
	    if(is_instance_valid(sixty))
	        sixty.y+= -bltotal + 20
	    tile_layer_shift(l3, 0, -ttotal2)
	    tile_layer_shift(l1, 0, -ttotal)
	}
	if(con == 7) instance_destroy()

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
