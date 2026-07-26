# Auto-converted from GameMaker: blt_streambullet
# GM parent: blt_parent
extends Node2D

func _ready():
	instance_create(x + sprite_width / 2 - 8, y + sprite_width / 2 - 8, 682/* blt_gen */)
	gravity= 0.2
	gravity_direction= 270
	velocity.y= 2
	speed= 2
	image_speed= 0.25
	dropdown= 0
	dmg= 0
	velocity.x= 0.4
	rbord= 0
	damageable= 0

func _process_begin(delta: float):
	if(dropdown == 1 and x > obj_heart.x - 4 and x < obj_heart.x + 10) {
	    gravity= 0.1
	    gravity_direction= 270
	    velocity.x= 0
	    velocity.y= 1.5
	    dropdown= 0
	    rotation_degrees= 0
	}

func _on_alarm_0_timeout():
	rotation_degrees= 270
	dropdown= 0
	damageable= 1
	modulate.a= 1
	y-= 4
	r= random(2)
	if(r >= 1) {
	    gravity_direction= 0
	    velocity.x= 2
	    velocity.y= 0
	} else  {
	    gravity_direction= 180
	    velocity.x= -2
	    velocity.y= 0
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
