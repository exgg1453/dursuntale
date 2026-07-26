# Auto-converted from GameMaker: blt_chasefire1
# GM parent: blt_parent
extends Node2D

func _ready():
	instance_create(x + sprite_width / 2 - 8, y + sprite_width / 2 - 8, 682/* blt_gen */)
	dmg= 4
	if(GS.hp < 7) dmg= 2
	image_speed= 0.5
	if(x < GS.idealborder[0]) instance_destroy()
	$Alarm0.start((40) / 30.0)
	$Alarm1.start((45) / 30.0)
	bounced= 0

func _gm_event_2_2():
	if(obj_heart.x > x) velocity.x+= 0.1
	else  velocity.x-= 0.1
	if(obj_heart.y > y) velocity.y+= 0.1
	else  velocity.y-= 0.1
	$Alarm2.start((2) / 30.0)

func _gm_event_2_1():
	move_towards_point(obj_heart.x + 2, obj_heart.y + 2, 2)
	friction= -0.05
	$Alarm2.start((4) / 30.0)
	dmg= 5
	if(GS.hp < 7) dmg= 2

func _process(delta: float):
	if(y > GS.idealborder[3] + 4) instance_destroy()

func _on_alarm_0_timeout():
	velocity.y= -velocity.y
	if(bounced == 1) instance_destroy()
	friction= 0.04

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
