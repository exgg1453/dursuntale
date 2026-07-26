# Auto-converted from GameMaker: obj_boneloop_v
# GM parent: obj_sansbullet_parent
extends Node2D

func _ready():
	velocity.y= 4
	innate_karma= 5

func _process(delta: float):
	if(velocity.y < 0 and y < GS.idealborder[2] - sprite_height)
	    y= GS.idealborder[3]
	if(velocity.y > 0 and y > GS.idealborder[3])
	    y= GS.idealborder[2] - sprite_height
	if(velocity.x < 0 and x < 0) instance_destroy()
	if(velocity.x > 0 and x > get_viewport_rect().size.x) instance_destroy()

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
