# Auto-converted from GameMaker: obj_bedlump
extends Node2D

func _ready():
	image_speed= 0
	moving= 0
	x1= 101
	y1= 60
	x2= 220 - sprite_width - 1
	y2= 115
	caster_free(-3)
	beat= caster_load("music/coolbeat.ogg")
	GS.interact= 1
	if(instance_exists(1570/* obj_mainchara */)) obj_mainchara.visible= 0
	mc= instance_create(x, y, 1363/* obj_npc_marker */)
	mc.sprite_index= 1051/* spr_mainchara_lie_2 */
	mc.z_index= 500020
	mc.visible= 1
	canmove= 0
	playing= 0
	con= 0
	mclock= 1
	$Alarm3.start((30) / 30.0)
	GR= 0

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	canmove= 1

func _process_begin(delta: float):
	moving= 0
	mr= 0
	ml= 0
	md= 0
	mu= 0
	if(con == 1) {
	    GS.interact= 1
	    if(instance_exists(1570/* obj_mainchara */)) obj_mainchara.visible= 0
	}
	if(canmove == 1) {
	    if(Input.is_action_pressed("move_right")) mr= 1
	    if(Input.is_action_pressed("move_left")) ml= 1
	    if(Input.is_action_pressed("move_down")) md= 1
	    if(Input.is_action_pressed("move_up")) mu= 1
	}
	if(x < x1 - 10 and con == 0) {
	    caster_stop(beat)
	    playing= -1
	    canmove= 0
	    con= 1
	}
	if(x > x2 + 10 and con == 0) {
	    caster_stop(beat)
	    playing= -1
	    canmove= 0
	    con= 5
	}
	if(con == 1) {
	    ml= 1
	    if(x < x1 - 31) {
	        con= 9
	        $Alarm4.start((20) / 30.0)
	    }
	}
	if(con == 5) {
	    mr= 1
	    if(x > x2 + 30) {
	        con= 9
	        $Alarm4.start((20) / 30.0)
	    }
	}
	if(con == 10) {
	    mclock= 0
	    con= 11
	    $Alarm4.start((4) / 30.0)
	    mc.velocity.y= 4
	}
	if(con == 12) {
	    snd_play(106/* snd_noise */)
	    mc.velocity.y= 0
	    con= 13
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 14) {
	    if(x < get_viewport_rect().size.x / 2) {
	        obj_mainchara.x= x1 - 22
	        obj_mainchara.y= mc.y - 8
	    } else  {
	        obj_mainchara.x= x2 + sprite_width + 2
	        obj_mainchara.y= mc.y - 8
	    }
	    GS.interact= 0
	    GS.facing= 0
	    obj_mainchara.visible= 1
	    con= 15
	    caster_free(beat)
	    with(mc) instance_destroy()
	    instance_destroy()
	}
	if(mr == 1) {
	    x++
	    moving= 1
	    if(GR == 0) GR= 1
	}
	if(ml == 1) {
	    x--
	    moving= 1
	    if(GR == 0) GR= 1
	}
	if(md == 1 and y < y2) {
	    y++
	    moving= 1
	    if(GR == 0) GR= 1
	}
	if(mu == 1 and y > y1) {
	    y--
	    moving= 1
	    if(GR == 0) GR= 1
	}
	if(moving == 1) {
	    if(playing == 0) caster_loop(beat, 0.8, 1)
	    if(playing == 1) caster_resume(beat)
	    playing= 2
	    GR+= 0.2
	}
	if(moving == 0) {
	    if(playing == 2) {
	        caster_pause(beat)
	        playing= 1
	    }
	    GR= 0
	}
	if(mclock == 1) {
	    mc.x= x
	    mc.y= y + 5
	}

func _on_outside_room():
	wc= 0
	wc2= 0
	if(x < x1) wc= x1 - x
	if(x > x2) wc2= x - x2
	draw_sprite_part(sprite_index, GR, wc, 0, sprite_width - wc - wc2, sprite_height, x + wc, y)

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
