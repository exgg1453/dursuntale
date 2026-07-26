# Auto-converted from GameMaker: obj_mkid_actor
extends Node2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	image_speed= 0.334
	dsprite= 1392
	usprite= 1400
	lsprite= 1395
	rsprite= 1397
	dtsprite= 1394
	utsprite= 1401
	ltsprite= 1396
	rtsprite= 1399
	myinteract= 0
	facing= 0
	facing2= 0
	fun= 0
	npcdir= 0
	d= 0
	follow= 0
	talk= 0
	xfer= 0
	yfer= 0
	closemove= 0

func _gm_event_2_3():
	follow++

func _process_end(delta: float):
	if(closemove == 1) {
	    x+= obj_mainchara.x - xfer
	    y+= obj_mainchara.y - yfer
	    if(room == 106) {
	        if(y < 100) y= 100
	        if(x < 1500 and y > 150) y-= 3
	    }
	    if(room == 107) {
	        if(y > 915) y-= 3
	        if(y < 850) {
	            if(x > 160) x-= 3
	        } else  {
	            if(x > 166 and y < 857) y= 857
	        }
	        if(x < 120) x+= 3
	        if(y > obj_echoflower.y and GS.flag[91] < 3) {
	            GS.flag[91]= 3
	            speed= 0
	            sprite_index= rtsprite
	            image_speed= 0
	            follow= 8
	            $Alarm3.start((25) / 30.0)
	        }
	    }
	    facing= GS.facing
	    image_speed= obj_mainchara.image_speed
	    if(facing == 0) sprite_index= dsprite
	    if(facing == 1) sprite_index= rsprite
	    if(facing == 2) sprite_index= usprite
	    if(facing == 3) sprite_index= lsprite
	    closemove= 0
	}

func _process_begin(delta: float):
	if(d == 0) scr_depth()
	if(follow == 0) scr_npc_anim()
	if(follow == 1) {
	    tmp_idealy= obj_mainchara.y + 8
	    if(room == 106 and obj_mainchara.y >= 142)
	        tmp_idealy= obj_mainchara.y - 2
	    if(room == 107 and obj_mainchara.y >= 906)
	        tmp_idealy= obj_mainchara.y - 2
	    move_towards_point(obj_mainchara.x - 6, tmp_idealy, 2)
	    image_speed= 0.25
	    follow= 2
	}
	if(follow == 2 and collision_point(obj_mainchara.x - 6, obj_mainchara.y + 28, object_index, 0, 0)) {
	    speed= 0
	    follow= 3
	}
	if(follow == 2.1) {
	    image_speed= 0.25
	    x-= 4
	    done= 0
	    if(sprite_index == rsprite or sprite_index == usprite)
	        move_towards_point(obj_mainchara.x - 2, obj_mainchara.y + 8, 4)
	    if(sprite_index == lsprite)
	        move_towards_point(obj_mainchara.x + 6, obj_mainchara.y + 8, 4)
	    if(sprite_index == dsprite)
	        move_towards_point(obj_mainchara.x, obj_mainchara.y - 12, 4)
	    move_towards_point(obj_mainchara.x, obj_mainchara.y, 4)
	    if(collision_rectangle(obj_mainchara.bbox_left - 6, obj_mainchara.bbox_top - 4, obj_mainchara.bbox_right + 4, obj_mainchara.bbox_bottom + 4, object_index, 0, 0)) {
	        speed= 0
	        follow= 3
	    }
	    x+= 4
	}
	alcovecheck= 0
	if(room == 106 and obj_mainchara.y < 100) {
	    alcovecheck= 1
	    image_speed= 0
	    frame= 0
	    sprite_index= usprite
	}
	if(room == 106 and y > 156 and obj_mainchara.x > 1518 and x < 1520)
	    x+= 3
	if(follow == 3 and alcovecheck == 0) {
	    if(obj_mainchara.moving == 1) {
	        if(distance_to_object(1570) > 12) {
	            $Alarm3.start((3) / 30.0)
	            follow= 4
	        }
	        if((distance_to_object(1570) > 4 or distance_to_object(1570) < 0) and distance_to_object(1570) < 10)
	            closemove= 1
	    } else  {
	        image_speed= 0
	        frame= 0
	    }
	    facing2= GS.facing
	}
	if(follow == 5) {
	    scr_npc_watch(1)
	    follow= 6
	    $Alarm3.start((3) / 30.0)
	}
	if(follow == 7) follow= 2.1
	if(follow == 8) sprite_index= rtsprite
	if(follow == 9 and GS.interact == 0) {
	    GS.interact= 1
	    scr_npc_watch(0)
	    $Alarm3.start((3) / 30.0)
	    follow= 9.1
	}
	if(follow == 10.1) {
	    GS.facechoice= 0
	    GS.msg[0]= "* So^1, one time./"
	    GS.msg[1]= "* We had a school project where&  we had to take care of&  a flower./"
	    GS.msg[2]= "* The king ^1- we had to call him&  " + chr(ord('"')) + "Mr. Dreemurr" + chr(ord('"')) + " ^1- volunteered&  to donate his own flowers./"
	    GS.msg[3]= "* He ended up coming to school&  and teaching the class about&  responsibility and stuff./"
	    GS.msg[4]= "* That got me thinking.../"
	    GS.msg[5]= "* YO^1!&* How COOL would it be if&  UNDYNE came to school!?/"
	    GS.msg[6]= "* She could beat up ALL&  the teachers!!/%%"
	    GS.typer= 5
	    GS.msc= 0
	    instance_create(x, y, 779/* obj_dialoguer */)
	    follow= 10
	}
	if(follow == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	    sprite_index= dsprite
	    GS.interact= 0
	    follow= 2.1
	}
	if(follow == 99) {
	    if(obj_mainchara.moving == 1) {
	        x+= obj_mainchara.x - obj_mainchara.xprevious
	        y+= obj_mainchara.y - obj_mainchara.yprevious
	        facing= GS.facing
	        image_speed= obj_mainchara.image_speed
	        if(facing == 0) sprite_index= dsprite
	        if(facing == 1) sprite_index= rsprite
	        if(facing == 2) sprite_index= usprite
	        if(facing == 3) sprite_index= lsprite
	    } else  {
	        image_speed= 0
	        frame= 0
	    }
	}
	if(instance_exists(1570/* obj_mainchara */)) {
	    xfer= obj_mainchara.x
	    yfer= obj_mainchara.y
	}

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, scale.x, scale.y, 0, 16777215, modulate.a)

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
