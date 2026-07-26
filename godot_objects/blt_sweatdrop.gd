# Auto-converted from GameMaker: blt_sweatdrop
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	speed= 3.5
	visible= 0
	gg= instance_number(object_index) % 4
	if(gg < 2) {
	    x= obj_lborder.x + random(c_borderwidth(0))
	    y= GS.idealborder[2] - 40
	    direction= 270
	}
	if(gg == 2) {
	    x= GS.idealborder[0] - 16
	    y= GS.idealborder[2] - 40 + random(118) * 1.5
	    if(gg == 2) direction= 310
	}
	if(gg == 3) {
	    x= GS.idealborder[1] + 16
	    y= GS.idealborder[2] - 40 + random(118) * 1.5
	    if(gg == 3) direction= 235
	}
	modulate.a= 0
	visible= 1
	dmg= 8

func _on_outside_room():
	if(modulate.a < 1) modulate.a+= 0.05
	draw_self_border_ext(1, 1, 16777215, modulate.a)

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
