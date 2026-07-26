# Auto-converted from GameMaker: obj_floweybullet_parent
extends Node2D

func _ready():
	$Alarm0.timeout.connect(_on_alarm_0_timeout)

func _on_alarm_0_timeout():
	if(GS.my_inv < 0) {
	    GS.my_inv= 20
	    hitted= 0
	    snd_play(156/* snd_hurt1_c */)
	    instance_create(0, 0, 1582/* obj_vsflowey_shaker */)
	    if(GS.battlephase < 6) {
	        if(GS.my_hp > 40 and hitted == 0) {
	            GS.my_hp-= 12
	            hitted= 1
	        }
	        if(GS.my_hp > 30 and hitted == 0) {
	            GS.my_hp-= 10
	            hitted= 1
	        }
	    } else  {
	        if(GS.my_hp > 40 and hitted == 0) {
	            GS.my_hp-= 8
	            hitted= 1
	        }
	        if(GS.my_hp > 30 and hitted == 0) {
	            GS.my_hp-= 7
	            hitted= 1
	        }
	    }
	    if(GS.my_hp > 20 and hitted == 0) {
	        GS.my_hp-= 6
	        hitted= 1
	    }
	    if(GS.my_hp > 12 and hitted == 0) {
	        GS.my_hp-= 4
	        hitted= 1
	    }
	    if(GS.my_hp > 5 and hitted == 0) {
	        GS.my_hp-= 2
	        hitted= 1
	    }
	    if(GS.my_hp > 0 and hitted == 0) {
	        GS.my_hp--
	        hitted= 1
	    }
	}

func _gm_event_7_22():
	if(GS.my_inv < 0) {
	    GS.my_inv= 20
	    hitted= 0
	    snd_play(156/* snd_hurt1_c */)
	    instance_create(0, 0, 1582/* obj_vsflowey_shaker */)
	    if(GS.battlephase < 6) {
	        if(GS.my_hp > 40 and hitted == 0) {
	            GS.my_hp-= 12
	            hitted= 1
	        }
	        if(GS.my_hp > 30 and hitted == 0) {
	            GS.my_hp-= 10
	            hitted= 1
	        }
	    } else  {
	        if(GS.my_hp > 40 and hitted == 0) {
	            GS.my_hp-= 8
	            hitted= 1
	        }
	        if(GS.my_hp > 30 and hitted == 0) {
	            GS.my_hp-= 7
	            hitted= 1
	        }
	    }
	    if(GS.my_hp > 20 and hitted == 0) {
	        GS.my_hp-= 6
	        hitted= 1
	    }
	    if(GS.my_hp > 12 and hitted == 0) {
	        GS.my_hp-= 4
	        hitted= 1
	    }
	    if(GS.my_hp > 5 and hitted == 0) {
	        GS.my_hp-= 2
	        hitted= 1
	    }
	    if(GS.my_hp > 0 and hitted == 0) {
	        GS.my_hp--
	        hitted= 1
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
