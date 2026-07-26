# Auto-converted from GameMaker: obj_chimesparkle
extends Node2D

func _ready():
	modulate.a= 0
	maxalpha= 1
	timer= 0
	velocity.y= 1 + random(2)
	$Alarm0.start((4) / 30.0)
	z_index= -2
	size= random(0.5) + 0.5
	scale.x= size
	scale.y= size
	rotspeed= 3 + floor(random(5))
	image_speed= 0

func _on_destroy():
	rotation_degrees+= 45
	$Alarm0.start((rotspeed) / 30.0)

func _process(delta: float):
	if(timer < 30) modulate.a+= 0.1
	timer++
	if(timer > 20) {
	    modulate.a-= 0.04
	    if(modulate.a < 0.05) instance_destroy()
	}
	if(modulate.a > obj_killervisage.modulate.a)
	    modulate.a= obj_killervisage.modulate.a

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
