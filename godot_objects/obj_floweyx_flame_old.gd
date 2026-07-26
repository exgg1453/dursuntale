# Auto-converted from GameMaker: obj_floweyx_flame_old
# GM parent: obj_floweybullet_parent
extends Node2D

func _ready():
	size= 0.2
	move_towards_point(obj_vsflowey_heart.x + 8, obj_vsflowey_heart.y + 8, 1.5)

func _process(delta: float):
	friction= 0.025
	dirdir= point_direction(x, y, obj_vsflowey_heart.x + 8, obj_vsflowey_heart.y + 8)
	velocity.x+= lengthdir_x(0.13, dirdir)
	velocity.y+= lengthdir_y(0.13, dirdir)
	size+= 0.02
	scale.x= size
	scale.y= size
	if(size > 1) {
	    modulate.a-= 0.15
	    if(modulate.a < 0.2) instance_destroy()
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
