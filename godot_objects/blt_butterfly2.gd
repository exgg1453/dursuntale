# Auto-converted from GameMaker: blt_butterfly2
# GM parent: blt_parent
extends Node2D

func _ready():
	dmg= 0
	velocity.y= -(0.2 + random(2))
	friction= -0.1
	image_speed= 0.25
	rotation_degrees= 90
	if(x < GS.idealborder[0]) instance_destroy()
	if(x > GS.idealborder[1] - 16) instance_destroy()

func _process_begin(delta: float):
	if(x < GS.idealborder[0]) instance_destroy()
	if(x > GS.idealborder[1] - 16) instance_destroy()
	if(y < GS.idealborder[2]) instance_destroy()

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
