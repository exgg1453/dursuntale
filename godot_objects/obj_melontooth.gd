# Auto-converted from GameMaker: obj_melontooth
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	direction= point_direction(x, y, obj_heart.x + 8, obj_heart.y + 8)
	rotation_degrees= direction
	rotation_degrees+= (x - obj_heart.x) / 2
	direction= rotation_degrees
	siner= random(360)
	scale.x= 2
	scale.y= 2
	overall= 0
	dmg= 8

func _process(delta: float):
	direction= point_direction(x, y, obj_heart.x + 8, obj_heart.y + 8)
	rotation_degrees= direction
	if(ystart < obj_heart.y + 8) {
	    rotation_degrees+= (x - obj_heart.x + 8) / 1.5
	    overall++
	}
	if(ystart > obj_heart.y + 8) {
	    rotation_degrees-= (x - obj_heart.x + 8) / 1.5
	    overall--
	}
	direction= rotation_degrees
	siner++
	x= xstart + lengthdir_x(sin(siner / 2) * 4, direction)
	y= ystart + lengthdir_y(sin(siner / 2) * 2, direction) + sin(overall / 4) * 6

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
