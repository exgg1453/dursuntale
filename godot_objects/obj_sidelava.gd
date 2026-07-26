# Auto-converted from GameMaker: obj_sidelava
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	image_speed= 0
	if(x < obj_heart.xstart) {
	    velocity.x= 3
	    gravity= 0.1
	    gravity_direction= 180
	    velocity.y= -3
	} else  {
	    frame= 1
	    velocity.x= -3
	    gravity= 0.1
	    gravity_direction= 0
	    velocity.y= -3
	}

func _process(delta: float):
	if(x < 100 or x > 500) instance_destroy()

func _on_outside_room():
	draw_self_border_e()

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
