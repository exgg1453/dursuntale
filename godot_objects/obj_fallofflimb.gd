# Auto-converted from GameMaker: obj_fallofflimb
extends Node2D

func _ready():
	gravity= 0.3 + random(0.1)
	if(x < 300) {
	    aa= 2
	    velocity.x= -2
	} else  {
	    aa= -2
	    velocity.x= 2
	}

func _process(delta: float):
	rotation_degrees+= aa
	if(y > get_viewport_rect().size.y + 40) {
	    if(not instance_exists(184/* obj_shaker */)) {
	        snd_play(21/* snd_impact */)
	        scr_shake(3, 3, 2)
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
