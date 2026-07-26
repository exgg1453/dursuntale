# Auto-converted from GameMaker: obj_icecavewall
extends Node2D

func _ready():
	timer= random(20)
	al= 0
	type= 0

func _on_destroy():
	type= 1
	timer-= 40
	sprite_index= 990/* spr_icecavewallb */

func _on_outside_room():
	timer++
	if(type == 0) {
	    draw_sprite(sprite_index, frame, x, y)
	    draw_sprite_ext(988/* spr_icecavewall_2 */, abs(sin(timer / 15) * 2.8), x + sin(timer / 7), y + cos(timer / 8), 1, 1, 0, 16777215, al)
	} else  {
	    draw_sprite(sprite_index, frame, x, y)
	    draw_sprite_ext(989/* spr_icecavewall_2b */, abs(sin(timer / 15) * 2.8), x + sin(timer / 7), y + cos(timer / 8), 1, 1, 0, 16777215, al)
	}
	if(timer >= 100 and timer < 150) al+= 0.02
	if(timer >= 300) {
	    al-= 0.02
	    if(al <= 0) {
	        al= 0
	        timer= 0
	    }
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
