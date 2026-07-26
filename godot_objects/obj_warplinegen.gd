# Auto-converted from GameMaker: obj_warplinegen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm1.start((1) / 30.0)
	otheri= 0

func _gm_event_2_1():
	xx= GS.idealborder[0] + random(c_borderwidth(0))
	if(otheri == 0) {
	    yy= -40
	    xx= obj_heart.x + 10
	    otheri= 1
	} else  {
	    otheri= 0
	    yy= get_viewport_rect().size.y + 40
	}
	instance_create(xx, yy, 316/* obj_warplinebullet */)
	$Alarm1.start((18) / 30.0)
	if(instance_exists(308/* obj_greenarmor */)) $Alarm1.start((24) / 30.0)

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
