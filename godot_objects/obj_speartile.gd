# Auto-converted from GameMaker: obj_speartile
extends Node2D

func _ready():
	con= 0
	duty= 0
	modulate.a= 0
	image_speed= 0
	x= obj_mainchara.x
	y= obj_mainchara.y
	move_snap(20, 20)
	x+= -40 + floor(random(5)) * 20
	y+= -40 + floor(random(5)) * 20
	move_snap(20, 20)
	facer= 1
	sounded= 0
	active= 1

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 0) {
	    if(facer == 1 and instance_exists(1569/* obj_time */)) {
	        if(obj_time.left == 1) {
	            x-= 60
	            repeat(3)  {
	                if(collision_point(x + 9, y + 35, 1041, 1, 1))
	                    x+= 20
	            }
	        }
	        if(obj_time.right == 1) {
	            x+= 60
	            repeat(3)  {
	                if(collision_point(x + 9, y + 35, 1041, 1, 1))
	                    x-= 20
	            }
	        }
	        if(obj_time.down == 1) {
	            y+= 60
	            repeat(3)  {
	                if(collision_point(x + 9, y + 35, 1041, 1, 1))
	                    y-= 20
	            }
	        }
	        if(obj_time.up == 1) {
	            y-= 60
	            repeat(3)  {
	                if(collision_point(x + 9, y + 35, 1041, 1, 1))
	                    y+= 20
	            }
	        }
	        facer= 0
	    }
	    if(collision_point(x + 9, y + 35, 1041, 1, 1))
	        instance_destroy()
	    modulate.a+= 0.07
	    if(modulate.a > 0.9) {
	        modulate.a= 1
	        con= 1
	        $Alarm4.start((10) / 30.0)
	    }
	}
	if(con == 2) {
	    spearbud= instance_create(x, y, 1363/* obj_npc_marker */)
	    spearbud.y+= 9
	    spearbud.y-= 9
	    spearbud.sprite_index= sprite_index
	    spearbud.image_speed= 0.5
	    spearbud.visible= 1
	    with(spearbud) scr_depth()
	    con= 2.5
	}
	if(con == 2.5) {
	    if(spearbud.frame >= 1.5 and active == 1) {
	        if(collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1570, 0, 1))
	            event_user(3)
	        if(sounded == 0 and instance_exists(1046/* obj_speartilegen */)) {
	            obj_speartilegen.sound2= 1
	            sounded= 1
	        }
	    }
	    if(spearbud.frame >= 3) {
	        spearbud.image_speed= 0
	        con= 3
	        $Alarm4.start((5) / 30.0)
	    }
	}
	if(con == 4) {
	    modulate.a-= 0.1
	    spearbud.modulate.a= modulate.a
	    if(modulate.a < 0.1) {
	        with(spearbud) instance_destroy()
	        instance_destroy()
	    }
	}
	if(duty == 1) {
	    x= obj_mainchara.x
	    y= obj_mainchara.y
	    duty= 0
	    move_snap(20, 20)
	}
	if(active == 2) {
	    if(con >= 2.5 and is_instance_valid(spearbud)) {
	        with(spearbud) instance_destroy()
	    }
	    instance_destroy()
	}

func _gm_event_7_13():
	if(active == 1 and GS.interact == 0) event_user(1)

func _gm_event_7_11():
	if(active == 1) {
	    GS.border= 3
	    GS.flag[15]= 1
	    GS.flag[16]= 1
	    GS.flag[370]= 1
	    SCR_BORDERSETUP()
	    instance_create(0, 0, 144/* obj_battlerquick */)
	    obj_speartile.active= 2
	    if(instance_exists(1038/* obj_undyneencounter3 */))
	        obj_undyneencounter3.stopper= 1
	    if(instance_exists(1046/* obj_speartilegen */))
	        obj_speartilegen.alarm[3]+= 70
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
