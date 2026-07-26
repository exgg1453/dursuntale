# Auto-converted from GameMaker: obj_bouncer
extends Node2D

func _ready():
	myobject= object_index
	bounce= 0
	bounceamt= 4
	grav= 0.1
	nowy= 0

func _process(delta: float):
	if(not is_instance_valid(myobject)) {
	    instance_destroy()
	    exit
	} else  {
	    if(bounce == 0 and is_instance_valid(myobject)) {
	        remvelocity.y= myobject.velocity.y
	        remgravity= myobject.gravity
	        myobject.gravity_direction= 270
	        myobject.velocity.y= -bounceamt
	        myobject.gravity= grav
	        nowy= myobject.y
	        bounce= 1
	    }
	    if(bounce == 1 and myobject.y >= nowy - myobject.velocity.y) {
	        myobject.y= nowy
	        myobject.gravity= remgravity
	        myobject.velocity.y= remvelocity.y
	        instance_destroy()
	    }
	    exit
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
