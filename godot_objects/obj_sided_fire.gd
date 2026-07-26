# Auto-converted from GameMaker: obj_sided_fire
# GM parent: obj_asgorebulparent
extends Node2D

func _ready():
	side= choose(0, 1)
	if(side == 0) {
	    y= GS.idealborder[2] - sprite_height - 5
	    velocity.y= 9 + random(0.5)
	}
	if(side == 1) {
	    velocity.y= -9 - random(0.5)
	    y= GS.idealborder[3] + 5
	}
	velocity.x= random(0.5) * choose(1, -1)

func _process(delta: float):
	if(y > GS.idealborder[3] and velocity.y > 0) instance_destroy()
	if(y < GS.idealborder[2] - sprite_height and velocity.y < 0)
	    instance_destroy()
	if(collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 743, 0, 1))
	    event_user(0)

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
