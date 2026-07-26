# Auto-converted from GameMaker: obj_bombgen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm0.start((3) / 30.0)
	dmg= 0
	GS.border= 19
	SCR_BORDERSETUP()
	rate= GS.firingrate

func _on_destroy():
	randomx= (GS.idealborder[0] + GS.idealborder[1]) / 2 + 50 - random(100)
	b= instance_create(randomx, GS.idealborder[2] - 20, 345/* obj_bombbul */)
	if(is_instance_valid(b)) b.dmg= dmg
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
