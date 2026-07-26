# Auto-converted from GameMaker: obj_alphys_friendscene
# GM parent: obj_friendparent
extends Node2D

func _ready():
	face= 9
	smooch= 0
	smooch_ang= 0
	s_i= 0
	shock= 0
	scale.y= 2

func _on_outside_room():
	draw_sprite_ext(2299/* spr_adate_bodycoat */, 0, x, y, 2, 2, 0, 16777215, modulate.a)
	if(shock == 0) {
	    if(smooch == 0)
	        draw_sprite_ext(803/* spr_adate_head */, face, x, y, 2, 2, 0, 16777215, modulate.a)
	    if(smooch == 1) {
	        if(smooch_ang > -50) {
	            smooch_ang-= 0.5
	            s_i+= 0.25
	        }
	        draw_sprite_ext(2300/* spr_adate_smooch */, floor(s_i), x + 44, y + 40, 2, 2, smooch_ang, 16777215, modulate.a)
	    }
	    if(smooch == 2) {
	        if(smooch_ang > -50) {
	            smooch_ang-= 0.5
	            s_i+= 0.25
	        }
	        draw_sprite_ext(2301/* spr_adate_smooch_s */, floor(s_i), x + 44, y + 40, 2, 2, smooch_ang, 16777215, modulate.a)
	    }
	}
	if(shock == 1)
	    draw_sprite_ext(2332/* spr_alphysface_hit */, 0, x, y - 2, 2, 2, 0, 16777215, 1)

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
