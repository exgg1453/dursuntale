# Auto-converted from GameMaker: obj_skyorb
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	velocity.y= 4
	$Alarm11.start((15) / 30.0)
	dmg= 5

func _gm_event_2_11():
	type= choose(0, 1)
	snd_play(30/* snd_break2 */)
	instance_create(0, 0, 118/* obj_flasher */)
	if(type == 0) cc= instance_create(x, y, 375/* obj_skymoon */)
	if(type == 1) cc= instance_create(x, y, 376/* obj_sunmoon */)
	cc.dmg= dmg
	instance_destroy()

func _on_alarm_0_timeout():
	scr_damagestandard(0, 2, 0, 0, 90)

func _on_outside_room():
	draw_self_border()

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
