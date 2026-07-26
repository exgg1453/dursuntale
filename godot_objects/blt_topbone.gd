# Auto-converted from GameMaker: blt_topbone
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
	active= 1
	captured= 0

func _on_outside_room():
	l= 0
	t= 0
	w= sprite_width
	h= sprite_height
	ll= GS.idealborder[0] - x + 1
	tt= GS.idealborder[2] - y + 1
	ww= x + w - GS.idealborder[1] - 1
	hh= y + h - GS.idealborder[3] - 1
	if(ll > 0) l+= ll
	if(tt > 0) t+= tt
	if(ww > 0) w-= ww
	if(hh > 0) h-= hh
	w= round(w)
	h= round(h)
	l= round(l)
	t= round(t)
	if(w > 0 and h > 0 and l < w and t < h) {
	    if(blue == 1) frame= 1
	    draw_sprite_part(105, frame, l, t, w - l, h - t, x + l, y + t)
	    draw_sprite_part(106, frame, l, t, w - l, h - t, x + l, GS.idealborder[2] + 6)
	}
	if(x > GS.idealborder[0] - 5 and x < GS.idealborder[1] - 4) {
	    drawn= 1
	    draw_set_color(16777215)
	    if(blue == 1) draw_set_color(16754964)
	    draw_rectangle(x + 3, y, x + 9, GS.idealborder[2] + 10, 0)
	}
	if(abs(obj_heart.x - x) < 15 and GS.invc < 1 and collision_rectangle(x + 3, y, x + 9, GS.idealborder[2] + 10, 743, 0, 1))
	    event_user(1)
	if(x < GS.idealborder[0] - 10 and velocity.x < 0)
	    instance_destroy()
	if(x > GS.idealborder[1] + 10 and velocity.x > 0)
	    instance_destroy()

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
