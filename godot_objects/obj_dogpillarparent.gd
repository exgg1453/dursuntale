# Auto-converted from GameMaker: obj_dogpillarparent
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	g= 0
	myinteract= 0
	scale.x= 1
	scale.y= 1
	if(object_index == 962) {
	    if(GS.flag[55] == 1) {
	        g= 1
	        sprite_index= 1183/* spr_dogmush */
	        y+= 20
	    }
	    if(GS.flag[55] == 0 and GS.plot < 67) {
	        g= 2
	        sprite_index= 1269/* spr_lessdogsnow */
	        y+= 30
	    }
	} else  {
	    if(GS.flag[55] == 1 or GS.flag[55] == 0) instance_destroy()
	}
	scr_depth(0, 0, 0, 0, 0)

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Seems like the base of a&  snowdog./%%"
	if(g == 1) GS.msg[0]= "* It\'s a pile of mushy snow./%%"
	if(g == 2)
	    GS.msg[0]= "* This dog is staring blankly&  into the snow^1, waiting for&  it to turn into art./%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

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
