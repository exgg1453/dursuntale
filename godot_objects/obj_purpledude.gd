# Auto-converted from GameMaker: obj_purpledude
# GM parent: obj_readable
extends CharacterBody2D

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
	con= 0
	if(GS.plot < 110) instance_destroy()
	if(scr_murderlv() >= 8 and GS.flag[27] == 0) y= 900
	if(GS.entrance == 24) {
	    GS.interact= 1
	    con= 20
	    visible= 0
	    obj_mainchara.visible= 0
	    obj_mainchara.x= x
	    obj_mainchara.y= y - 15
	}

func _gm_event_2_4():
	con++

func _on_destroy():
	myinteract= 3
	GS.msc= 680
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Come on! What are you doing!/%%"
	if(GS.flag[85] == 1) {
	    GS.msc= 0
	    GS.msg[0]= "* Ahhh..^1.&* No umbrellas allowed!/%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_npc_anim()
	if(con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 1
	    con= 2
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 2) GS.interact= 1
	if(con == 3) {
	    GS.phasing= 1
	    obj_mainchara.velocity.y= 3
	    con= 4
	}
	if(con == 4 and obj_mainchara.y > y - 10) {
	    obj_mainchara.velocity.y= 0
	    con= 5
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 6) {
	    pil= instance_create(x + 10, y + 20, 1084/* obj_waterpillar */)
	    con= 7
	    $Alarm4.start((3) / 30.0)
	}
	if(con == 8) {
	    visible= 0
	    obj_mainchara.visible= 0
	    con= 9
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 10) {
	    instance_create(0, 0, 149/* obj_unfader */)
	    con= 11
	    GS.entrance= 24
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 12) {
	    instance_create(0, 0, 148/* obj_persistentfader */)
	    if(room == 93) get_tree().change_scene_to_file("res://godot_rooms/91.tscn")
	    if(room == 91) get_tree().change_scene_to_file("res://godot_rooms/93.tscn")
	    con= 13
	}
	if(con == 20) {
	    con= 21
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 21) {
	    GS.interact= 1
	    visible= 0
	    obj_mainchara.visible= 0
	    obj_mainchara.x= x
	    obj_mainchara.y= y - 8
	}
	if(con == 22) {
	    pil= instance_create(x + 10, y + 20, 1084/* obj_waterpillar */)
	    con= 23
	    $Alarm4.start((3) / 30.0)
	}
	if(con == 24) {
	    obj_mainchara.visible= 1
	    visible= 1
	    con= 25
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 26) {
	    GS.phasing= 1
	    obj_mainchara.image_speed= 0.25
	    GS.facing= 2
	    obj_mainchara.velocity.y= -3
	    $Alarm4.start((6) / 30.0)
	    con= 27
	}
	if(con == 28) {
	    obj_mainchara.velocity.y= 0
	    GS.facing= 0
	    obj_mainchara.image_speed= 0
	    con= 29
	    $Alarm4.start((20) / 30.0)
	    GS.phasing= 0
	}
	if(con == 30) {
	    GS.msg[0]= "* Thanks for stepping on&  my face^1.&* Here\'s the 3 gold./"
	    GS.msg[1]= "* (You got 3 gold.)/%%"
	    GS.gold+= 3
	    GS.msc= 0
	    scr_regulartext()
	    con= 31
	}
	if(con == 31 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 0
	    con= 0
	}

func _process(delta: float):
	if(con == 0) {
	    if(myinteract == 1) {
	        GS.interact= 1
	        $Alarm0.start((1) / 30.0)
	        myinteract= 2
	    }
	    if(myinteract == 3 and not is_instance_valid(mydialoguer)) {
	        GS.interact= 0
	        myinteract= 0
	    }
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
