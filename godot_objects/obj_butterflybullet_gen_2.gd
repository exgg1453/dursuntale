# Auto-converted from GameMaker: obj_butterflybullet_gen_2
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	dmg= 0
	rate= GS.firingrate

func _gm_event_2_2():
	sleep_x(1000)
	room_restart()

func _on_destroy():
	instance_create(obj_heart.x - 50, GS.idealborder[3] + 20, 395/* obj_butterflybullet_2 */)
	instance_create(obj_heart.x + 10, GS.idealborder[3] + 20, 395/* obj_butterflybullet_2 */)
	instance_create(obj_heart.x + 70, GS.idealborder[3] + 20, 395/* obj_butterflybullet_2 */)
	if(instance_exists(395/* obj_butterflybullet_2 */))
	    obj_butterflybullet_2.dmg= dmg
	$Alarm0.start((rate) / 30.0)

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
