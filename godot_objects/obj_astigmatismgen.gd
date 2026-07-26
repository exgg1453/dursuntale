# Auto-converted from GameMaker: obj_astigmatismgen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	dmg= 0
	rate= GS.firingrate

func _gm_event_2_2():
	room_restart()

func _on_destroy():
	ab= instance_create(GS.idealborder[1] + 90, GS.idealborder[2] + random(c_borderheight(0) + 10) - 20, 393/* obj_astigmatism_bullet */)
	if(is_instance_valid(ab)) ab.dmg= dmg
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
