# Auto-converted from GameMaker: obj_spiderbulletparent
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	$Alarm0.timeout.connect(_on_alarm_0_timeout)

func _on_alarm_0_timeout():
	scr_damagestandard_x()
	if(GS.hp <= 0) {
	    obj_heart.x= obj_purpleheart.x
	    obj_heart.y= obj_purpleheart.y
	}

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
