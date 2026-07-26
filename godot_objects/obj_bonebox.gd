# Auto-converted from GameMaker: obj_bonebox
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	read= 0
	scale.x= 1
	scale.y= 1
	scr_depth()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(instance_exists(1025/* obj_papyrusparent */)) {
	    scr_papface(0, 0)
	    GS.msg[1]= "HEY^1, THOSE ARE ALL&THE ATTACKS I USED&ON YOU./"
	    GS.msg[2]= "GREAT MEMORIES^1,&HUH?/"
	    GS.msg[3]= "SEEMS LIKE IT&WAS ONLY&YESTERDAY.../"
	    GS.msg[4]= "\\E3EVEN THOUGH&IT BASICALLY&JUST HAPPENED./%%"
	    if(GS.flag[290] == 1) {
	        GS.msg[1]= "HEY^1, THOSE ARE ALL&THE ATTACKS I&DIDN\'T USE./"
	        GS.msg[2]= "\\WHOW LUCKY OF YOU^1!&HAD I ONLY USED&MY \\YSPECIAL ATTACK\\W,/"
	        GS.msg[3]= "\\E2YOU SURELY WOULD&HAVE BEEN BLASTED&TO.../"
	        GS.msg[4]= "\\WH\\E3EY.^1 WAIT^1.&WHERE\'S MY \\YSPECIAL&ATTACK\\W?/"
	        GS.msg[5]= "\\E1NO^1! I\'VE BEEN&DOGBURGLED BY THAT&PERNICIOUS PUP!/"
	        GS.msg[6]= "\\E3THAT LOATHESOME&SCOUNDREL LOVES TO&SNEAK INTO MY ROOM./"
	        GS.msg[7]= "\\E5SOMETIMES IT EVEN&CRAWLS INTO MY BED&WHILE I\'M RESTING./"
	        GS.msg[8]= "\\E3IF THAT WASN\'T&BAD ENOUGH^1, IT HAS&VERY COLD FEET./%%"
	    }
	    if(read > 0) GS.msg[0]= "* (It\'s a box of bones.)/%%"
	} else  GS.msg[0]= "* (It\'s a box of bones.)/%%"
	read++
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
