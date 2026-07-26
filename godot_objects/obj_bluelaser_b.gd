# Auto-converted from GameMaker: obj_bluelaser_b
extends Node2D

func _ready():
	velocity.x= -5
	blue= 1
	dmg= 8

func _gm_event_7_10():
	check= 1
	if(instance_exists(748/* obj_fakeheart */)) {
	    if(blue == 1) {
	        check= 0
	        if(abs(obj_fakeheart.xprevious - obj_fakeheart.x) > 0.01 or abs(obj_fakeheart.yprevious - obj_fakeheart.y) > 0.01)
	            check= 1
	    }
	    if(blue == 2) {
	        check= 0
	        if(abs(obj_fakeheart.xprevious - obj_fakeheart.x) < 0.01 and abs(obj_fakeheart.yprevious - obj_fakeheart.y) < 0.01)
	            check= 1
	    }
	    scr_damagestandard(3, 3, 0, 0, 0)
	}
	if(instance_exists(743/* obj_heart */))
	    scr_damagestandard(blue, 3, 0, 0, 0)
	if(GS.flag[370] == 2 and GS.flag[372] == 0 and GS.hp == 0) {
	    GS.hp= 1
	    GS.invc= 60
	}

func _on_outside_room():
	if(blue == 1) draw_set_color(16754964)
	if(blue == 2) draw_set_color(4235519)
	if(x <= GS.idealborder[1] and x > GS.idealborder[0])
	    draw_rectangle(x, GS.idealborder[2] + 2, x + 5, GS.idealborder[3], 0)
	if(collision_rectangle(x, GS.idealborder[2] + 2, x + 5, GS.idealborder[3], 748, 0, 1))
	    event_user(0)
	if(collision_rectangle(x, GS.idealborder[2] + 2, x + 5, GS.idealborder[3], 743, 0, 1))
	    event_user(0)
	if(GS.turntimer < 2) instance_destroy()

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
