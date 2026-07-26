# Auto-converted from GameMaker: obj_lasergen1
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	GS.turntimer= 200
	firingspeed= GS.firingrate
	$Alarm0.start(20 / 30.0)

func _on_destroy():
	script_execute(128/* SCR_LASER */, 0, 0, 200, obj_heart.y + 80, 0.2, 270, -0.6, -8, -12, 157)
	$Alarm0.start((firingspeed * 2) / 30.0)

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
