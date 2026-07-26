# Auto-converted from GameMaker: obj_knighthammer
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	side= choose(0, 1)
	$Alarm1.start((1) / 30.0)
	visible= 0
	image_speed= 0
	go= 0
	dmg= 10

func _gm_event_2_4():
	if(side == 0) {
	    go= 3
	    velocity.y= -10
	}
	if(side == 1) {
	    go= 3
	    velocity.y= 10
	}

func _gm_event_2_3():
	velocity.y*= 240
	go= 1

func _gm_event_2_2():
	velocity.y/= 30
	$Alarm3.start((15) / 30.0)

func _gm_event_2_1():
	visible= 1
	if(side == 0) {
	    y= 235 - sprite_height
	    velocity.y= 2
	    $Alarm2.start((12) / 30.0)
	}
	if(side == 1) {
	    frame= 1
	    y= 375
	    velocity.y= -2
	    $Alarm2.start((12) / 30.0)
	}

func _process(delta: float):
	if(go == 1) {
	    if(side == 0 and y + sprite_height > 400) {
	        if(not instance_exists(184/* obj_shaker */)) {
	            snd_play(21/* snd_impact */)
	            scr_shake(2, 2, 2)
	        }
	        nowx= x
	        nowy= y
	        go= 2
	        velocity.y= 0
	        $Alarm4.start((5) / 30.0)
	    }
	    if(side == 1 and y < 250) {
	        if(not instance_exists(184/* obj_shaker */)) {
	            snd_play(21/* snd_impact */)
	            scr_shake(2, 2, 2)
	        }
	        nowx= x
	        nowy= y
	        go= 2
	        velocity.y= 0
	        $Alarm4.start((5) / 30.0)
	    }
	}
	if(go == 2) {
	    x= nowx - 2 + random(4)
	    y= nowy - 2 + random(4)
	}
	if(go == 3) {
	    if(side == 0 and y + sprite_height < 250)
	        instance_destroy()
	    if(side == 1 and y > 400) instance_destroy()
	}
	hit= 0
	if(collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 743, 0, 1))
	    hit= 1
	if(frame == 0 and collision_rectangle(6, 144, 33, 188, 743, 0, 1))
	    hit= 1
	if(frame == 1 and collision_rectangle(6, 6, 33, 52, 743, 0, 1))
	    hit= 1
	if(hit == 1) event_user(0)

func _on_alarm_0_timeout():
	scr_damagestandard(0, 4, 0, 0, 0)

func _on_outside_room():
	draw_self_border()

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
