# Auto-converted from GameMaker: obj_innevent1
extends Node2D

func _ready():
	specialsong= caster_load("music/snoresymphony.ogg")
	$Alarm0.start((10) / 30.0)
	fadein= 0
	GS.flag[73]= 1
	$Alarm4.start((880) / 30.0)
	vol= 0
	$Alarm5.start((2) / 30.0)
	GS.interact= 1

func _gm_event_2_5():
	nn= instance_find(1294, 1)
	nn.$Alarm0.start((42) / 30.0)
	jj= instance_find(1294, 2)
	jj.$Alarm0.start((82) / 30.0)
	GS.interact= 1

func _gm_event_2_4():
	fadein= 2

func _gm_event_2_3():
	GS.entrance= 2
	caster_free(-3)
	instance_create(0, 0, 148/* obj_persistentfader */)
	room_goto_previous()

func _gm_event_2_2():
	instance_create(0, 0, 149/* obj_unfader */)
	$Alarm3.start((15) / 30.0)

func _on_destroy():
	caster_play(specialsong, 0.2, 1)
	fadein= 1

func _process(delta: float):
	GS.interact= 1
	if(fadein == 1 and vol < 0.9) {
	    vol+= 0.01
	    caster_set_volume(specialsong, vol)
	}
	if(fadein == 2 and vol > 0) {
	    vol-= 0.02
	    caster_set_volume(specialsong, vol)
	    if(vol < 0.02) {
	        $Alarm2.start((10) / 30.0)
	        vol= 0
	    }
	}
	if(keyboard_multicheck_pressed(0/* NOKEY */) and vol > 0.6)
	    fadein= 2

func _on_outside_room():
	draw_set_color(0)
	draw_set_alpha(0.5)
	draw_rectangle(-1, -1, get_viewport_rect().size.x + 1, get_viewport_rect().size.y + 1, 0)
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
