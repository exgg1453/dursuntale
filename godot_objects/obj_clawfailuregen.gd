# Auto-converted from GameMaker: obj_clawfailuregen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	type= choose(0, 1, 2)
	$Alarm0.start((1) / 30.0)

func _on_destroy():
	if(type == 0) {
	    xx= choose(1, -1) * (50 + random(240)) + obj_heart.x
	    yy= GS.idealborder[2] + 20 + random(GS.idealborder[3] - GS.idealborder[2] - 40)
	    instance_create(xx, yy, 532/* obj_clawbullet_failure */)
	}
	if(type == 1) {
	    repeat(1 + random(7))  {
	        xx= choose(1, -1) * (50 + random(50)) + obj_heart.x
	        yy= GS.idealborder[2] - random(30)
	        instance_create(xx, yy, 533/* obj_clawbullet_gravityfailure */)
	    }
	}
	if(type == 2) {
	    repeat(1 + random(7))  {
	        xx= choose(1, -1) * (200 + random(50)) + obj_heart.x
	        yy= GS.idealborder[2] - random(30)
	        gr= instance_create(xx, yy, 533/* obj_clawbullet_gravityfailure */)
	        gr.gravity_direction= 1
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
