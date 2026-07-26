# Auto-converted from GameMaker: obj_bulletgenthatched
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	GS.turntimer= 200
	firingspeed= GS.firingrate
	$Alarm0.start(20 / 30.0)

func _on_destroy():
	script_execute(129/* SCR_THATCH */, 40, 0, -45, 0.2, 90, 0.05, 270, 4, 1, 5, 157)
	script_execute(129/* SCR_THATCH */, -40, 0, -45, 0.2, 90, 0.05, 270, 4, -1, 5, 157)
	$Alarm0.start((firingspeed) / 30.0)

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
