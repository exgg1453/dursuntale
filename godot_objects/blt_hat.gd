# Auto-converted from GameMaker: blt_hat
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	image_speed= 0
	dmg= 0
	dmg2= dmg
	$Alarm6.start((20) / 30.0)
	gg= floor(random(2))
	if(collision_line(x + sprite_width / 2, 0, x + sprite_width / 2, get_viewport_rect().size.y, object_index, 0, 1)) {
	    if(gg == 1) x+= sprite_width / 2
	    if(gg == 0) x-= sprite_width / 2
	}
	velocity.y= -1.5
	y= GS.idealborder[3] + 2
	if(x > GS.idealborder[1] - sprite_width)
	    x-= random(GS.idealborder[1] - GS.idealborder[0])
	if(x < GS.idealborder[0])
	    x+= random(GS.idealborder[1] - GS.idealborder[0])
	if(instance_position(x + sprite_width / 2, y - 15, object_index) != -4) {
	    if(gg == 1) x+= sprite_width / 2
	    if(gg == 0) x-= sprite_width / 2
	}
	if(collision_line(obj_heart.x + 8, 0, obj_heart.x, get_viewport_rect().size.y, object_index, 0, 1) < 0 and collision_line(obj_heart.x + 8, 0, obj_heart.x, get_viewport_rect().size.y, 645, 0, 1) < 0)
	    x= 6 + obj_heart.x - sprite_width / 2

func _gm_event_2_8():
	velocity.y= 4

func _gm_event_2_7():
	pop= scr_monstersum()
	if(instance_exists(217/* obj_jerry */) and obj_jerry.ditch == 0)
	    pop--
	if(pop == 1) {
	    n= 3
	    if(GS.hardmode == 1) {
	        blt[3]= instance_create(x - 20, y + 30, 645/* blt_icicle */)
	        blt[4]= instance_create(x + 20, y + 30, 645/* blt_icicle */)
	        n+= 2
	    } else  {
	        blt[0]= instance_create(x - 2, y + 30, 645/* blt_icicle */)
	        blt[1]= instance_create(x + 12, y + 30, 645/* blt_icicle */)
	        blt[2]= instance_create(x + 5, y + 30, 645/* blt_icicle */)
	    }
	    i= 0
	    while(i < n) {
	        blt[i].dmg= dmg - 1
	        i++
	    }
	}
	if(pop > 1) {
	    blt[0]= instance_create(x + 3, y + 14, 645/* blt_icicle */)
	    blt[1]= instance_create(x + 6, y + 14, 645/* blt_icicle */)
	    blt[2]= instance_create(x + 9, y + 14, 645/* blt_icicle */)
	    i= 0
	    while(i < 3) {
	        blt[i].dmg= dmg
	        i++
	    }
	}
	$Alarm8.start((20) / 30.0)
	frame= 1
	image_speed= 0

func _gm_event_2_6():
	velocity.y= 0
	$Alarm7.start((20) / 30.0)
	image_speed= 0.25

func _on_outside_room():
	draw_self_border_ext(1, 1, 16777215, 0.5)

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
