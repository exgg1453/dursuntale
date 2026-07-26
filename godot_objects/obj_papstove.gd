# Auto-converted from GameMaker: obj_papstove
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

func _on_destroy():
	myinteract= 3
	GS.msc= 556
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msc= 0
	GS.msg[0]= "* (There\'s an empty pie tin&  inside the stove.)/%%"
	if(instance_exists(1025/* obj_papyrusparent */)) {
	    scr_papface(0, 0)
	    GS.msg[1]= "\\E0MY BROTHER ALWAYS&GOES OUT TO EAT^1.&BUT.../"
	    GS.msg[2]= "\\E3RECENTLY^1, HE TRIED&\'BAKING\' SOMETHING./"
	    GS.msg[3]= "IT WAS LIKE..^1.&A QUICHE./"
	    GS.msg[4]= "BUT FILLED WITH A&SUGARY^1, NON-EGG&SUBSTANCE./"
	    GS.msg[5]= "\\E0HOW ABSURD!/%%"
	}
	if(talkedto > 0)
	    GS.msg[0]= "* (There\'s an empty pie tin&  inside the stove.)/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process(delta: float):
	if(myinteract == 1) {
	    if(obj_kitchenchecker.level == 0) {
	        GS.interact= 1
	        $Alarm0.start((1) / 30.0)
	        myinteract= 2
	    } else  myinteract= 0
	}
	if(myinteract == 3 and not is_instance_valid(mydialoguer)) {
	    GS.interact= 0
	    myinteract= 0
	}

func _on_alarm_0_timeout():
	if(instance_exists(1414/* obj_kitchenchecker */) and (obj_kitchenchecker.level == 1 or obj_kitchenchecker.level == 0)) {
	    // obj_mainchara
	    with(1570) {
	        x= xprevious
	        y= yprevious
	        moving= 0
	    }
	}

func _on_outside_room():
	draw_sprite(1628/* spr_kitchencounter */, 0, x, y - 41)
	draw_sprite(sprite_index, frame, x, y)

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
