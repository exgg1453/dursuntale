# Auto-converted from GameMaker: obj_fakebridge
extends Node2D

func _ready():
	justdoit= 0
	drawamt= 0
	$Alarm3.start((2) / 30.0)

func _gm_event_2_5():
	if(drawamt < sprite_width) {
	    drawamt+= 8
	    snd_play(92/* snd_chug */)
	    $Alarm5.start((15) / 30.0)
	}
	if(drawamt >= sprite_width) {
	    drawamt= sprite_width
	    $Alarm5.start((-1) / 30.0)
	    justdoit= 6
	}

func _gm_event_2_4():
	justdoit++

func _gm_event_2_3():
	drawamt= sprite_width

func _process(delta: float):
	if(justdoit == 1 and GS.interact == 0) {
	    $Alarm3.start((-1) / 30.0)
	    GS.interact= 1
	    caster_pause(GS.currentsong)
	    justdoit= 2
	    $Alarm4.start((20) / 30.0)
	    drawamt= 0
	}
	if(justdoit == 3) {
	    $Alarm5.start((1) / 30.0)
	    justdoit= 4
	}
	if(justdoit == 6) {
	    justdoit= 7
	    $Alarm4.start((20) / 30.0)
	}
	if(justdoit == 8) {
	    GS.interact= 0
	    justdoit= 9
	    caster_resume(GS.currentsong)
	}

func _on_outside_room():
	draw_sprite_part(sprite_index, 0, 0, 0, drawamt, sprite_height, x, y)

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
