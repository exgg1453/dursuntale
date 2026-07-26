# Auto-converted from GameMaker: obj_lighttower
extends Node2D

func _ready():
	ts= 0
	on= 0
	if(room == 174 and GS.flag[400] > 0) on= 1
	if(room == 172 and GS.flag[399] > 0) on= 1
	if(room == 149 and GS.flag[374] > 0) on= 1
	if(room == 151 and GS.flag[375] > 0) on= 1
	$Alarm0.start((1) / 30.0)

func _on_outside_room():
	draw_sprite(992/* spr_lighttower */, 0, x, y)
	draw_sprite(994/* spr_towersymbol_off */, ts / 6, x + 25, y + 11)
	if(on == 1) {
	    draw_sprite(993/* spr_towersymbol_on */, ts / 6, x + 25, y + 11)
	    ts++
	}

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
