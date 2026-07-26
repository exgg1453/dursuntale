# Auto-converted from GameMaker: obj_papyrus_undyne1_actor
extends Node2D

func _ready():
	usprite= 1325
	rsprite= 1329
	dsprite= 1315
	lsprite= 1331
	sprite_index= 1329/* spr_papyrus_r_stark */
	image_speed= 0
	GS.flag[20]= 1

func _process(delta: float):
	if(GS.flag[20] == 0) sprite_index= dsprite
	if(GS.flag[20] == 1) sprite_index= rsprite
	if(GS.flag[20] == 2) sprite_index= usprite
	if(GS.flag[20] == 3) sprite_index= lsprite
	if(GS.flag[20] == 4) sprite_index= 1312/* spr_papyrus_cape_stark */

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
