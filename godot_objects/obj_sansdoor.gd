# Auto-converted from GameMaker: obj_sansdoor
# GM parent: obj_readable
extends Node2D

func _ready():
	dsprite= 1353
	usprite= 1362
	lsprite= 1367
	rsprite= 1363
	dtsprite= 1353
	utsprite= 1362
	ltsprite= 1367
	rtsprite= 1363
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	anim= 0
	wawa= caster_load("music/wawa.ogg")
	sans= 0
	sansamt= 0
	con= 1

func _gm_event_2_3():
	sans= 4

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* (The door is locked.)/%%"
	if(GS.flag[497] >= 1) {
	    GS.msg[0]= "* (You unlock the door and&  enter...)/%%"
	    con= 4
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process(delta: float):
	if(myinteract == 1) {
	    if(obj_kitchenchecker.level == 2 or obj_kitchenchecker.level == 1) {
	        GS.interact= 1
	        $Alarm0.start((1) / 30.0)
	        myinteract= 2
	    } else  myinteract= 0
	}
	if(myinteract == 3 and not is_instance_valid(mydialoguer)) {
	    GS.interact= 0
	    myinteract= 0
	}
	if(con == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 1
	    instance_create(obj_mainchara.x, obj_mainchara.y + 20, 786/* obj_door_t */)
	    con= 5
	}

func _on_alarm_0_timeout():
	if(instance_exists(1414/* obj_kitchenchecker */) and (obj_kitchenchecker.level == 1 or obj_kitchenchecker.level == 2)) {
	    // obj_mainchara
	    with(1570) {
	        x= xprevious
	        y= yprevious
	        moving= 0
	    }
	}

func _gm_event_7_5():
	caster_free(wawa)

func _on_outside_room():
	bgalpha= obj_kitchenchecker.bgalpha
	draw_sprite_ext(sprite_index, frame, x, y, 1, 1, 0, 16777215, bgalpha)
	if(frame == 0)
	    draw_sprite_ext(1633/* spr_weirdlight */, anim, x + 3, y + 48, 1, 1, 0, 16777215, bgalpha)
	anim+= 0.25
	if(sans > 0) {
	    if(sans == 1) {
	        if(sansamt < 33) sansamt+= 2
	        else  sans= 2
	    }
	    if(sans == 2) {
	        $Alarm3.start((50) / 30.0)
	        sans= 3
	        caster_play(wawa, 1, 1)
	    }
	    if(sans == 4) {
	        if(sansamt > 4) sansamt-= 4
	        else  {
	            sansamt= 0
	            sans= 0
	        }
	    }
	    if(sans != 3)
	        draw_sprite_part(1352, 0, 36 - sansamt, 0, sansamt, 32, x + 33, y + 13)
	    else 
	        draw_sprite_part(1352, anim / 1.5, 36 - sansamt, 0, sansamt, 32, x + 33, y + 13)
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
