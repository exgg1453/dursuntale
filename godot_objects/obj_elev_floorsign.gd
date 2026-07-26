# Auto-converted from GameMaker: obj_elev_floorsign
extends Node2D

func _ready():
	siner= 0
	if(room == 214) sprite_index= 941/* spr_floorsign_l1 */
	if(room == 168) sprite_index= 942/* spr_floorsign_l2 */
	if(room == 169) sprite_index= 943/* spr_floorsign_l3 */
	if(room == 156) sprite_index= 944/* spr_floorsign_r1 */
	if(room == 157) sprite_index= 945/* spr_floorsign_r2 */
	if(room == 187) sprite_index= 946/* spr_floorsign_r3 */

func _on_outside_room():
	siner++
	draw_sprite(940/* spr_floorsign_back_r */, siner / 6, x, y)
	draw_sprite(sprite_index, siner / 6, x, y)

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
