# Auto-converted from GameMaker: obj_plusbomb_explosion
# GM parent: obj_metttestbulletparent
extends Node2D

func _ready():
	anim= 0

func _on_outside_room():
	xbefore= ceil(x / 20)
	xafter= ceil(get_viewport_rect().size.x / 20 - x / 20)
	ybefore= ceil(y / 20)
	yafter= ceil(get_viewport_rect().size.y / 20 - y / 20)
	i= 0
	while(i < ybefore + 1) {
	    draw_sprite(518/* spr_plusbomb_verblast */, anim, x, y - 20 - i * 20)
	    i++
	}
	i= 0
	while(i < yafter + 1) {
	    draw_sprite(518/* spr_plusbomb_verblast */, anim, x, y + 20 + i * 20)
	    i++
	}
	i= 0
	while(i < xbefore + 1) {
	    draw_sprite(516/* spr_plusbomb_horblast */, anim, x - 20 - i * 20, y)
	    i++
	}
	i= 0
	while(i < xafter + 1) {
	    draw_sprite(516/* spr_plusbomb_horblast */, anim, x + 20 + i * 20, y)
	    i++
	}
	draw_sprite(517/* spr_plusbomb_coreblast */, anim, x, y)
	anim++
	if(anim > 1 and anim < 3) {
	    g= 0
	    if(collision_rectangle(0, y + 4, get_viewport_rect().size.x, y + 16, 743, 0, 1))
	        g= 1
	    if(collision_rectangle(x + 4, 0, x + 16, get_viewport_rect().size.y, 743, 0, 1))
	        g= 1
	    if(g == 1) event_user(11)
	}
	if(anim >= 7) instance_destroy()

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
