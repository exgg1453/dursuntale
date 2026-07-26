# Auto-converted from GameMaker: obj_generalsiner
extends Node2D

func _ready():
	a= 0
	b= 0
	c= 0
	qq= 1
	ww= 1
	drawngr= 0
	xx= x
	yy= y
	modulate.a= 0.9
	idealww= 0
	width= 240

func _gm_event_1_0():
	if(drawngr == 1) sprite_delete(gr)

func _gm_event_7_5():
	if(drawngr == 1) sprite_delete(gr)

func _gm_event_7_0():
	if(drawngr == 1) sprite_delete(gr)
	gr= sprite_create_from_screen_x(xx, yy, width, obj_uborder.y - yy, 0, 0, 0, 0)
	sprite_index= gr
	if(GS.debug == 1 and Input.is_action_pressed("ui_accept")) {
	    if(Input.is_action_pressed("move_right")) qq+= 0.2
	    if(Input.is_action_pressed("move_left")) qq-= 0.2
	    if(Input.is_action_pressed("move_down")) ww--
	    if(Input.is_action_pressed("move_up")) ww++
	}
	scr_waver_height(qq, ww)
	drawngr= 1
	idealww2= idealww + random(6)
	if(ww > idealww2) ww-= 0.5
	if(ww < idealww2) ww+= 0.5
	if(idealww == 0.1 and ww < 2) instance_destroy()

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
