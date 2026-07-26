# Auto-converted from GameMaker: obj_metthand_l
# GM parent: obj_metttestbulletparent
extends Node2D

func _ready():
	seg= 8
	segx= x
	segxinit= x
	anim= 0
	on= 0
	xm= 0
	s= 0
	sf= 25
	sp= 15
	velocity.y= 2
	yseg= 60
	ysegi= yseg

func _on_outside_room():
	draw_set_color(0)
	draw_rectangle(segx + 18, y + 2, GS.idealborder[1] + 2, y + 18, 0)
	draw_set_color(16777215)
	draw_rectangle(segx + 20, y + 4, GS.idealborder[1], y + 16, 0)
	i= segx + 20
	while(i < GS.idealborder[1]) {
	    draw_set_color(0)
	    draw_line_width(i, y + 2, i, y + 18, 2)
	    i+= 20
	}
	anim+= 0.25
	if(on == 0) draw_sprite(544/* spr_yellowtrigger_pl */, anim, segx + yseg, y)
	if(on == 1) draw_sprite(545/* spr_yellowtrigger_off_pl */, anim, segx + yseg, y)
	draw_sprite(sprite_index, frame, segx, y)
	if(collision_rectangle(segx + yseg, y, segx + yseg + 20, y + 14, 739, 0, 1)) {
	    snd_play(128/* snd_mtt_burst */)
	    g= collision_rectangle(segx + yseg, y, segx + yseg + 20, y + 14, 739, 0, 1)
	    with(g) instance_destroy()
	    if(on == 0) on= 1
	    else  on= 0
	}
	if(collision_rectangle(segx + 3, y - 4, GS.idealborder[1], y + 10, 739, 0, 1)) {
	    g= collision_rectangle(segx + 3, y - 4, GS.idealborder[1], y + 10, 739, 0, 1)
	    with(g) instance_destroy()
	    velocity.y+= 0.75
	    y+= 3
	    snd_play(110/* snd_swallow */)
	}
	if(collision_rectangle(segx + 5, y + 4, GS.idealborder[1], y + 14, 743, 0, 1))
	    event_user(11)
	if(on == 1) {
	    if(segx < GS.idealborder[1] + 5) {
	        if(xm <= 0) xm= 2
	        xm+= 2
	        segx+= xm
	    } else  {
	        xm= 0
	        segx= GS.idealborder[1] + 5
	    }
	}
	if(on == 0) {
	    if(segx > segxinit) {
	        if(xm >= 0) xm= -1
	        xm--
	        segx+= xm
	    } else  {
	        xm= 0
	        segx= segxinit
	    }
	}
	s++
	yseg= ysegi + sin(s / sp) * sf

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
