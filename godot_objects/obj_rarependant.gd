# Auto-converted from GameMaker: obj_rarependant
# GM parent: obj_readablesolid
extends CharacterBody2D

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
	if(GS.flag[7] == 1) GS.flag[107]= 1
	if(GS.flag[107] == 1) frame= 1
	dogsong= caster_load("music/dogsong.ogg")
	con= 0
	anti_buffer= 0

func _gm_event_2_4():
	con++

func _on_destroy():
	if(anti_buffer == 0) {
	    myinteract= 3
	    GS.msc= 256
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    talkedto++
	}

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(GS.flag[107] == 0) {
	    hasdog= 0
	    i= 0
	    while(i < 8) {
	        if(GS.item[i] == 27) hasdog= 1
	        i++
	    }
	    if(hasdog == 0) {
	        noroom= 0
	        scr_itemget(27)
	        if(noroom != 1) GS.flag[107]= 2
	    }
	}
	if(con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    myinteract= 0
	    GS.interact= 1
	    caster_pause(GS.currentsong)
	    snd_play(47/* snd_grab */)
	    if(GS.facing != 3) {
	        dog= instance_create(obj_mainchara.x + 30, obj_mainchara.y + 10, 1088/* obj_tobdog_pendant */)
	        dog.sprite_index= 1525/* spr_tobdogr */
	    } else  {
	        dog= instance_create(obj_mainchara.x - 30, obj_mainchara.y + 10, 1088/* obj_tobdog_pendant */)
	        dog.sprite_index= 1520/* spr_tobdogl */
	    }
	    $Alarm4.start((30) / 30.0)
	    con= 2
	}
	if(con == 3) {
	    with(dog) con= 1
	    caster_play(dogsong, 1, 1)
	    con= 4
	}
	if(con == 5) {
	    res= floor(random(5))
	    scr_itemget(29 + res)
	    GS.interact= 0
	    caster_stop(dogsong)
	    caster_set_volume(GS.currentsong, 0)
	    caster_resume(GS.currentsong)
	    instance_create(0, 0, 152/* obj_musfadein */)
	    GS.flag[107]= 1
	    con= 6
	    myinteract= 0
	    anti_buffer= 0
	}
	if(con > 0 and con < 6) {
	    GS.interact= 1
	    anti_buffer= 1
	}

func _gm_event_7_5():
	if(GS.flag[107] == 2) {
	    i= 0
	    while(i < 8) {
	        if(GS.item[i] == 27) scr_itemshift(i, 0)
	        i++
	    }
	    GS.flag[107]= 0
	}
	caster_free(dogsong)

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
