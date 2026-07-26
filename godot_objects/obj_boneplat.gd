# Auto-converted from GameMaker: obj_boneplat
extends Node2D

func _ready():
	lock= 0
	ht= 5
	len= 50
	siner= 0
	z_a= 0
	z_b= 0
	siner= 0
	jud= 0
	jtimer= 0

func _gm_event_1_0():
	if(lock == 1 and obj_heart.jumpstage == 1) {
	    obj_heart.jumpstage= 2
	    obj_heart.velocity.y= 0
	}
	lock= 0

func _on_outside_room():
	siner++
	if(z_b != 0) velocity.x= cos(z_a * siner) * z_b
	draw_set_color(16777215)
	draw_rectangle(x - len, y, x + len, y + 6, 1)
	draw_set_color(32768)
	draw_rectangle(x - len, y + 2, x + len, y - 4, 1)
	if(collision_rectangle(x - len + 2, y + 2, x + len - 2, y - 4, 743, 0, 1)) {
	    if(obj_heart.velocity.y >= 0 and obj_heart.y <= y - 11) {
	        lock= 1
	        obj_heart.y= y - 16
	        obj_heart.velocity.y= 0
	        obj_heart.jumpstage= 1
	    }
	} else  {
	    if(lock == 1 and obj_heart.jumpstage == 1) {
	        obj_heart.jumpstage= 2
	        obj_heart.velocity.y= 0
	    }
	    lock= 0
	}
	if(lock == 1) {
	    obj_heart.x+= velocity.x
	    obj_heart.y+= velocity.y
	    if(obj_heart.x < GS.idealborder[0] + 5)
	        obj_heart.x= GS.idealborder[0] + 5
	    if(obj_heart.x > GS.idealborder[1] - 16)
	        obj_heart.x= GS.idealborder[1] - 16
	}
	if(x < 0 - len and velocity.x < 0) instance_destroy()
	if(x > 640 + len and velocity.x > 0) instance_destroy()
	if(velocity.y > 0 and y > GS.idealborder[3]) instance_destroy()
	if(jud == 1) {
	    jtimer++
	    if(jtimer >= 5 and jtimer <= 20)
	        velocity.x+= 0.25
	    if(jtimer == 21) velocity.x= 3
	    if(x > GS.idealborder[1] - len and velocity.x > 0)
	        velocity.x*= -1
	    if(x < GS.idealborder[0] + len and velocity.x < 0)
	        velocity.x*= -1
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
