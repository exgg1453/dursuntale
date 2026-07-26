# Auto-converted from GameMaker: obj_clawbullet_gravityfailure
# GM parent: obj_amalgambul_parent
extends Node2D

func _ready():
	gravity= 0.05 + random(0.06)
	velocity.x= -0.1 + random(0.2)
	image_speed= random(0.2) + 0.2
	shake= 0
	dmg= 0

func _process(delta: float):
	if(y > GS.idealborder[3] - sprite_height) speed= 0
	shake+= 0.02
	x= x + random(shake) - random(shake)
	y= y + random(shake) - random(shake)

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
