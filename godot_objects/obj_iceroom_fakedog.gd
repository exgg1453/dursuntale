# Auto-converted from GameMaker: obj_iceroom_fakedog
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	myinteract= 0
	scr_depth()
	image_speed= 0
	if(GS.flag[261] == 1) sprite_index= 1524/* spr_tobdog_pile */

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(GS.flag[261] == 0) {
	    GS.msg[0]= "* (You tried to pet the dog^1,&  but it collapsed into a&  pile of fluff...)/"
	    GS.msg[1]= "* (Seems like it was actually&  just a dog-shaped husk of&  dog residue.)/%%"
	    GS.flag[261]= 1
	    sprite_index= 1524/* spr_tobdog_pile */
	} else  GS.msg[0]= "* (It\'s a pile of dog residue.)/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _process(delta: float):
	if(myinteract == 1) {
	    GS.interact= 1
	    $Alarm0.start((1) / 30.0)
	    myinteract= 2
	}
	if(myinteract == 3 and not is_instance_valid(mydialoguer)) {
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
