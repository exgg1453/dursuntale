# Auto-converted from GameMaker: blt_roachbullet
# GM parent: blt_parent
extends Node2D

func _ready():
	dmg= 0
	image_speed= 0.5
	grchoice= round(random(1))
	if(grchoice == 1) gravity_direction= 90
	if(grchoice == 0) graivty_direction= 270
	gravity= 0.2 + random(0.1)
	friction= 0.15
	if(x < GS.idealborder[0] + 10) velocity.x= 1 + random(2)
	if(x > GS.idealborder[1] - 10) velocity.x= -1 - random(2)

func _process_end(delta: float):
	if(velocity.x < 0) rotation_degrees= 180
	if(GS.turntimer < 1) instance_destroy()

func _gm_event_7_0():
	queue_free()

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
