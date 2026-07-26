# Auto-converted from GameMaker: obj_rotspear
extends Node2D

func _ready():
	fade= 0
	modulate.a= 0
	deactivate= 0
	dmg= 12

func _process(delta: float):
	if(deactivate == 0 and modulate.a < 1)
	    modulate.a+= 0.2
	if(deactivate == 1) {
	    modulate.a-= 0.2
	    if(modulate.a < 0.3) instance_destroy()
	}
	xoff= lengthdir_x(25, rotation_degrees)
	yoff= lengthdir_y(25, rotation_degrees)
	if(modulate.a >= 0.8 and collision_line(x - xoff / 2, y - yoff / 2, x + xoff, y + yoff, 743, 1, 0))
	    scr_damagestandard_x()
	if(GS.turntimer < 1) instance_destroy()

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, 1, 1, rotation_degrees, 16777215, modulate.a)

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
