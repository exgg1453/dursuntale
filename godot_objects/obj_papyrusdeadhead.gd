# Auto-converted from GameMaker: obj_papyrusdeadhead
extends Node2D

func _ready():
	c= 0
	ini_open("undertale.ini")
	M1= ini_read_real("Papyrus", "PK", 0)
	ini_write_real("Papyrus", "PK", M1 + 1)
	ini_close()

func _process(delta: float):
	if(c == 1) {
	    velocity.x= 1.5
	    gravity= 0.2
	    gravity_direction= 270
	    velocity.y= -1
	    c= 2
	}
	if(c == 2 and y > ystart + 70) {
	    velocity.x= 0
	    velocity.y= 0
	    gravity= 0
	    c= 3
	}
	if(c == 5) {
	    gravity= 0.2
	    c= 6
	}
	if(c == 6 and y > ystart + 135) {
	    velocity.y= 0
	    gravity= 0
	}
	if(c == 7) {
	    ddd= instance_create(x, y, 155/* obj_vaporized_new */)
	    with(ddd) scr_newvapordata(10)
	    ddd.sprite_index= sprite_index
	    ddd.ht= sprite_height
	    ddd.wd= sprite_width
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
