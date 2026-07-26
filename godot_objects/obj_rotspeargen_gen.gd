# Auto-converted from GameMaker: obj_rotspeargen_gen
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	t= 0
	type= 0

func _on_destroy():
	if(type == 0) {
	    g= instance_create(obj_heart.x + 8, obj_heart.y + 8, 277/* obj_rotspeargen */)
	    g.type= t
	    if(t == 0) t= 1
	    else  t= 0
	    $Alarm0.start((27) / 30.0)
	}
	if(type == 1) {
	    t= choose(2, 3)
	    g= instance_create(obj_heart.x + 8, obj_heart.y + 8, 277/* obj_rotspeargen */)
	    g.type= t
	    $Alarm0.start((24) / 30.0)
	}

func _process(delta: float):
	if(GS.turntimer < 4) {
	    if(instance_exists(282/* obj_undyne_ex */) and obj_undyne_ex.orderb == 4) {
	        GS.turntimer= 30
	        // obj_undyne_ex
	        with(282) $Alarm11.start((40) / 30.0)
	        if(obj_undyne_ex.order == 11) obj_undyne_ex.lesson= -11
	        // obj_undyne_ex
	        with(282) event_user(1)
	    }
	    // obj_rotspeargen
	    with(277) instance_destroy()
	    // obj_rotspear
	    with(278) {
	        deactivate= 1
	        fade= 1
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
