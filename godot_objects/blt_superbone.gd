# Auto-converted from GameMaker: blt_superbone
# GM parent: blt_sizebone
extends Node2D

func _ready():
	dmg= 3
	image_speed= 0
	blue= 0
	osc= 0
	oscmax= 20
	oscmin= 20
	drawn= 0
	captured= 0
	active= 1
	GS.border= 5
	movinged= 0
	appear= 0

func _on_outside_room():
	draw_self_border()
	if(x < GS.idealborder[1] + 40 and x > GS.idealborder[1] + 10 and obj_heart.x > GS.idealborder[1] - 60 and appear == 0) {
	    appear= 1
	    y= obj_heart.y
	}
	if(x < GS.idealborder[0] + 20 and velocity.x < 0)
	    GS.border= 5
	if(x < GS.idealborder[0] - 40 and velocity.x < 0)
	    instance_destroy()
	if(x > GS.idealborder[1] + 100 and velocity.x > 0)
	    instance_destroy()
	if(GS.invc < 2 and abs(obj_heart.x + 30 - x) < 80 and collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 743, 0, 1))
	    event_user(1)

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
