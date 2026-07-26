# Auto-converted from GameMaker: obj_labelevator_open
extends Node2D

func _ready():
	xreveal= 0
	if(GS.entrance == 24) {
	    con= 1
	    GS.interact= 1
	    $Alarm4.start((120) / 30.0)
	} else  {
	    con= 4
	    xreveal= 20
	}

func _gm_event_2_4():
	con++

func _on_outside_room():
	draw_set_color(0)
	draw_set_alpha(0.3)
	draw_rectangle(-10, -10, 999, 999, 0)
	draw_set_alpha(1 - xreveal / 40)
	draw_rectangle(-10, -10, 160 - xreveal, 300, 0)
	draw_rectangle(160 + xreveal, -10, 340, 300, 0)
	draw_set_alpha(1)
	if(con == 1) GS.interact= 1
	if(con == 2) {
	    if(xreveal == 0) snd_play(13/* snd_spearappear */)
	    xreveal+= 2
	    if(xreveal >= 20) {
	        snd_play(21/* snd_impact */)
	        xreveal= 20
	        GS.interact= 0
	        con= 3
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
