# Auto-converted from GameMaker: obj_melonbulgen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	xx= obj_heart.x - 160
	yy= obj_heart.y - 214
	instance_create(xx + 112, yy + 230, 526/* obj_melontooth */)
	instance_create(xx + 140, yy + 248, 526/* obj_melontooth */)
	instance_create(xx + 198, yy + 248, 526/* obj_melontooth */)
	instance_create(xx + 172, yy + 256, 526/* obj_melontooth */)
	instance_create(xx + 228, yy + 228, 526/* obj_melontooth */)
	instance_create(xx + 112, yy + 176, 526/* obj_melontooth */)
	instance_create(xx + 136, yy + 186, 526/* obj_melontooth */)
	instance_create(xx + 170, yy + 190, 526/* obj_melontooth */)
	instance_create(xx + 200, yy + 188, 526/* obj_melontooth */)
	instance_create(xx + 228, yy + 178, 526/* obj_melontooth */)
	instance_create(xx + 128, yy + 132, 527/* obj_meloneye */)
	instance_create(xx + 210, yy + 134, 527/* obj_meloneye */)
	dmg= 9

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
