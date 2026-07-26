# Auto-converted from GameMaker: obj_memoryhead_body
extends Node2D

func _ready():
	image_speed= 0
	$Alarm0.start((8) / 30.0)
	bb= 1
	cc= 1
	dd= 1
	a= 1
	b= 1
	c= 1
	d= 1
	$Alarm1.start((150) / 30.0)
	on= 0
	mega= 0
	pause= 0
	dontcomeback= 0

func _gm_event_2_2():
	$Alarm1.start((90 + random(30)) / 30.0)
	on= 0

func _gm_event_2_1():
	dd= floor(random(12))
	bb= choose(1, 2, 4, 8)
	cc= choose(1, 2, 3, 4, 6, 8, 10, 16)
	on= 1
	$Alarm2.start((60) / 30.0)

func _on_destroy():
	frame++
	$Alarm0.start((8) / 30.0)

func _gm_event_7_10():
	if(mega == 0) {
	    $Alarm2.start((-1) / 30.0)
	    $Alarm1.start((-1) / 30.0)
	    mega= 1
	    on= 1
	}
	if(mega == 4) mega= 2

func _on_outside_room():
	if(bb == 0) bb= 1
	if(cc == 0) cc= 1
	if(dd == 0) dd= 1
	if(on == 1) scr_fx_waver_scanline(bb, cc, dd)
	else 
	    draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, 16777215, 1)
	if(mega == 1) {
	    cc++
	    modulate.a-= 0.03
	    if(modulate.a <= 0) mega= 4
	}
	if(mega == 2) {
	    if(cc > 1) cc--
	    if(modulate.a < 1) modulate.a+= 0.03
	    if(cc <= 1) {
	        mega= 0
	        on= 0
	        $Alarm2.start((-1) / 30.0)
	        $Alarm1.start((90) / 30.0)
	    }
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
