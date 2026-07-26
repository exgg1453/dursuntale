# Auto-converted from GameMaker: obj_eggbullet_pl
extends Node2D

func _ready():
	gravity= 0.11
	velocity.y= -2
	velocity.x= random(4) - 2
	friction= 0.01

func _process(delta: float):
	rotation_degrees= direction
	if(collision_rectangle(x, y, x + sprite_width, y + sprite_width, 739, 0, 1))
	    instance_destroy()
	if(y > get_viewport_rect().size.y) instance_destroy()

func _on_alarm_0_timeout():
	room_restart()

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
