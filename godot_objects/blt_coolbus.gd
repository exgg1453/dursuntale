# Auto-converted from GameMaker: blt_coolbus
# GM parent: blt_sizebone
extends Node2D

func _ready():
	dmg= 6
	image_speed= 0
	blue= 0
	osc= 0
	oscmax= 20
	oscmin= 20
	drawn= 0
	captured= 0
	active= 1
	movinged= 0

func _on_outside_room():
	draw_self_border()
	if(x < GS.idealborder[0] - 100 and velocity.x < 0)
	    instance_destroy()
	if(x > GS.idealborder[1] + 100 and velocity.x > 0)
	    instance_destroy()
	if(instance_exists(638/* blt_superbone */) and x < GS.idealborder[1] and obj_time.up == 1 and movinged == 0 and obj_heart.x < blt_superbone.x + 20 and obj_heart.y > 50) {
	    GS.border= 51
	    if(obj_heart.y < 270)
	        GS.idealborder[2]= round((obj_heart.y - 20) / 5) * 5
	    // blt_coolbus
	    with(637) movinged= 1
	    if(obj_heart.velocity.y >= -2 and obj_heart.yprevious > obj_heart.y)
	        obj_heart.velocity.y= -2
	}
	movinged= 0
	if(GS.invc < 2 and abs(obj_heart.x + 25 - x) < 50 and collision_rectangle(x + 5, y + 10, x + 55, GS.idealborder[3] - 10, 743, 0, 1))
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
