# Auto-converted from GameMaker: obj_wordfall
extends Node2D

func _ready():
	w= instance_create(x + 7, y + 10, 1229/* obj_wordfall_word */)
	w.sprite_index= 1779/* spr_wordfall1 */
	w= instance_create(x + 33, y + 9, 1229/* obj_wordfall_word */)
	w.sprite_index= 1780/* spr_wordfall2 */
	w= instance_create(x + 66, y + 9, 1229/* obj_wordfall_word */)
	w.sprite_index= 1781/* spr_wordfall3 */
	w= instance_create(x + 101, y + 9, 1229/* obj_wordfall_word */)
	w.sprite_index= 1782/* spr_wordfall4 */
	w= instance_create(x + 141, y + 9, 1229/* obj_wordfall_word */)
	w.sprite_index= 1783/* spr_wordfall5 */
	w= instance_create(x + 164, y + 9, 1229/* obj_wordfall_word */)
	w.sprite_index= 1784/* spr_wordfall6 */
	w= instance_create(x + 182, y + 9, 1229/* obj_wordfall_word */)
	w.sprite_index= 1785/* spr_wordfall7 */
	instance_destroy()

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
