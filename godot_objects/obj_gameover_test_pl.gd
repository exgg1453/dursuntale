# Auto-converted from GameMaker: obj_gameover_test_pl
extends Node2D

func _ready():
	spaces= 0

func _gm_event_5_32():
	spaces++
	if(spaces >= 50) {
	    i= 0
	    repeat(99)  {
	        GS.failure[i]= 0
	        i++
	    }
	    GS.attacktype= 30
	    GS.testhp= 20
	    GS.testinv= 0
	    GS.healno= 6
	    get_tree().change_scene_to_file("res://godot_rooms/room0.tscn")
	}

func _on_outside_room():
	draw_set_color(16777215)
	if(GS.testhp <= 0) draw_text_transformed(100, 20, "Game Under", 2, 2, 0)
	else  draw_text_transformed(100, 20, "Big Wienener Zone.", 2, 2, 0)
	draw_text(100, 80, "Hall of failure.")
	i= 26
	while(i < 57) {
	    draw_text(50, 100 + (i - 26) * 12, "Attack " + string(i) + " : " + string(GS.failure[i]))
	    i++
	}
	draw_text(300, 240, "TAke a screenshot#of this every time#for balancing purposes.")
	draw_text(300, 360, "Hold SPACEBAR to restart from#Attack 30")

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
