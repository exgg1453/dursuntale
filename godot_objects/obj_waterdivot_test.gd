# Auto-converted from GameMaker: obj_waterdivot_test
extends Node2D

func _ready():
	image_speed= 0.15 + random(0.05)
	siner= random(20)
	sinerfactor= 0.2
	velocity.x= 1.5
	moved= 0

func _process(delta: float):
	x+= sin(siner / 6) * sinerfactor
	siner++
	if(x > get_viewport_rect().size.x) {
	    x= -10
	    if(room == 68) x= 2300
	}
	if(room == 82) {
	    if(y <= 50 and x >= 460 and moved == 0) {
	        velocity.y= -velocity.x
	        velocity.x= 0
	        moved= 1
	    }
	    if(y <= 70 and x >= 480 and moved == 0) {
	        velocity.y= -velocity.x
	        velocity.x= 0
	        moved= 1
	    }
	    if(y <= 90 and x >= 500 and moved == 0) {
	        velocity.y= -velocity.x
	        velocity.x= 0
	        moved= 1
	    }
	    if(y <= -15) {
	        moved= 0
	        x= -10
	        velocity.x= 1.5
	        y= ystart
	        velocity.y= 0
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
