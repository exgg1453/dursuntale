# Auto-converted from GameMaker: obj_undyne_endingbody
# GM parent: obj_friendparent
extends Node2D

func _ready():
	face= 6
	siner= 0
	smooch= 0
	s_a= 0
	s_i= 0
	shock= 0
	scale.y= 2

func _on_outside_room():
	goof= sin(siner / 5) * 10
	siner++
	draw_sprite_ext(282/* spr_undyneb_hair */, siner / 5, x - 60, y - 60 + goof / 3 + s_i * 2, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(292/* spr_undyneb_noanim */, 0, x - 4, y + 10, 2, 2, 0, 16777215, 1)
	if(shock == 0) {
	    if(smooch == 0)
	        draw_sprite_ext(285/* spr_undyneb_face3 */, face, x, 6 + y - 50, 2, 2, 0, 16777215, 1)
	    if(smooch == 1) {
	        if(s_a > -50) {
	            s_i+= 0.125
	            s_a-= 0.5
	        }
	        draw_sprite_ext(2297/* spr_undyneb_smooch */, floor(s_i), x + 22 + s_i * 2, 6 + y - 50 + 26 + s_i, 2, 2, s_a, 16777215, 1)
	    }
	    if(smooch == 2)
	        draw_sprite_ext(2298/* spr_undyneb_smooch_s */, floor(s_i), x + 22 + s_i * 2, 6 + y - 50 + 26 + s_i, 2, 2, s_a, 16777215, 1)
	}
	if(shock == 1)
	    draw_sprite_ext(2327/* spr_undyneface_fatal */, 0, x, 6 + y - 50, 2, 2, 0, 16777215, 1)

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
