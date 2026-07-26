# Auto-converted from GameMaker: obj_hg_debris
# GM parent: obj_asbulletparent
extends Node2D

func _ready():
	side= choose(0, 1, 2, 3)
	if(side == 0) {
	    x= random(get_viewport_rect().size.x + 160) - 80
	    y= get_viewport_rect().size.y + 80
	}
	if(side == 1) {
	    x= random(get_viewport_rect().size.x + 160) - 80
	    y= -80
	}
	if(side == 2) {
	    y= random(get_viewport_rect().size.y + 160) - 80
	    x= -80
	}
	if(side == 3) {
	    y= random(get_viewport_rect().size.y + 160) - 80
	    x= get_viewport_rect().size.x + 80
	}
	size= 2
	friction= -0.3
	move_towards_point(get_viewport_rect().size.x / 2, get_viewport_rect().size.y / 2, 2)

func _process(delta: float):
	size-= 0.03
	scale.x= size
	scale.y= size
	if(size < 0.01 or point_distance(x, y, get_viewport_rect().size.x / 2, get_viewport_rect().size.y / 2) < 10)
	    instance_destroy()

func _on_alarm_0_timeout():
	if(instance_exists(594/* obj_hg_body */) and obj_hg_body.c_counter < 280)
	    event_user(7)

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
