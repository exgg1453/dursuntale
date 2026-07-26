# Auto-converted from GameMaker: obj_piper_steam
extends Node2D

func _ready():
	siner= 0
	timer= 0
	f_l= 0
	f_d= 0

func _on_outside_room():
	timer++
	draw_sprite(915/* spr_steamer_bottom */, 0, x, y)
	draw_sprite(916/* spr_steamer_top */, 0, x, y + f_l * 3)
	if(timer == 30) {
	    f_l= 0
	    f_d= 1
	}
	if(timer > 30 and timer < 50) {
	    instance_create(x + 7, y + 6 + f_l * 3, 58/* obj_steamplume2 */)
	    f_l+= 0.3
	    if(f_l >= 3) timer= 50
	}
	if(timer >= 50 and timer < 90) {
	    f_l-= 0.1
	    if(f_l <= 0) {
	        f_l= 0
	        timer= 25
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
