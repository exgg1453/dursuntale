# Auto-converted from GameMaker: obj_true_lavawaver
extends Node2D

func _ready():
	x= view_xview[0] - 40
	y= view_yview[0] - 40
	init_band= 0
	a= 0
	b= 0
	c= 0
	siner= 0
	boff= 3.5
	coff= 3
	$Alarm0.start((1) / 30.0)

func _on_destroy():
	x= view_xview[0] - 40
	y= view_yview[0] - 40

func _process_end(delta: float):
	if(instance_exists(1570/* obj_mainchara */) and init_band == 0) {
	    if(room == 147 and obj_mainchara.x > 800) x= 800
	    if(room == 145 and obj_mainchara.y > 280) y= 160
	    if(room == 145 and obj_mainchara.x > 560) x= 500
	    init_band= 1
	}
	if(view_xview[0] > x + 60) x+= 20
	if(view_xview[0] < x + 20) x-= 20
	if(view_yview[0] > y + 70) y+= 40
	if(view_yview[0] < y + 10) y-= 40
	if(x < -40) x= -40
	if(x > get_viewport_rect().size.x - 360) x= get_viewport_rect().size.x - 360
	if(y > get_viewport_rect().size.y - 280) y= get_viewport_rect().size.y - 280
	if(y < -40) y= -40

func _on_outside_room():
	siner++
	scr_true_lavawaver(boff, coff)
	draw_set_alpha(sin(siner / 12) * 0.3 + 0.5)
	draw_set_color(0)
	draw_rectangle(view_xview[0] - 10, view_yview[0] - 10, view_xview[0] + 330, view_yview[0] + 250, 0)
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
