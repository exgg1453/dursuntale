# Auto-converted from GameMaker: blt_crybullet
# GM parent: blt_parent
extends Node2D

func _ready():
	instance_create(x + sprite_width / 2 - 8, y + sprite_width / 2 - 8, 682/* blt_gen */)
	gravity= 0.4
	gravity_direction= 270
	velocity.x= random(10) - 6.1
	velocity.y= 4
	friction= 0.4
	scale.x= random(0.4) + 0.8
	scale.y= scale.x
	dmg= 0

func _process(delta: float):
	rotation_degrees= direction + 90
	if(y > GS.idealborder[3]) instance_destroy()

func _on_alarm_0_timeout():
	velocity.x= -velocity.x

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
