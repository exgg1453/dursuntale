# Auto-converted from GameMaker: obj_crygen3
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm0.start((10) / 30.0)
	dmg= 0
	$Alarm1.start((60) / 30.0)

func _gm_event_2_3():
	with(blcon) instance_destroy()
	with(blconwd) instance_destroy()
	obj_napstablook.mercymod= -50
	GS.msg[0]= "* Napstablook eagerly awaits&  your response."

func _gm_event_2_2():
	with(blconwd) instance_destroy()
	GS.msg[0]= "do you&like&it..."
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	$Alarm3.start((100) / 30.0)

func _gm_event_2_1():
	blcon= instance_create(obj_napstablook.x + 150, obj_napstablook.y + 24, 186/* obj_blconsm */)
	GS.msg[0]= "i call&it&" + chr(ord('"')) + "dapper&blook" + chr(ord('"')) + ""
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	$Alarm2.start((100) / 30.0)

func _on_destroy():
	myx= GS.monsterinstance[myself].x
	myy= GS.monsterinstance[myself].y
	blt1= instance_create(myx + 52, myy + 48, 633/* blt_crybullet2 */)
	blt2= instance_create(myx + 82, myy + 58, 633/* blt_crybullet2 */)
	blt1.dmg= 0
	blt2.dmg= 0
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
