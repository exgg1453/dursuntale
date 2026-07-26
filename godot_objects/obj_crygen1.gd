# Auto-converted from GameMaker: obj_crygen1
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm0.start((10) / 30.0)
	dmg= 0

func _on_destroy():
	myx= GS.monsterinstance[myself].x
	myy= GS.monsterinstance[myself].y
	blt1= instance_create(myx + 52, myy + 48, 632/* blt_crybullet */)
	blt2= instance_create(myx + 82, myy + 58, 632/* blt_crybullet */)
	blt1.dmg= dmg
	blt2.dmg= dmg
	$Alarm0.start((GS.firingrate) / 30.0)

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
