# Auto-converted from GameMaker: obj_waterboard
# GM parent: obj_interactable
extends Node2D

func _ready():
	myinteract= 0
	image_speed= 0
	using= 0
	dir= 99

func _gm_event_2_2():
	using= 7
	move_snap(20, 20)
	block= instance_position(x + 10, y + 10, 820)
	if(block != -4) {
	    if(instance_exists(1111/* obj_bellblossom */)) {
	        obj_bellblossom.block2= block
	        // obj_bellblossom
	        with(1111) event_user(0)
	    }
	    block.x= 0
	    block.y= 0
	}
	using= 99
	image_speed= 0
	frame= 6
	z_index= 800000

func _process_end(delta: float):
	if(instance_exists(1110/* obj_waterboardpuzzle1 */)) {
	    if(myinteract == 1 and using == 0 and obj_waterboardpuzzle1.waterboard == 0) {
	        if(snd_isplaying(112/* snd_movemenu */) == 0) snd_play(112/* snd_movemenu */)
	        using= 1
	        obj_waterboardpuzzle1.waterboard= 1
	        myinteract= 0
	        solid= 0
	    } else  {
	        if(myinteract == 1 and using == 0) myinteract= 0
	    }
	}
	if(myinteract == 1 and using == 1) {
	    x-= 40
	    // obj_mainchara
	    with(1570) {
	        if(GS.facing == 2 and collision_rectangle(x + 4, y + sprite_height - 5, x + sprite_width - 4, y + 5, 1368, 0, 1)) {
	            interactedobject= collision_rectangle(x + 4, y + sprite_height - 5, x + sprite_width - 4, y + 8, 1368, 0, 1)
	            if(interactedobject != -4) {
	                with(interactedobject) facing= 0
	                with(interactedobject) script_execute(111/* scr_interact */)
	            }
	        }
	    }
	    myinteract= 0
	    x+= 40
	}
	if(using == 1) {
	    GS.encounter= 0
	    x= obj_mainchara.x
	    y= obj_mainchara.y - 10
	    z_index= obj_mainchara.z_index - 2
	    if(GS.interact == 0 and keyboard_multicheck_pressed(0/* NOKEY */) == 1) {
	        if(GS.facing == 0) {
	            j= instance_position(obj_mainchara.x + 10, obj_mainchara.y + 40, 1363)
	            h= instance_position(obj_mainchara.x + 10, obj_mainchara.y + 40, 1114)
	            g= instance_position(obj_mainchara.x + 10, obj_mainchara.y + 40, 1112)
	            if(h == -4 and j == -4 and g != -4) {
	                y= obj_mainchara.y + 30
	                move_snap(20, 20)
	                using= 2
	                dir= 0
	            }
	        }
	        if(GS.facing == 2) {
	            g= instance_position(obj_mainchara.x + 10, obj_mainchara.y, 1112)
	            if(g != -4 and not collision_point(obj_mainchara.x + 10, obj_mainchara.y, 1114, 0, 1)) {
	                y= obj_mainchara.y
	                move_snap(20, 20)
	                using= 2
	                dir= 2
	            }
	        }
	        if(GS.facing == 1) {
	            j= instance_position(obj_mainchara.x + 30, obj_mainchara.y + 20, 1363)
	            h= instance_position(obj_mainchara.x + 30, obj_mainchara.y + 20, 1114)
	            g= instance_position(obj_mainchara.x + 30, obj_mainchara.y + 20, 1112)
	            if(j == -4 and h == -4 and g != -4) {
	                y= obj_mainchara.y + 10
	                x= obj_mainchara.x + 20
	                move_snap(20, 20)
	                using= 2
	                dir= 1
	            }
	        }
	        if(GS.facing == 3) {
	            j= instance_position(obj_mainchara.x - 10, obj_mainchara.y + 20, 1363)
	            h= instance_position(obj_mainchara.x - 10, obj_mainchara.y + 20, 1114)
	            g= instance_position(obj_mainchara.x - 10, obj_mainchara.y + 20, 1112)
	            if(j == -4 and h == -4 and g != -4) {
	                y= obj_mainchara.y + 10
	                x= obj_mainchara.x - 20
	                move_snap(20, 20)
	                using= 2
	                dir= 3
	            }
	        }
	        if(using == 2) obj_waterboardpuzzle1.waterboard= 0
	    }
	}
	if(using == 2) {
	    z_index= 900000
	    if(dir == 2) {
	        y-= 2
	        if(instance_position(x + 10, y - 2, 1363) != -4) using= 3
	        if(instance_position(x + 10, y - 2, 1113) != -4) using= 3
	        if(instance_position(x + 10, y - 2, 1114) != -4) using= 3
	    }
	    if(dir == 1) {
	        x+= 2
	        if(instance_position(x + 20, y + 10, 1363) != -4) using= 3
	        if(instance_position(x + 20, y + 10, 1113) != -4) using= 3
	        if(instance_position(x + 20, y + 10, 1114) != -4) using= 3
	    }
	    if(dir == 0) {
	        y+= 2
	        if(instance_position(x + 10, y + 22, 1363) != -4) using= 3
	        if(instance_position(x + 10, y + 22, 1113) != -4) using= 3
	        if(instance_position(x + 10, y + 22, 1114) != -4) using= 3
	    }
	    if(dir == 3) {
	        x-= 2
	        if(instance_position(x - 2, y + 10, 1363) != -4) using= 3
	        if(instance_position(x - 2, y + 10, 1113) != -4) using= 3
	        if(instance_position(x - 2, y + 10, 1114) != -4) using= 3
	    }
	    if(using == 3) move_snap(20, 20)
	}
	if(using == 5) {
	    image_speed= 0.17
	    $Alarm2.start((30) / 30.0)
	    using= 6
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
