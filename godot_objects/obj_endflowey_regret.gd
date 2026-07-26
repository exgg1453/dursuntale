# Auto-converted from GameMaker: obj_endflowey_regret
extends Node2D

func _ready():
	$Alarm4.start((150) / 30.0)
	con= 0
	flowey= -1
	$Alarm5.start((60) / 30.0)
	fimg= 0
	GS.inbattle= 0
	GS.faceemotion= 0
	ini_open("undertale.ini")
	chara= ini_read_string("General", "Name", "CHARA")
	ini_close()

func _gm_event_2_5():
	flowey= 1

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "Hi./%%"
	    instance_create(60, 60, 782/* OBJ_WRITER */)
	    con= 1.1
	}
	if(con == 1.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 0.9
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 1.9) {
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "Seems as if everyone&is perfectly happy./"
	    GS.msg[1]= "Monsters have returned&to the surface./"
	    GS.msg[2]= "Peace and prosperity&will rule across the land./"
	    GS.msg[3]= "\\E6Take a deep breath./"
	    GS.msg[4]= "\\E5There\'s nothing left&to worry about./%%"
	    instance_create(60, 60, 782/* OBJ_WRITER */)
	    con= 0.2
	}
	if(con == 0.2 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 1.2
	    $Alarm4.start((70) / 30.0)
	}
	if(con == 2.2) {
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "\\E7.../"
	    GS.msg[1]= "\\E6Well./"
	    GS.msg[2]= "\\E1There is one thing./"
	    GS.msg[3]= "\\E3One last threat./"
	    GS.msg[4]= "One being with the&power to erase&EVERYTHING.../"
	    GS.msg[5]= "\\E1Everything everyone\'s&worked so hard for./"
	    GS.msg[6]= "\\E7.../"
	    GS.msg[7]= "\\E6You know who I\'m&talking about^1, don\'t&you?/"
	    GS.msg[8]= "\\E1That\'s right./"
	    GS.msg[9]= "\\E4I\'m talking about YOU./"
	    GS.msg[10]= "\\E7YOU still have the&power to reset&everything./"
	    GS.msg[11]= "\\E0Toriel^1, Sans^1, Asgore^1,&Alphys, Papyrus, Undyne.../"
	    GS.msg[12]= "If you so choose.../"
	    GS.msg[13]= "Everyone will be&ripped from this&timeline.../"
	    GS.msg[14]= "... and sent back before&all of this&ever happened./"
	    GS.msg[15]= "\\E6Nobody will&remember anything./"
	    GS.msg[16]= "\\E5You\'ll be able to&do whatever you&want./"
	    GS.msg[17]= "\\E0.../"
	    GS.msg[18]= "\\E7That power./"
	    GS.msg[19]= "\\E3I know that power./"
	    GS.msg[20]= "\\E6That\'s the power&you were fighting to&stop^1, wasn\'t it?/"
	    GS.msg[21]= "\\E7The power that I&wanted to use./"
	    GS.msg[22]= "\\E6But now^1, the idea&of resetting&everything.../"
	    GS.msg[23]= "\\E7I.../"
	    GS.msg[24]= "\\E1I don\'t think I&could do it all&again./"
	    GS.msg[25]= "Not after that./"
	    GS.msg[26]= "\\E7.../"
	    GS.msg[27]= "\\E1So, please./"
	    GS.msg[28]= "\\E3Just let them go./"
	    GS.msg[29]= "Let Frisk be happy./"
	    GS.msg[30]= "Let Frisk live&their life./%%"
	    instance_create(60, 60, 782/* OBJ_WRITER */)
	    con= 0.3
	}
	if(con == 0.3 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 1.3
	    $Alarm4.start((70) / 30.0)
	}
	if(con == 2.3) {
	    GS.msc= 0
	    GS.typer= 68
	    GS.msg[0]= "\\E1.../"
	    GS.msg[1]= "\\E3But./"
	    GS.msg[2]= "If I can\'t change&your mind./"
	    GS.msg[3]= "If you DO end up&erasing everything.../"
	    GS.msg[4]= "\\E7.../"
	    GS.msg[5]= "\\E6You have to erase&my memories^1, too./"
	    GS.msg[6]= "\\E7.../"
	    GS.msg[7]= "\\E6I\'m sorry./"
	    GS.msg[8]= "\\E5You\'ve probably heard&this a hundred times&already^1, haven\'t you...?/"
	    GS.msg[9]= ".../"
	    GS.msg[10]= "\\E0Well^1, that\'s all./"
	    GS.msg[11]= "\\E6See you later.../"
	    GS.msg[12]= "\\E4" + chara + "./%%"
	    instance_create(60, 60, 782/* OBJ_WRITER */)
	    con= 2
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    flowey= 3
	    con= 3
	    $Alarm4.start((200) / 30.0)
	}
	if(con == 4) {
	    ini_open("undertale.ini")
	    true_end= ini_write_real("EndF", "EndF", 2)
	    ini_close()
	    get_tree().change_scene_to_file("res://godot_rooms/323.tscn")
	}

func _on_outside_room():
	if(flowey == 1) {
	    draw_sprite_ext(647/* spr_flowey_riseanim2 */, fimg, 140, 140, 1, 1, 0, 16777215, 1)
	    if(fimg < 8) fimg+= 0.5
	    else  flowey= 2
	}
	if(flowey == 2) {
	    draw_sprite_ext(647/* spr_flowey_riseanim2 */, fimg, 140, 140, 1, 1, 0, 16777215, 1)
	    draw_sprite_ext(644/* spr_floweyface_l */, GS.faceemotion, 140, 140, 1, 1, 0, 16777215, 1)
	}
	if(flowey == 3) {
	    draw_sprite_ext(623/* spr_flowey_riseanim */, fimg, 140, 140, 1, 1, 0, 16777215, 1)
	    if(fimg > 0) fimg-= 0.5
	    else  flowey= 4
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
