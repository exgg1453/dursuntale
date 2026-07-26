# Auto-converted from GameMaker: obj_strangeman_head
# GM parent: obj_amalgambul_parent
extends Node2D

func _ready():
	image_speed= 0.5
	direction= point_direction(x, y, obj_heart.x, obj_heart.y)
	direction+= random(50) - random(50)
	if(direction < 165)
	    direction+= 170 - direction
	if(direction > 270)
	    direction-= direction - 270
	speed= 2 + random(0.5)
	scale.x= 2
	scale.y= 2
	siner= random(360)
	sf= 1 + random(1)
	sf2= 1 + random(1)
	s= 3 + random(1)
	siner2= random(360)
	siner2v= 0.5 + random(1.5)
	hmem= velocity.x
	counter= 0
	dmg= 9

func _process(delta: float):
	siner++
	siner2+= siner2v
	x+= sin(siner / s) * sf / 2
	y+= sin(siner2 / s) * sf2 / 2
	velocity.x= hmem
	counter++
	if(counter > 30) {
	    if(obj_heart.y + 6 < y) velocity.y-= 0.05
	    if(obj_heart.y + 6 > y) velocity.y+= 0.05
	}
	if(x < -100) instance_destroy()

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
