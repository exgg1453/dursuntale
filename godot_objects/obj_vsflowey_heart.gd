# Auto-converted from GameMaker: obj_vsflowey_heart
extends Node2D

func _ready():
	GS.my_hp= 50
	GS.my_inv= 0
	event_user(4)
	image_speed= 0
	move= 1
	GS.typer= 70
	GS.msc= 0
	GS.msg[0]= "* Big boner down the lane^8 %%"
	GS.msg[1]= "* Big boner down the lane^4 %%"
	GS.msg[2]= "* Big boner down the lane^4 %%"
	GS.msg[3]= "* Big boner down the lane^4 %%"
	GS.msg[4]= "* Big boner down the lane^4 %%"
	GS.msg[5]= "%%%"
	special= 0

func _gm_event_2_5():
	snd_play(153/* snd_break1_c */)
	x-= 2
	sprite_index= 44/* spr_heartbreak */

func _process(delta: float):
	if(move == 1) {
	    if(Input.is_action_pressed("move_left") and x > 0 and (obj_flowey_master.darkmode != 0 or x > 108))
	        x-= 4
	    if(Input.is_action_pressed("move_right") and x < get_viewport_rect().size.x - sprite_width and (obj_flowey_master.darkmode != 0 or x < 512))
	        x+= 4
	    if(Input.is_action_pressed("move_up") and y > 0 and (obj_flowey_master.darkmode != 0 or y > 268))
	        y-= 4
	    if(Input.is_action_pressed("move_down") and y < get_viewport_rect().size.y - sprite_height)
	        y+= 4
	}
	GS.my_inv--
	if(GS.my_inv > 0) image_speed= 0.5
	else  {
	    frame= 0
	    image_speed= 0
	}
	if(GS.my_hp <= 0 and special == 0)
	    instance_create(x, y, 1600/* obj_vsflowey_heartdefeated */)

func _gm_event_7_15():
	scr_floweybodyload()

func _gm_event_7_14():
	scr_floweybodysave()

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)

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
