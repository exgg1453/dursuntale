# Auto-converted from GameMaker: obj_glowfly1
# GM parent: obj_interactable
extends Node2D

func _ready():
	image_speed= 0.5
	direction= random(360)
	speed= 1
	friction= 0.05
	$Alarm0.start((20) / 30.0)
	myinteract= 0
	talkcounter= 0

func _on_destroy():
	if(speed < 0.5) {
	    friction= -0.04
	    speed+= 0.1
	    move_towards_point(xstart - 20 + random(40), ystart - 20 + random(40), speed)
	}
	if(speed > 0.5) friction= 0.04
	gravity= 0.03
	gravity_direction= random(360)
	$Alarm0.start((30 + random(20)) / 30.0)

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	draw_sprite_ext(sprite_index, frame, x - 0.5, y - 0.5, 1.5, 1.5, 0, 16777215, 0.25)
	talkcounter--
	if(myinteract == 1 and talkcounter < 0) {
	    snd= choose(18, 19)
	    snd_play(snd)
	    talkcounter= 30
	    myinteract= 0
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
