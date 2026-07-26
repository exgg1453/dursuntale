# Auto-converted from GameMaker: obj_shyrensisternpc
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	if(GS.flag[7] == 0) instance_destroy()
	buffer= 0
	talkedto= 0
	scr_depth()

func _process(delta: float):
	buffer--
	if(buffer > 0 and myinteract == 1) myinteract= 0
	if(myinteract == 1 and GS.interact == 0) {
	    caster_play(338, 0.6, 0.6)
	    myinteract= 2
	    GS.interact= 1
	    image_speed= 0.2
	    sistext= instance_create(0, 0, 1516/* obj_sistertext */)
	    if(talkedto == 1) {
	        with(sistext)
	            phrase= "Part of me wants to#see my new " + chr(ord('"')) + "brother" + chr(ord('"')) + "#Aaron. "
	    }
	    if(talkedto == 2) {
	        with(sistext) phrase= "But most other parts#of me... don\'t. "
	    }
	}
	if(myinteract == 2 and not is_instance_valid(sistext)) {
	    talkedto++
	    if(talkedto == 3) talkedto= 0
	    image_speed= 0
	    frame= 0
	    myinteract= 0
	    GS.interact= 0
	    buffer= 4
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
