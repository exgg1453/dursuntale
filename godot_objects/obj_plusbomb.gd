# Auto-converted from GameMaker: obj_plusbomb
# GM parent: obj_metttestbulletparent
extends Node2D

func _ready():
	velocity.y= 4
	sf= 0
	s= 0
	sp= 10
	image_speed= 0
	shot= 0
	shot2= 0
	side= 0
	playdo= 0

func _gm_event_1_0():
	if(playdo == 1) _stop_sound("myloop")

func _process(delta: float):
	col= 0
	if(collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 743, 0, 1))
	    col= 1
	if(side == 1 and collision_rectangle(bbox_left + sprite_width + 1, bbox_top, bbox_right + sprite_width + 1, bbox_bottom, 743, 0, 1))
	    col= 1
	if(side == 2 and collision_rectangle(bbox_left - sprite_width - 1, bbox_top, bbox_right - sprite_width - 1, bbox_bottom, 743, 0, 1))
	    col= 1
	if(col == 1) event_user(11)
	if(collision_rectangle(x + 2, y + 6, x + 22, y + 28, 739, 0, 1)) {
	    g= collision_rectangle(x + 2, y + 6, x + 22, y + 28, 739, 0, 1)
	    if(instance_exists(402/* obj_ratingsmaster */))
	        GS.ratings+= 20
	    with(g) instance_destroy()
	    if(shot == 0) {
	        playdo= 1
	        myloop= _play_sound("127")
	        shot= 1
	    }
	}
	s++
	if(shot > 0) {
	    shot2++
	    image_speed= 1
	    if(shot2 >= 6) {
	        playdo= 0
	        _stop_sound("myloop")
	        snd_play(125/* snd_bomb */)
	        if(not instance_exists(184/* obj_shaker */)) scr_shake(3, 3, 2)
	        instance_create(x + 2, y + 6, 441/* obj_plusbomb_explosion */)
	        instance_destroy()
	    }
	}
	if(side == 1 and collision_rectangle(x + 2 + sprite_width + 1, y + 6, x + 22 + sprite_width + 1, y + 28, 739, 0, 1)) {
	    g= collision_rectangle(x + 2 + sprite_width + 1, y + 6, x + 22 + sprite_width + 1, y + 28, 739, 0, 1)
	    with(g) instance_destroy()
	}
	if(side == 2 and collision_rectangle(x + 2 - sprite_width - 1, y + 6, x + 22 - sprite_width - 1, y + 28, 739, 0, 1)) {
	    g= collision_rectangle(x + 2 - sprite_width - 1, y + 6, x + 22 - sprite_width - 1, y + 28, 739, 0, 1)
	    with(g) instance_destroy()
	}
	x= xstart + sin(s / sp) * sf

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	if(side == 1) {
	    draw_set_color(16777215)
	    draw_rectangle(x + 2 + sprite_width + 1, y + 6, x + 22 + sprite_width + 1, y + 28, 0)
	}
	if(side == 2) {
	    draw_set_color(16777215)
	    draw_rectangle(x + 2 - sprite_width - 1, y + 6, x + 22 - sprite_width - 1, y + 28, 0)
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
