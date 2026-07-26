# Auto-converted from GameMaker: obj_speedline
extends Node2D

func _ready():
	image_blend= merge_color(16711680, 16776960, random(1))
	image_blend= merge_color(image_blend, 16777215, random(0.5))
	c= choose(0, 1, 2)
	o= choose(0, 1)
	if(c == 0) {
	    x= 2 + random(18)
	    velocity.y= 26
	    scale.y= 6
	    modulate.a= 0.9
	    y= -100
	}
	if(c == 1) {
	    x= 18 + random(18)
	    velocity.y= 22
	    scale.y= 4
	    modulate.a= 0.7
	    y= -70
	}
	if(c == 2) {
	    x= 30 + random(40)
	    velocity.y= 15
	    scale.y= 3
	    modulate.a= 0.3
	    y= -40
	}
	if(o == 1) x= get_viewport_rect().size.x - x - 4

func _process(delta: float):
	if(y > get_viewport_rect().size.y) instance_destroy()

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
