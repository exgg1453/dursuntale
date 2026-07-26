# Auto-converted from GameMaker: obj_6shoe_part
# GM parent: obj_6bparent
extends Node2D

func _ready():
	scale.x= 2
	scale.y= 2
	velocity.x= -4
	siner= 0
	counter= 0
	counter= -floor(random(35))
	y= get_viewport_rect().size.y - sprite_height * 0.9
	type= 0

func _process(delta: float):
	siner++
	if(type == 0) {
	    if(counter > 0 and counter < 14) velocity.y= -6
	    if(counter == 14) velocity.y= 0
	    if(counter > 20 and counter < 30) velocity.y= 8
	    if(counter == 30) velocity.y= 0
	    if(counter > 40) counter= 1
	}
	if(type == 1) {
	    velocity.y= 0
	    if(speed > 0) speed-= 0.2
	    else  speed= 0
	}
	counter++
	if(x < -100) instance_destroy()

func _on_alarm_0_timeout():
	if(type == 0) event_inherited()

func _gm_event_7_15():
	type= 1

func _gm_event_7_14():
	type= 2
	velocity.y= -9
	friction= 0.2

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
