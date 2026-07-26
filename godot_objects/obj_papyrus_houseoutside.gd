# Auto-converted from GameMaker: obj_papyrus_houseoutside
# GM parent: obj_papyrusparent
extends CharacterBody2D

func _ready():
	if(GS.flag[67] == 1) {
	    instance_destroy()
	    exit
	} else  {
	    dsprite= 1313
	    usprite= 1325
	    lsprite= 1330
	    rsprite= 1328
	    dtsprite= 1316
	    utsprite= 1327
	    ltsprite= 1334
	    rtsprite= 1335
	    myinteract= 0
	    facing= 0
	    direction= 270
	    talkedto= 0
	    image_speed= 0
	    fun= 0
	    con= 0
	    rid= 0
	    if(GS.flag[88] >= 4 and GS.flag[7] == 0) {
	        instance_create(x, y, 1026/* obj_papyrus_room */)
	        instance_destroy()
	    }
	    if(GS.flag[88] != 1) instance_destroy()
	    exit
	}

func _gm_event_2_2():
	con++

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 19
	GS.facechoice= 4
	GS.faceemotion= 0
	if(GS.flag[66] == 1)
	    GS.msg[0]= "SO YOU CAME&BACK TO HAVE A&DATE WITH ME!/"
	else  GS.msg[0]= "SO YOU CAME&BACK TO SEE ME!/"
	GS.msg[1]= "\\E3YOU MUST BE&REALLY SERIOUS&ABOUT THIS.../"
	GS.msg[2]= "\\E2I\'LL HAVE TO TAKE&YOU SOMEPLACE&REALLY SPECIAL.../"
	GS.msg[3]= "\\E0A PLACE I LIKE&TO SPEND A LOT&OF TIME!!!/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++
	con= 1

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(fun == 0) {
	    if(instance_exists(775/* obj_face_papyrus */))
	        frame= obj_face_papyrus.frame
	    else  {
	        if(speed == 0 and path_speed == 0) frame= 0
	    }
	}
	if(speed == 0 and con == 0) scr_npc_watch(0)
	if(con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 2
	    solid= 0
	    GS.phase= 1
	}
	if(con == 2) {
	    if(obj_mainchara.bbox_top <= bbox_bottom and obj_mainchara.bbox_left < bbox_right) {
	        obj_mainchara.facing= 0
	        GS.facing= 0
	        obj_mainchara.image_speed= 0.25
	        obj_mainchara.velocity.y= 1
	    } else  {
	        sprite_index= lsprite
	        obj_mainchara.facing= 3
	        GS.facing= 3
	        obj_mainchara.image_speed= 0
	        obj_mainchara.velocity.y= 0
	        con= 3
	        $Alarm2.start((20) / 30.0)
	    }
	}
	if(con == 4) {
	    velocity.x= -5
	    sprite_index= lsprite
	    image_speed= 0.5
	    con= 4.5
	    $Alarm2.start((145) / 30.0)
	}
	if(con == 4.5 and obj_mainchara.bbox_left > bbox_right) {
	    obj_mainchara.velocity.x= -5
	    obj_mainchara.image_speed= 0.5
	}
	if(con == 5.5) {
	    obj_mainchara.velocity.x= 0
	    obj_mainchara.frame= 0
	    obj_mainchara.image_speed= 0
	    con= 5
	    $Alarm2.start((6) / 30.0)
	}
	if(con == 6) {
	    velocity.x= 0
	    velocity.y= 4
	    sprite_index= dsprite
	    obj_mainchara.velocity.x= 0
	    obj_mainchara.frame= 0
	    obj_mainchara.image_speed= 0
	    obj_mainchara.facing= 0
	    GS.facing= 0
	    con= 7
	    $Alarm2.start((8) / 30.0)
	}
	if(con == 8) {
	    sprite_index= rsprite
	    velocity.y= 0
	    velocity.x= 5
	    if(bbox_left > obj_mainchara.bbox_right + 10) {
	        obj_mainchara.velocity.x= 5
	        GS.facing= 1
	        obj_mainchara.facing= 1
	        obj_mainchara.image_speed= 0.5
	        con= 9
	        $Alarm2.start((145) / 30.0)
	    }
	}
	if(con == 10) {
	    velocity.x= 0
	    obj_mainchara.velocity.x= 0
	    sprite_index= utsprite
	    obj_mainchara.image_speed= 0
	    image_speed= 0
	    obj_mainchara.facing= 2
	    GS.facing= 2
	    con= 11
	    $Alarm2.start((15) / 30.0)
	}
	if(con == 12) {
	    myinteract= 3
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 0
	    GS.msg[0]= "MY HOUSE!!!/%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 13
	}
	if(con == 13 and not instance_exists(782/* OBJ_WRITER */)) {
	    velocity.y= -6
	    sprite_index= usprite
	    image_speed= 0.25
	    con= 14
	    $Alarm2.start((7) / 30.0)
	}
	if(con == 15) {
	    caster_play(436, 1, 1)
	    GS.flag[88]= 2
	    GS.phasing= 0
	    GS.interact= 0
	    instance_destroy()
	    obj_paphouse_entrance.dooract= 1
	}

func _process(delta: float):
	if(myinteract == 1) {
	    GS.interact= 1
	    $Alarm0.start((1) / 30.0)
	    myinteract= 2
	}
	if(myinteract == 3 and not is_instance_valid(mydialoguer) and con == 0) {
	    GS.interact= 0
	    myinteract= 0
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
