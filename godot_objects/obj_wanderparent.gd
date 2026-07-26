# Auto-converted from GameMaker: obj_wanderparent
# GM parent: obj_solidnpcparent
extends CharacterBody2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	image_speed= 0
	dsprite= 1087
	usprite= 1092
	lsprite= 1088
	rsprite= 1089
	dtsprite= 1094
	utsprite= 1093
	ltsprite= 1091
	rtsprite= 1090
	script_execute(109/* scr_npcsetup */, 2)
	movement$Alarm0.start((20) / 30.0)
	movement$Alarm1.start((-1) / 30.0)
	memoryispeed= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 9999
	GS.typer= 4
	GS.facechoice= 1
	GS.faceemotion= 0
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _process(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(GS.interact < 1) {
	    if(halt == 1) {
	        speed= memoryspeed
	        image_speed= memoryispeed
	    }
	    movementalarm[0]--
	    movementalarm[1]--
	    if(movement$Alarm0.start((= 0) {) / 30.0)
	        i= round(random(3))
	        direction= i * 90
	        speed= 2
	        stopped= 0
	        frame= 1
	        image_speed= 0.2
	        movement$Alarm1.start((10 + round(random(10))) / 30.0)
	        scr_npcdir(0)
	    }
	    if(movement$Alarm1.start((= 0) {) / 30.0)
	        image_speed= 0
	        frame= 0
	        speed= 0
	        halt= 0
	        stopped= 1
	        movement$Alarm0.start((30 + round(random(20))) / 30.0)
	    }
	} else  {
	    if(stopped == 0) {
	        memoryispeed= image_speed
	        memoryspeed= speed
	        if(myinteract == 0) image_speed= 0
	        speed= 0
	        stopped= 1
	        halt= 1
	    }
	}
	if(myinteract == 1) {
	    GS.interact= 1
	    image_speed= 0.2
	    scr_npcdir(0)
	    $Alarm0.start((1) / 30.0)
	    myinteract= 2
	}
	if(myinteract == 3 and not is_instance_valid(mydialoguer)) {
	    GS.interact= 0
	    myinteract= 0
	    image_speed= memoryispeed
	    scr_npcdir(0)
	}

func _on_alarm_0_timeout():
	action_move_to(xprevious, yprevious)

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
