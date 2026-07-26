# Auto-converted from GameMaker: obj_targetguy
extends Node2D

func _ready():
	defeat= 0
	dx1= 0
	dx2= 0
	dxtimer= 0

func _on_alarm_0_timeout():
	defeat= 1
	snd_play(31/* snd_break1 */)
	// other
	with(-2) instance_destroy()
	if(instance_exists(1244/* obj_shootguy */)) {
	    obj_shootguy.buffer= 60
	    obj_shootguy.win= 1
	    obj_shootguy.$Alarm2.start((30) / 30.0)
	}

func _on_outside_room():
	if(defeat == 0) draw_sprite(sprite_index, 0, x, y)
	if(defeat == 1) {
	    dxtimer++
	    draw_sprite_ext(sprite_index, 1, x - dx1, y, 1, 1, 0, 16777215, modulate.a)
	    draw_sprite_ext(sprite_index, 2, x + dx2, y, 1, 1, 0, 16777215, modulate.a)
	}
	if(dxtimer > 25) {
	    if(dxtimer == 26) snd_play(30/* snd_break2 */)
	    modulate.a-= 0.04
	    dx1+= 0.5
	    dx2+= 0.5
	    if(modulate.a < 0.1) instance_destroy()
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
