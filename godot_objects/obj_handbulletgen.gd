# Auto-converted from GameMaker: obj_handbulletgen
extends Node2D

func _ready():
	type= 2
	$Alarm0.start((1) / 30.0)

func _on_destroy():
	if(type == 1) {
	    hand1= instance_create(440, 352, 461/* obj_handbullet_new */)
	    hand1.type= 2
	    hand2= instance_create(104, 176, 461/* obj_handbullet_new */)
	    hand2.type= 1
	}
	if(type == 2) {
	    hand1= instance_create(440, 382, 461/* obj_handbullet_new */)
	    hand1.type= 2
	    hand2= instance_create(104, 146, 461/* obj_handbullet_new */)
	    hand2.type= 1
	    hand3= instance_create(GS.idealborder[0] - 10, 552, 461/* obj_handbullet_new */)
	    hand3.type= 4
	    hand4= instance_create(GS.idealborder[1] - 50, -50, 461/* obj_handbullet_new */)
	    hand4.type= 3
	}
	if(type == 3) {
	    hand1= instance_create(440, 382, 461/* obj_handbullet_new */)
	    hand1.type= 2
	    hand2= instance_create(-250, 196, 461/* obj_handbullet_new */)
	    hand2.type= 5
	    hand3= instance_create(GS.idealborder[0] - 10, 512, 461/* obj_handbullet_new */)
	    hand3.type= 4
	    hand4= instance_create(GS.idealborder[1] - 50, -280, 461/* obj_handbullet_new */)
	    hand4.type= 3
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
