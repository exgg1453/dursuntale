# Auto-converted from GameMaker: obj_ladiesfishingrod
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	myinteract= 0
	scale.x= 1
	scale.y= 1
	reeled= 0
	image_speed= 0
	orx= 0
	if(GS.plot > 100 and GS.flag[5] == 65 and GS.flag[7] == 0) {
	    orx= 0
	    if(file_exists("undertale.ini")) {
	        ini_open("undertale.ini")
	        srx= ini_read_real("General", "fun", 0)
	        if(srx == 65) {
	            orx= 1
	            GS.flag[5]= 0
	            ini_write_real("General", "fun", 0)
	        }
	        ini_close()
	    }
	    if(orx == 1) orx= choose(0, 1)
	}
	if(orx == 1) get_tree().change_scene_to_file("res://godot_rooms/270.tscn")

func _on_destroy():
	myinteract= 3
	GS.msc= 224
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(reeled == 1) {
	    frame= 0
	    reeled= 0
	    GS.msc= 0
	    GS.msg[0]= "* You send the line back out./%%"
	}
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
