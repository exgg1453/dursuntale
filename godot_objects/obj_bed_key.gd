# Auto-converted from GameMaker: obj_bed_key
# GM parent: obj_readable
extends Node2D

func _ready():
	drawkey= 0
	bedy= 0
	myinteract= 0
	talkedto= 0
	anim= 0
	scr_depth()

func _on_destroy():
	myinteract= 3
	GS.msc= 784
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	anim+= 0.1
	if(GS.flag[484] < 2)
	    draw_sprite_ext(2110/* spr_leverkey */, anim, x + 34, y + 32, 1, 1, 0, 65535, 1)
	draw_sprite_part(2154, 0, 0, 0, 46, 39 - bedy, x + 2, y + 13 + bedy)
	if(GS.flag[484] > 0) {
	    bedy+= 4
	    if(bedy >= 30) bedy= 30
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
