# Auto-converted from GameMaker: blt_icicle
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	dmg= 0
	image_speed= 0
	velocity.y= -6.5
	gravity= 0.13
	gravity_direction= 270

func _process_end(delta: float):
	if(GS.turntimer < 1) instance_destroy()

func _gm_event_7_0():
	queue_free()

func _on_outside_room():
	if(velocity.y > 0) frame= 0
	else  frame= 1
	draw_self_border()
	if(y > GS.idealborder[3] + 60) instance_destroy()

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
