# Auto-converted from GameMaker: obj_hivestem
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1952
	usprite= 1951
	lsprite= 1952
	rsprite= 1951
	dtsprite= 1950
	utsprite= 1953
	ltsprite= 1950
	rtsprite= 1953
	myinteract= 0
	facing= 0
	direction= 180
	talkedto= 0
	image_speed= 0
	if(scr_murderlv() >= 10) instance_destroy()
	if(GS.flag[269] == 1) sprite_index= 1949/* spr_temmie_hivetalk */
	con= 0

func _gm_event_2_4():
	con++

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 28
	GS.facechoice= 0
	GS.faceemotion= 0
	if(GS.flag[269] == 1) GS.msg[0]= "* hOIVS!/%%"
	else  {
	    GS.msg[0]= "* p..^1.&* tem heard human allergics&  to tem.../"
	    GS.msg[1]= "* dat OK..^1.&* tem understan.../"
	    GS.msg[2]= "* tem..^1.&* ALSO allergic to tem!!!/%%"
	    con= 2
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(con < 3) scr_npc_anim()
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 1
	    con= 3
	    caster_pause(GS.currentsong)
	    $Alarm4.start((45) / 30.0)
	}
	if(con == 3) GS.interact= 1
	if(con == 4) {
	    snd_play(112/* snd_movemenu */)
	    sprite_index= 1948/* spr_temmie_hive */
	    frame= 1
	    con= 5
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 6) {
	    snd_play(112/* snd_movemenu */)
	    sprite_index= 1948/* spr_temmie_hive */
	    frame= 2
	    con= 7
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 8) {
	    snd_play(112/* snd_movemenu */)
	    sprite_index= 1948/* spr_temmie_hive */
	    frame= 3
	    con= 9
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 10) {
	    snd_play(112/* snd_movemenu */)
	    sprite_index= 1949/* spr_temmie_hivetalk */
	    frame= 0
	    con= 11
	    $Alarm4.start((45) / 30.0)
	}
	if(con == 12) {
	    GS.flag[269]= 1
	    con= -1
	    GS.interact= 0
	    caster_resume(GS.currentsong)
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
