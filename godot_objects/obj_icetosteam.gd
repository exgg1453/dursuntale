# Auto-converted from GameMaker: obj_icetosteam
extends Node2D

func _ready():
	sprite_index= 917/* spr_iceblock_bottom */
	whitepro= 0
	timer= -10
	d= 0
	x+= 3
	if(GS.flag[7] == 1) instance_destroy()
	if(scr_murderlv() >= 7) instance_destroy()

func _on_outside_room():
	draw_sprite_ext(917/* spr_iceblock_bottom */, 0, x, y, scale.x, scale.y, 0, 16777215, (1 - whitepro) * modulate.a)
	draw_sprite_ext(918/* spr_iceblock_white */, 0, x, y, scale.x, scale.y, 0, 16777215, whitepro * modulate.a)
	timer++
	if(timer < 30) x+= 3
	if(timer == 30) gravity= 0.3
	if(timer == 52) {
	    snd_play(91/* snd_vaporized */)
	    gravity= 0
	    velocity.y= 0
	}
	if(timer >= 53) {
	    instance_create(x - 19 + random(38), y, 58/* obj_steamplume2 */)
	    whitepro+= 0.05
	    scale.y-= 0.03
	    y+= 0.5
	    if(scale.y < 0.3) modulate.a-= 0.1
	}
	if(scale.y < 0.01) d= 1
	if(timer >= 90) d= 1
	if(d == 1) {
	    x= -30
	    y= ystart + floor(random(22))
	    whitepro= 0
	    timer= -10
	    d= 0
	    scale.x= 1
	    scale.y= 1
	    whitepro= 0
	    gravity= 0
	    velocity.x= 0
	    velocity.y= 0
	    modulate.a= 1
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
