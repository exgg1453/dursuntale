# Auto-converted from GameMaker: obj_snowhat
extends Node2D

func _ready():
	image_speed= 0
	frame= choose(0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 3, 3, 4)

func _process_end(delta: float):
	if(instance_exists(1570/* obj_mainchara */)) {
	    x= obj_mainchara.x - 1
	    y= obj_mainchara.y - 15
	    d= 0
	    if(GS.interact == 0) d= 1
	    if(d == 1) {
	        instance_create(x + 10, y + 15, 1504/* obj_snowhatparticle */)
	        repeat(3)  {
	            grx= choose(1, -1) * random(7)
	            gry= choose(1, -1) * random(4)
	            instance_create(x + 10 + grx, y + 12 + gry, 1504/* obj_snowhatparticle */)
	        }
	        instance_destroy()
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
