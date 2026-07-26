# Auto-converted from GameMaker: obj_floweytalker1
extends Node2D

func _ready():
	if(room == 5 and GS.plot != 0) instance_destroy()
	if(room == 43 and GS.plot > 27) instance_destroy()
	image_speed= 0

func _gm_event_2_1():
	frame= 0
	sprite_index= 1098/* spr_floweyshrink */
	image_speed= 0.5

func _on_destroy():
	snd_play(52/* snd_floweylaugh */)
	$Alarm1.start((150) / 30.0)
	image_speed= 0.6

func _process(delta: float):
	if(room == 5 and GS.plot != 0) instance_destroy()
	if(instance_exists(769/* obj_floface */))
	    frame= obj_floface.frame
	if(sprite_index == 1100 and frame == 5) instance_destroy()

func _gm_event_7_7():
	if(sprite_index == 1097) {
	    frame= 0
	    sprite_index= 1099/* spr_floweylaughoverworld */
	    image_speed= 0
	    $Alarm0.start((30) / 30.0)
	}
	if(sprite_index == 1098) {
	    frame= 0
	    sprite_index= 1100/* spr_floweysink */
	    image_speed= 0.5
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
