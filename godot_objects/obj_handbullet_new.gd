# Auto-converted from GameMaker: obj_handbullet_new
extends Node2D

func _ready():
	type= 2
	$Alarm0.start((5) / 30.0)
	cn= 0
	c[0]= 0
	scale.x= 2
	scale.y= 2
	$Alarm1.start((1) / 30.0)
	modulate.a= 0
	moved= 0
	ds= 0

func _gm_event_2_1():
	if(type == 1) {
	    velocity.x= 8
	    velocity.y= 3
	    gravity= 0.1
	    gravity_direction= 90
	    sprite_index= 643/* spr_handbullet_old_u */
	}
	if(type == 2) {
	    velocity.x= -8
	    velocity.y= -3
	    gravity= -0.1
	    gravity_direction= 90
	    sprite_index= 640/* spr_handbullet_old_d */
	}
	if(type == 3) {
	    velocity.y= 6
	    sprite_index= 642/* spr_handbullet_old_r */
	}
	if(type == 4) {
	    velocity.y= -6
	    sprite_index= 641/* spr_handbullet_old_l */
	}
	if(type == 5) {
	    velocity.x= 8
	    sprite_index= 643/* spr_handbullet_old_u */
	}

func _on_destroy():
	if(modulate.a == 1) {
	    c[cn]= instance_create(x + 30, y + 30, 472/* obj_genericfire */)
	    c[cn].scale.x= 2
	    c[cn].scale.y= 2
	    cn++
	}
	$Alarm0.start((4) / 30.0)

func _process_end(delta: float):
	if(GS.turntimer < 0) instance_destroy()

func _process(delta: float):
	if(velocity.x > 0 and x > GS.idealborder[1] + 20) event_user(0)
	if(velocity.x < 0 and x < GS.idealborder[0] - 100) event_user(0)
	if(velocity.y < 0 and y < GS.idealborder[2] - 100) event_user(0)
	if(velocity.y > 0 and y > GS.idealborder[3] + 20) event_user(0)
	if(modulate.a < 1) modulate.a+= 0.2

func _gm_event_7_10():
	if(moved == 0) {
	    $Alarm0.start((-1) / 30.0)
	    i= 0
	    while(i < cn) {
	        with(c[i]) {
	            move_towards_point(obj_heart.x + 6, obj_heart.y + 6, 2)
	            friction= -0.2
	        }
	        i++
	    }
	    moved= 1
	}
	modulate.a-= 0.2
	if(modulate.a < -0.4) instance_destroy()

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
