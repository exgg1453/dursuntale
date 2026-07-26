# Auto-converted from GameMaker: obj_mhd
extends Node2D

func _ready():
	r[0]= 2
	raspeed[0]= (2 + random(2)) * choose(1, -1)
	rno[0]= 10
	rang[0]= 20
	rspeed[0]= 2
	$Alarm5.start((130) / 30.0)
	modulate.a= 0.1
	spec= 0

func _gm_event_2_5():
	instance_destroy()

func _on_outside_room():
	if(spec == 0) {
	    i= 0
	    while(i < rno[0]) {
	        xx= x + lengthdir_x(r[0], rang[0] + i * 360 / rno[0])
	        yy= y + lengthdir_y(r[0], rang[0] + i * 360 / rno[0])
	        draw_sprite_ext(2406/* spr_monsterheart_place */, 0, xx, yy, 1, 1, 0, 16777215, modulate.a)
	        i++
	    }
	}
	if(spec == 1) {
	    i= 0
	    while(i < rno[0]) {
	        xx= x + lengthdir_x(r[0], rang[0] + i * 360 / rno[0])
	        yy= y + lengthdir_y(r[0], rang[0] + i * 360 / rno[0])
	        if(i == 0) col= 16776960
	        if(i == 1) col= 16711680
	        if(i == 2) col= 32768
	        if(i == 3) col= 65535
	        if(i == 4) col= 4235519
	        if(i == 5) col= 8388736
	        draw_sprite_ext(2407/* spr_humanheart_place */, 0, xx, yy, 1, 1, 0, col, modulate.a)
	        i++
	    }
	}
	rang[0]+= raspeed[0]
	r[0]+= rspeed[0]
	if(modulate.a < 1) modulate.a+= 0.02
	if(spec == 1 and r[0] > 30) {
	    r[0]= 30
	    $Alarm5.start((-1) / 30.0)
	    rspeed[0]= 0
	    z_index= -2
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
