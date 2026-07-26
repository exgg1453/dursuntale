# Auto-converted from GameMaker: obj_waterpushrock
# GM parent: obj_solidsmall
extends Node2D

func _ready():
	velocity.y= 8
	active= 1
	speeded= 0
	colliding= 0
	phase= 1
	if(room == 84) {
	    topy= 60
	    bottomy= 180
	    destroyy= 350
	}
	if(room == 91) {
	    topy= 110
	    bottomy= 180
	    destroyy= 350
	}

func _process_end(delta: float):
	GS.colliding= 0

func _process(delta: float):
	scr_depth()
	if(GS.interact != 5) velocity.y= 8
	else  velocity.y= 0
	if(y > topy) {
	    if(speeded == 0) {
	        phase= 0
	        speeded= 1
	    }
	    if(GS.interact != 5) velocity.y= 4
	}
	if(active == 1 and GS.interact != 5 and instance_exists(1136/* obj_waterpushrockgen */) and obj_waterpushrockgen.colliding == 0 and collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + velocity.y + 1, 1570, 0, 1)) {
	    obj_mainchara.y+= velocity.y
	    if(obj_time.up == 1) obj_mainchara.y+= 3
	    if(obj_time.down == 1 and velocity.y > 3)
	        obj_mainchara.y-= 3
	    obj_mainchara.x= round(obj_mainchara.x)
	    obj_mainchara.y= round(obj_mainchara.y)
	    obj_waterpushrockgen.colliding= 1
	}
	if(y > bottomy) {
	    d= instance_create(x, y, 1138/* obj_waterpushrock_2 */)
	    if(room == 91) d.$Alarm0.start((2) / 30.0)
	    instance_destroy()
	}
	if(y > 350) instance_destroy()

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
