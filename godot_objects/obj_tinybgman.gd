# Auto-converted from GameMaker: obj_tinybgman
extends Node2D

func _ready():
	image_speed= 0.25
	velocity.y= 0.2
	c= 0
	$Alarm0.start((40) / 30.0)

func _on_destroy():
	c++

func _process(delta: float):
	if(c == 1) {
	    velocity.y= 0
	    image_speed= 0
	    $Alarm0.start((30) / 30.0)
	    c= 2
	}
	if(c == 3) {
	    velocity.x= 0.2
	    image_speed= 0.25
	    $Alarm0.start((30) / 30.0)
	    c= 4
	}
	if(c == 5) {
	    velocity.x= 0
	    image_speed= 0
	    $Alarm0.start((30) / 30.0)
	    c= 6
	}
	if(c == 7) {
	    velocity.x= -0.2
	    image_speed= 0.25
	    $Alarm0.start((60) / 30.0)
	    c= 8
	}
	if(c == 9) {
	    velocity.x= 0
	    image_speed= 0
	    $Alarm0.start((30) / 30.0)
	    c= 10
	}
	if(c == 11) {
	    velocity.x= 0.2
	    image_speed= 0.2
	    $Alarm0.start((30) / 30.0)
	    c= 12
	}
	if(c == 13) {
	    velocity.x= 0
	    velocity.y= -0.2
	    image_speed= 0.2
	    $Alarm0.start((40) / 30.0)
	    c= 14
	}
	if(c == 15) {
	    velocity.y= 0
	    c= 16
	    $Alarm0.start((30) / 30.0)
	}
	if(c == 17) {
	    // obj_tinybghouse
	    with(970) man= 0
	    // obj_tinybghouse
	    with(970) frame= 0
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
