# Auto-converted from GameMaker: obj_movedogehead
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	image_speed= 0.33334
	scale.x= 2
	scale.y= 2
	excited= 0
	blcon= 89384938493
	blconwd= 58347583274932
	specialx= 0

func _gm_event_2_3():
	if(GS.mnfight == 2) {
	    $Alarm1.start((round(random(20)) + 10) / 30.0)
	    gg= floor(random(3))
	    if(is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    if(is_instance_valid(blconwd)) {
	        with(blconwd) instance_destroy()
	    }
	    if(gg == 0) {
	        xx= x - random(sprite_width / 2) - 40
	        yy= y + random(sprite_height / 3)
	    }
	    if(gg == 1) {
	        xx= x + random(sprite_width / 3) + 100
	        yy= y + random(sprite_height / 3)
	    }
	    if(gg == 2) {
	        xx= x + random(sprite_width) - sprite_width / 2
	        yy= y - 18
	    }
	    blcon= instance_create(xx, yy, 186/* obj_blconsm */)
	    blcon.z_index= 14
	    blcon.sprite_index= 22/* spr_blcontiny */
	    GS.msg[0]= "FETCH?"
	    GS.msg[1]= "%%%"
	    GS.typer= 2
	    blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    blconwd.z_index= 13
	    exit
	} else  {
	    if(is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    if(is_instance_valid(blconwd)) {
	        with(blconwd) instance_destroy()
	    }
	    exit
	}

func _gm_event_2_2():
	if(sprite_index == 219) exit
	else  {
	    if(specialx == 1) {
	        $Alarm2.start((2) / 30.0)
	        if(GS.mnfight == 2) {
	            $Alarm2.start((round(random(10)) + 8) / 30.0)
	            gg= floor(random(3))
	            if(is_instance_valid(blcon)) {
	                with(blcon) instance_destroy()
	            }
	            if(is_instance_valid(blconwd)) {
	                with(blconwd) instance_destroy()
	            }
	            if(gg == 0) {
	                xx= x - random(sprite_width / 2) - 40
	                yy= y + random(sprite_height / 3)
	            }
	            if(gg == 1) {
	                xx= x + random(sprite_width / 3) + 100
	                yy= y + random(sprite_height / 3)
	            }
	            if(gg == 2) {
	                xx= x + random(sprite_width) - sprite_width / 2
	                yy= y - 18
	            }
	            blcon= instance_create(xx, yy, 186/* obj_blconsm */)
	            blcon.z_index= 14
	            blcon.sprite_index= 22/* spr_blcontiny */
	            if(gg == 0) GS.msg[0]= "PET?"
	            if(gg == 1) GS.msg[0]= "PAT?"
	            if(gg == 2) GS.msg[0]= "POT?"
	            GS.msg[1]= "%%%"
	            GS.typer= 2
	            blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	            blconwd.z_index= 13
	        } else  {
	            if(is_instance_valid(blcon)) {
	                with(blcon) instance_destroy()
	            }
	            if(is_instance_valid(blconwd)) {
	                with(blconwd) instance_destroy()
	            }
	            exit
	        }
	    }
	    exit
	}

func _gm_event_2_1():
	if(GS.mnfight == 2) {
	    $Alarm1.start((round(random(20)) + 10) / 30.0)
	    gg= floor(random(3))
	    if(is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    if(is_instance_valid(blconwd)) {
	        with(blconwd) instance_destroy()
	    }
	    if(gg == 0) {
	        xx= x - random(sprite_width / 2) - 40
	        yy= y + random(sprite_height / 3)
	    }
	    if(gg == 1) {
	        xx= x + random(sprite_width / 3) + 100
	        yy= y + random(sprite_height / 3)
	    }
	    if(gg == 2) {
	        xx= x + random(sprite_width) - sprite_width / 2
	        yy= y - 18
	    }
	    blcon= instance_create(xx, yy, 186/* obj_blconsm */)
	    blcon.z_index= 14
	    blcon.sprite_index= 22/* spr_blcontiny */
	    GS.msg[0]= "MOVING?"
	    GS.msg[1]= "%%%"
	    GS.typer= 2
	    blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    blconwd.z_index= 13
	    exit
	} else  {
	    if(is_instance_valid(blcon)) {
	        with(blcon) instance_destroy()
	    }
	    if(is_instance_valid(blconwd)) {
	        with(blconwd) instance_destroy()
	    }
	    exit
	}

func _on_destroy():
	$Alarm0.start((-1) / 30.0)

func _process(delta: float):
	if(excited == 1 and alarm[0] > 1) {
	    image_speed= 0.1
	    sprite_index= 220/* spr_movedogeheadb */
	    if(instance_exists(247/* obj_movedoge */)) {
	        if(obj_movedoge.mercymod == 200 or obj_movedoge.mercymod == 201 and specialx == 0) {
	            $Alarm3.start((4) / 30.0)
	            specialx= 1
	        }
	        if(obj_movedoge.mercymod > 998 and specialx == 0) {
	            $Alarm2.start((4) / 30.0)
	            specialx= 1
	        }
	    }
	} else  {
	    image_speed= 0.33335
	    sprite_index= 219/* spr_movedogeheada */
	}
	if(excited == 3) excited= 1

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
