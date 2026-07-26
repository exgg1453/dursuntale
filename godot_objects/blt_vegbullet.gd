# Auto-converted from GameMaker: blt_vegbullet
# GM parent: blt_parent
extends Node2D

func _ready():
	if(instance_exists(597/* obj_parsnik */)) sprite_index= 53/* spr_vegbullet_snake */
	dmg= 0
	image_speed= 0
	frame= round(random(5))
	graivty_direction= 270
	gravity= 0.2
	r= round(random(1))
	if(r == 0) velocity.x= 2 + random(0.2)
	if(r == 1) velocity.x= -2 - random(0.2)
	y-= 8
	if(x < GS.idealborder[0] + 20) x+= 20
	green= 0

func _process_end(delta: float):
	if(GS.turntimer < 1) instance_destroy()

func _on_alarm_0_timeout():
	y= yprevious
	velocity.y= -velocity.y / 1.2

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
