# Auto-converted from GameMaker: obj_candydish1
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	image_speed= 0
	candymade= 0
	if(GS.flag[34] > 3) {
	    candy= scr_marker(x, y + 2, 1171)
	    candy.z_index= 900000
	    candy.frame= 1
	    candy.image_speed= 0
	    sprite_index= 1171/* spr_candydish2 */
	    candymade= 1
	}

func _on_destroy():
	myinteract= 3
	GS.msc= 508
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(GS.flag[34] > 3 and candymade == 0) {
	    candy= scr_marker(x, y + 2, 1171)
	    candy.z_index= 900000
	    candy.frame= 1
	    candy.image_speed= 0
	    sprite_index= 1171/* spr_candydish2 */
	    candymade= 1
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
