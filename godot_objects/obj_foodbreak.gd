# Auto-converted from GameMaker: obj_foodbreak
extends Node2D

func _ready():
	active= 0
	myh= 3
	myv= -4
	mya= 3
	breaksprite= 1477

func _process(delta: float):
	if(active == 1) {
	    snd_play(106/* snd_noise */)
	    velocity.x= myh
	    velocity.y= myv
	    gravity= 0.5
	    active= 2
	}
	if(active == 2) {
	    rotation_degrees-= mya
	    if(y > ystart + 55) {
	        active= 3
	        speed= 0
	        gravity= 0
	        sprite_index= breaksprite
	        z_index= 600000
	        snd_play(11/* snd_glassbreak */)
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
