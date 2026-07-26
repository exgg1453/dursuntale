# Auto-converted from GameMaker: obj_darkfridge
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	image_speed= 0
	talkedto= 0
	scr_depth()
	shsh= 0
	if(x > 340 and x < 410) $Alarm8.start((90) / 30.0)

func _gm_event_2_9():
	$Alarm8.start((80 + random(200)) / 30.0)
	shsh= 0

func _gm_event_2_8():
	shsh= 2
	$Alarm9.start((5 + random(8)) / 30.0)

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* (It\'s a refrigerator.^1)&* (It\'s empty.)/%%"
	if(x > 242) {
	    GS.msg[0]= "* (It\'s a refrigerator.^1)&* (It seems to contain&  samples of some kind.)/%%"
	    if(GS.flag[490] == 0)
	        GS.msg[0]= "* There\'s something here..^1.&* It feels like it\'s&  breathing./%%"
	}
	if(x > 340) {
	    GS.msg[0]= "* (It\'s a refrigerator.^1)&* (It\'s empty.)/%%"
	    if(GS.flag[490] == 0)
	        GS.msg[0]= "* There\'s something here..^1.&* It feels like a tree^1, ripe&  with delicious fruit./%%"
	}
	if(x > 440) {
	    GS.msg[0]= "* (It\'s a refrigerator.^1)&* (It seems to contain&  samples of some kind.)/%%"
	    if(GS.flag[490] == 0)
	        GS.msg[0]= "* There\'s something here..^1.&* Something in the shape&  of a man./%%"
	}
	if(x > 530) {
	    GS.msg[0]= "* (It\'s a refrigerator.^1)&* (It\'s empty.)/%%"
	    if(GS.flag[490] == 0)
	        GS.msg[0]= "* There\'s something here..^1.&* It feels warm^1, and moist./%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	if(shsh > 0) {
	    x= xstart + random(shsh) - random(shsh)
	    y= ystart + random(shsh) - random(shsh)
	} else  {
	    x= xstart
	    y= ystart
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
