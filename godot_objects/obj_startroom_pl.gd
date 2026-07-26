# Auto-converted from GameMaker: obj_startroom_pl
extends Node2D

func _ready():
	i= 0
	repeat(99)  {
	    GS.failure[i]= 0
	    i++
	}
	GS.attacktype= 26
	GS.testhp= 20
	GS.testinv= 0
	GS.healno= 6
	GS.specialdam[0]= 0
	GS.specialdam[1]= 0
	GS.specialdam[2]= 0

func _on_outside_room():
	draw_set_color(16777215)
	draw_text(100, 100, "INSTRUCTIONS ROOM.# #YOU WILL ENCOUNTER A SERIES OF ATTACK.# #PRESS [Z] TO FIRE THE WEAPON.# #YOU CAN TEST WEAPON HERE.#SPECIAL RULE:#BLUE LASERS WILL NOT HURT YOU IF YOU ARE STANDING STILL.##PRESS [SPACEBAR] TO CONTINUE.")

func _gm_event_9_32():
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
