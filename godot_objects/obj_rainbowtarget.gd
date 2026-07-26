# Auto-converted from GameMaker: obj_rainbowtarget
extends Node2D

func _ready():
	$Alarm0.start((20) / 30.0)
	image_speed= 0.25
	scale.x= 2
	scale.y= 2
	giga= 0

func _on_destroy():
	gig= instance_create(x, -10, 587/* obj_rainbowbolt */)
	gig.giga= giga
	if(giga == 1) {
	    // obj_rainbowbolt_realgen
	    with(586) event_user(1)
	    gig.scale.x= 4
	    gig.ss= -2
	} else  {
	    // obj_rainbowbolt_realgen
	    with(586) event_user(0)
	}
	instance_destroy()

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
