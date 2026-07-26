# Auto-converted from GameMaker: obj_ropebulgen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm0.start((10) / 30.0)
	dmg= 0

func _on_destroy():
	g= instance_create(GS.idealborder[1] + 10, GS.idealborder[2] - 100, 339/* obj_ropebul */)
	if(is_instance_valid(g)) g.dmg= dmg
	$Alarm0.start((24) / 30.0)

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
