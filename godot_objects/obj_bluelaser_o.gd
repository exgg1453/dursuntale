# Auto-converted from GameMaker: obj_bluelaser_o
extends Node2D

func _ready():
	image_speed= 0.5
	ex= 0
	active= 1
	siner= 0
	blue= 1
	remembervelocity.x= 0
	event_user(1)
	if(room == 166) {
	    if(GS.flag[372] == 1) active= 2
	    if(GS.plot > 160) active= 2
	}
	if(GS.plot > 184) active= 2
	if(GS.flag[7] == 1) active= 2
	activebuffer= 0

func _gm_event_2_4():
	velocity.x= 0
	remembervelocity.x= 0

func _gm_event_2_3():
	velocity.x= 0
	remembervelocity.x= 0
	active= 2

func _gm_event_2_2():
	speed= myspeed
	remembervelocity.x= myspeed

func _on_destroy():
	if(room != 195 and active != 2) active= 1
	GS.border= 0
	GS.flag[15]= 0
	GS.flag[16]= 0
	if(room == 192 or room == 195) GS.flag[15]= 1

func _on_alarm_0_timeout():
	x= xprevious
	velocity.x= -velocity.x

func _gm_event_7_11():
	blue= 1
	velocity.x= -3
	remembervelocity.x= velocity.x

func _gm_event_7_10():
	check= 1
	if(blue == 1 and obj_mainchara.x == obj_mainchara.xprevious and obj_mainchara.y == obj_mainchara.yprevious)
	    check= 0
	if(blue == 2 and (obj_mainchara.x != obj_mainchara.xprevious or obj_mainchara.y != obj_mainchara.yprevious))
	    check= 0
	if(check == 1 and GS.interact == 0) {
	    GS.border= 20
	    GS.flag[15]= 1
	    GS.flag[16]= 1
	    GS.flag[370]= 2
	    if(room == 192 or room == 193) GS.flag[370]= 3
	    SCR_BORDERSETUP()
	    instance_create(0, 0, 144/* obj_battlerquick */)
	    obj_bluelaser_o.active= 0
	    obj_bluelaser_o.$Alarm0.start((60) / 30.0)
	}

func _on_outside_room():
	siner++
	draw_sprite(sprite_index, frame, x, y)
	if(active != 2) {
	    draw_set_alpha(abs(sin(siner / 3)) / 2 + 0.5)
	    if(active == 0) {
	        draw_set_alpha(0.3)
	        image_speed= 0
	    } else  image_speed= 0.5
	    if(blue == 1) {
	        draw_set_color(16754964)
	        sprite_index= 1857/* spr_lasermachine_b */
	    }
	    if(blue == 2) {
	        draw_set_color(4235519)
	        sprite_index= 1856/* spr_lasermachine_o */
	    }
	    draw_rectangle(x + 8, y + 16, x + 11, y + 320, 0)
	    if(active == 1 and activebuffer < 0 and collision_rectangle(x + 9, y + 18, x + 10, y + 320, 1570, 0, 1))
	        event_user(0)
	} else  sprite_index= 1858/* spr_lasermachine_off */
	draw_set_alpha(1)
	if(ex == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    $Alarm3.start((1) / 30.0)
	    ex= 0
	}
	activebuffer--
	if(active != 1) activebuffer= 1

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
