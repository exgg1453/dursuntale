# Auto-converted from GameMaker: obj_glydeshot
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	siner= 0
	scale.x= 2
	scale.y= 2
	aa= choose(2, -2)
	direction= 300 - random(60)
	speed= 7
	friction= random(-0.1)
	dmg= 9
	if(instance_exists(228/* obj_glydeb */))
	    dmg= GS.monsteratk[obj_glydeb.myself]

func _on_outside_room():
	siner++
	rotation_degrees+= aa
	draw_sprite_ext(241/* spr_glydeshot */, 0, x, y, scale.x, scale.y, rotation_degrees, image_blend, 0.7 + sin(siner / 3))
	draw_sprite_ext(241/* spr_glydeshot */, 1, x, y, scale.x, scale.y, rotation_degrees + 45, image_blend, -sin(siner / 3) + 0.7)
	if(scale.x < 3) {
	    scale.x+= 0.05
	    scale.y+= 0.05
	}
	if(y > 500) instance_destroy()
	if(GS.turntimer < 2) instance_destroy()

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
