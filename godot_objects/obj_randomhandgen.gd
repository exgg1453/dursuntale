# Auto-converted from GameMaker: obj_randomhandgen
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	factor= 40

func _on_destroy():
	$Alarm0.start((factor) / 30.0)
	tt= choose(1, 2, 3, 4)
	if(tt == 1) {
	    hand2= instance_create(104, 146, 461/* obj_handbullet_new */)
	    hand2.type= 1
	}
	if(tt == 2) {
	    hand1= instance_create(440, 382, 461/* obj_handbullet_new */)
	    hand1.type= 2
	}
	if(tt == 3) {
	    hand4= instance_create(GS.idealborder[1] - 50, GS.idealborder[2] - 90, 461/* obj_handbullet_new */)
	    hand4.type= 3
	}
	if(tt == 4) {
	    hand3= instance_create(GS.idealborder[0] - 10, GS.idealborder[3] + 10, 461/* obj_handbullet_new */)
	    hand3.type= 4
	}

func _process_end(delta: float):
	if(GS.turntimer < 0) instance_destroy()

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
