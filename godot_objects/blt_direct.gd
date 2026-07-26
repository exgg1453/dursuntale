# Auto-converted from GameMaker: blt_direct
# GM parent: blt_parent
extends Node2D

func _ready():
	sprite_index= GS.bulletappearance
	myspeed= GS.bulletvariable[0]
	mydirection= GS.bulletvariable[6]
	mydirectionalspeed= GS.bulletvariable[7]
	myrandomspeed= GS.bulletvariable[1]
	mydirectionrandom= GS.bulletvariable[2]
	gravity= GS.bulletvariable[3]
	gravity_direction= GS.bulletvariable[4]
	friction= GS.bulletvariable[5]
	instance_create(x + sprite_width / 2 - 8, y + sprite_width / 2 - 8, 682/* blt_gen */)
	dmg= 0
	action_move_point(obj_heart.x, obj_heart.y, myspeed + random(myrandomspeed) * 2 - myrandomspeed)

	action_set_motion(mydirection, mydirectionalspeed + random(myrandomspeed) * 2 - myrandomspeed)

	direction+= random(mydirectionrandom) * 2 - mydirectionrandom
	if(sprite_index == 157) image_speed= 0

func _process(delta: float):
	if(sprite_index == 157)
	    frame= round(direction / 10)

func _gm_event_7_0():
	queue_free()

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
