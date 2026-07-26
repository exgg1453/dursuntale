# Auto-converted from GameMaker: obj_boxsiner
extends Node2D

func _ready():
	siner= 0
	fade= 0
	alpha= 1

func _on_outside_room():
	draw_set_color(32768)
	yoff= 0
	siner++
	if(fade == 1) alpha-= 0.01
	if(alpha <= 0) instance_destroy()
	repeat(2)  {
	    i= 0
	    while(i < 6) {
	        draw_set_alpha(alpha)
	        ysin= sin((i * 3 + siner / 2) / 8) * 20
	        draw_rectangle(20 + i * 100, 16 + yoff + ysin, 20 + (i + 1) * 100, 136 + yoff + ysin, 1)
	        i++
	    }
	    yoff= 120
	}
	draw_set_alpha(1)

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
