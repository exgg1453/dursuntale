# Auto-converted from GameMaker: obj_freakbulletgen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)

func _on_destroy():
	dir= random(360)
	x= GS.idealborder[0] + random(GS.idealborder[1] - GS.idealborder[0])
	y= GS.idealborder[2] + random(GS.idealborder[3] - GS.idealborder[2])
	if(collision_rectangle(x - 10, y - 10, x + 10, y + 10, 743, 0, 1)) {
	    x= obj_heart.x + 8 + lengthdir_x(24 + random(12), dir)
	    y= obj_heart.y + 8 + lengthdir_y(24 + random(12), dir)
	}
	instance_create(x, y, 542/* obj_freakbullet */)
	$Alarm0.start((3 + random(3)) / 30.0)

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
