# Auto-converted from GameMaker: obj_spearbulletfollowgen
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)

func _on_destroy():
	instance_create(200, 200, 271/* obj_spearbullet_follow */)
	$Alarm0.start((GS.firingrate) / 30.0)

func _process(delta: float):
	if(GS.turntimer < 3) {
	    // obj_spearbullet_follow
	    with(271) deactivate= 1
	    // obj_undyneboss
	    with(272) darkify= 3
	    instance_destroy()
	}
	if(GS.turntimer < 4) {
	    if(instance_exists(272/* obj_undyneboss */) and (obj_undyneboss.order == 9 or obj_undyneboss.order == 15)) {
	        GS.turntimer= 30
	        if(obj_undyneboss.order == 9) obj_undyneboss.lesson= 8
	        if(obj_undyneboss.order == 15) obj_undyneboss.lesson= 13
	        if(obj_undyneboss.order == 24) obj_undyneboss.lesson= 22
	        // obj_spearbullet_follow
	        with(271) deactivate= 1
	        // obj_undyneboss
	        with(272) darkify= 3
	        // obj_undyneboss
	        with(272) event_user(1)
	    }
	    if(instance_exists(282/* obj_undyne_ex */) and obj_undyne_ex.order == 6) {
	        GS.turntimer= 30
	        // obj_undyne_ex
	        with(282) $Alarm11.start((40) / 30.0)
	        if(obj_undyne_ex.order == 6) obj_undyne_ex.lesson= -8
	        // obj_undyne_ex
	        with(282) deactivate= 1
	        // obj_undyne_ex
	        with(282) darkify= 3
	        // obj_undyne_ex
	        with(282) event_user(1)
	    }
	    instance_destroy()
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
