# Auto-converted from GameMaker: obj_nextbattle_pl
extends Node2D

func _on_outside_room():
	draw_set_color(16777215)
	draw_text_transformed(300, 100, "waiting for the#next battle...", 2, 2, random(3))
	if(GS.attacktype != 50)
	    draw_text_transformed(300, 200, "attack Number" + string(GS.attacktype + 1), 2, 2, random(6))
	else 
	    draw_text_transformed(300, 200, "final attack" + string(GS.attacktype + 1), 2, 2, random(6))
	draw_text(100, 200, string(GS.healno) + " heal items left")
	draw_text(100, 220, "press H to use one")
	draw_text(100, 300, "your HP is " + string(GS.testhp) + "/20")
	draw_text(100, 400, "press SPACE to continue")
	if(GS.attacktype == 38 or GS.attacktype == 39) {
	    draw_set_color(16711680)
	    draw_text(300, 300, "blue lasers don\'t hit#you if you don\'t#move")
	}

func _gm_event_9_72():
	if(GS.healno > 0 and GS.testhp < 20) {
	    GS.testhp= 20
	    GS.healno--
	}

func _gm_event_9_32():
	if(GS.attacktype != 49) GS.attacktype++
	else  GS.attacktype= 56
	get_tree().change_scene_to_file("res://godot_rooms/room0.tscn")

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
