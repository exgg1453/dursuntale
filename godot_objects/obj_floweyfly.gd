# Auto-converted from GameMaker: obj_floweyfly
# GM parent: obj_floweybullet_parent
extends Node2D

func _ready():
	image_speed= 0.5
	parent= 39483294

func _gm_event_1_0():
	instance_create(x, y, 1649/* obj_floweyfly_burst */)

func _process(delta: float):
	if(velocity.x > 0 and scale.x < 0)
	    scale.x*= -1
	if(velocity.x < 0 and scale.x > 0)
	    scale.x*= -1
	if(is_instance_valid(parent)) {
	    finish= 0
	    if(parent.sider == 0 and x < parent.x) finish= 1
	    if(parent.sider == 1 and x > parent.x) finish= 1
	    sd= parent.sider
	    if(sd == 0 and distance_to_point(parent.x + 70, parent.y + 110) < 80) {
	        scale.x*= 0.75
	        scale.y*= 0.75
	    }
	    if(sd == 1 and distance_to_point(parent.x - 70, parent.y + 110) < 80) {
	        scale.x*= 0.75
	        scale.y*= 0.75
	    }
	    if(abs(scale.x) <= 0.1) finish= 1
	    if(finish == 1) {
	        with(parent) event_user(3)
	        instance_destroy()
	    }
	} else  instance_destroy()

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
