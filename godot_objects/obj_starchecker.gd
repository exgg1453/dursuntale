# Auto-converted from GameMaker: obj_starchecker
extends Node2D

func _ready():
	vol= caster_get_volume(GS.currentsong)
	caster_set_volume(GS.currentsong, vol / 2)
	xbound= x
	xbound2= x + 320
	ybound= y
	ybound2= y + 240
	st= instance_create(x, y, 1363/* obj_npc_marker */)
	st.visible= 1
	st.z_index= -10
	st.sprite_index= 1472/* spr_starpattern */
	st.image_speed= 0.2
	if(room == 95) sprite_index= 1471/* spr_starcheckeredit2 */
	buffer= 0
	$Alarm0.start((2) / 30.0)
	image_speed= 0.1
	dest= 0
	dest_timer= 0

func _gm_event_1_0():
	with(st) instance_destroy()
	caster_set_volume(GS.currentsong, vol)
	GS.interact= 0

func _on_destroy():
	buffer= 1
	GS.interact= 1

func _process(delta: float):
	GS.interact= 1
	if(obj_time.left == 1) x-= 4
	if(obj_time.right == 1) x+= 4
	if(obj_time.up == 1) y-= 4
	if(obj_time.down == 1) y+= 4
	if(bbox_left < xbound) x= xprevious
	if(bbox_right > xbound2) x= xprevious
	if(bbox_bottom > ybound2) y= yprevious
	if(bbox_top < ybound) y= yprevious
	if(buffer == 1 and (keyboard_multicheck_pressed(0/* NOKEY */) == 1 or keyboard_multicheck_pressed(1/* ANYKEY */) == 1))
	    dest= 1
	if(dest == 1) dest_timer++
	if(dest_timer >= 2) instance_destroy()

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	draw_set_color(0)
	draw_rectangle(0, 0, 1200, bbox_top, 0)
	draw_rectangle(0, 1200, 1200, bbox_bottom, 0)
	draw_rectangle(0, 0, bbox_left, 1200, 0)
	draw_rectangle(bbox_right, 0, 1200, 1200, 0)

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
