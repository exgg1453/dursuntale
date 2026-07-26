# Auto-converted from GameMaker: obj_astigmatism_body
extends Node2D

func _ready():
	anim= 0
	siner= 0
	anim2= 0
	sfactor= 0
	pause= 0

func _on_outside_room():
	if(pause == 1) {
	    anim= 0
	    anim2= 0
	    sfactor= 0
	    siner= 0
	    x= parent.x + 6
	}
	anim++
	if(anim > 250) {
	    if(sfactor < 1) sfactor+= 0.05
	    siner++
	}
	if(anim > 140 and anim < 180) {
	    anim2++
	    if(anim2 > 18) anim= 200
	}
	if(anim > 220 and anim < 280) {
	    anim2++
	    if(anim2 >= 33) anim= 300
	}
	if(anim > 480) {
	    if(sfactor > 0) sfactor-= 0.07
	    anim2--
	    if(anim2 <= 0) {
	        sfactor= 0
	        anim2= 0
	        anim= 0
	    }
	}
	draw_sprite_ext(478/* spr_astigmatism_handl */, anim2 / 3, x + 8 + sin(siner / 6) * 2 * sfactor, y + 64 + cos(siner / 6) * 2 * sfactor, 2, 1.8 + cos(siner / 6) * 0.2 * sfactor, 0, 16777215, 1)
	draw_sprite_ext(477/* spr_astigmatism_legl */, anim2 / 3, x + 30 + cos(siner / 6) * 2 * sfactor, y + 84 + sin(siner / 6) * 2 * sfactor, 2, 1.8 + sin(siner / 6) * 0.2 * sfactor, 0, 16777215, 1)
	draw_sprite_ext(478/* spr_astigmatism_handl */, anim2 / 3, x + 92 - sin(siner / 6) * 2 * sfactor, y + 64 - cos(siner / 6) * 2 * sfactor, -2, 1.9 - cos(siner / 6) * 0.2 * sfactor, 0, 16777215, 1)
	draw_sprite_ext(477/* spr_astigmatism_legl */, anim2 / 3, x + 70 - cos(siner / 6) * 2 * sfactor, y + 84 - sin(siner / 6) * 2 * sfactor, -2, 1.8 - sin(siner / 6) * 0.2 * sfactor, 0, 16777215, 1)
	draw_sprite_ext(479/* spr_astigmatism_anim2 */, anim2 / 3, x, y, 2, 2, 0, 16777215, 1)

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
