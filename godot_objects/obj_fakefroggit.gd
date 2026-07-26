# Auto-converted from GameMaker: obj_fakefroggit
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	mypart1= instance_create(x, y, 215/* obj_froghead */)
	mypart2= instance_create(x, y, 214/* obj_froglegs */)
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= 3
	GS.flag[30]= 1
	ht= 100
	wd= 100

func _gm_event_1_0():
	if(mercymod == 30 and GS.monsterhp[myself] == GS.monstermaxhp[myself] and mercymod > 10 and GS.monsterhp[myself] == GS.monstermaxhp[myself])
	    GS.goldreward[3]+= 2
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()
	with(mypart2) instance_destroy()

func _gm_event_2_11():
	velocity.x= -4
	frame= 3

func _gm_event_2_10():
	with(mypart1) instance_destroy()
	with(mypart2) instance_destroy()
	frame= 2
	$Alarm11.start((30) / 30.0)

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	instance_create(get_viewport_rect().size.x + 40, y + sprite_height - 204, 196/* obj_torieldisapprove */)
	$Alarm10.start((40) / 30.0)

func _gm_event_2_3():
	if(frame != 1) {
	    with(mypart1) instance_destroy()
	    with(mypart2) instance_destroy()
	    dmgwriter= instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    frame= 1
	    snd_play(51/* snd_damage */)
	    $Alarm8.start((11) / 30.0)
	}
	x+= shudder
	if(shudder < 0) shudder= -(shudder + 2)
	else  shudder= -shudder
	if(shudder == 0) {
	    GS.hurtanim[myself]= 2
	    exit
	} else  {
	    $Alarm3.start((2) / 30.0)
	    exit
	}

func _process(delta: float):
	if(GS.mnfight == 3) attacked= 0
	if(alarm[5] > 0) {
	    if(GS.monster[0] == 1 and GS.monsterinstance[0].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[0].alarm[5]) / 30.0)
	    if(GS.monster[1] == 1 and GS.monsterinstance[1].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[1].alarm[5]) / 30.0)
	    if(GS.monster[2] == 1 and GS.monsterinstance[2].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[2].alarm[5]) / 30.0)
	}
	if(GS.mnfight == 1 and talked == 0) {
	    $Alarm5.start((60) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(keyboard_multicheck_pressed(13/* ENTER */) and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0])
	    $Alarm5.start((2) / 30.0)
	if(GS.hurtanim[myself] == 1) {
	    shudder= 16
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        mypart1= instance_create(x, y, 215/* obj_froghead */)
	        mypart2= instance_create(x, y, 214/* obj_froglegs */)
	        GS.hurtanim[myself]= 0
	        frame= 0
	        GS.myfight= 0
	        GS.mnfight= 1
	    } else  {
	        GS.myfight= 0
	        GS.mnfight= 1
	        killed= 1
	        instance_destroy()
	    }
	}
	if(GS.hurtanim[myself] == 5) {
	    GS.damage= 0
	    instance_create(x + sprite_width / 2 - 48, y - 24, 189/* obj_dmgwriter */)
	    // obj_dmgwriter
	    with(189) $Alarm2.start((30) / 30.0)
	    GS.myfight= 0
	    GS.mnfight= 1
	    GS.hurtanim[myself]= 0
	}
	if(GS.mnfight == 2 and attacked == 0) {
	    GS.turntimer= 100
	    GS.firingrate= 20
	    gen= instance_create(x, y, 713/* obj_1sidegen */)
	    if(mycommand >= 0)
	        GS.msg[0]= "* Froggit doesn\'t seem to&  know why it\'s here."
	    if(mycommand >= 30) GS.msg[0]= "* Froggit hops to and fro."
	    if(mycommand >= 60)
	        GS.msg[0]= "* The battlefield is filled   with the smell of&   mustard seed."
	    if(mycommand >= 80)
	        GS.msg[0]= "* You are intimidated by&  Froggit\'s raw strength^4.&  * Only kidding."
	    if(mercymod > 5)
	        GS.msg[0]= "* Froggit seems reluctant&  to fight you."
	    if(GS.monsterhp[myself] < 5)
	        GS.msg[0]= "* Froggit is trying to&  run away."
	    attacked= 1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* FROGGIT - ATK 4 DEF 5&* Life is difficult for&  this enemy./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* Froggit didn\'t understand&  what you said^1, but was&  flattered anyway./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        mercymod= 30
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* Froggit didn\'t understand&  what you said^1, but was&  scared anyway./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        mercymod= 30
	    }
	    GS.heard= 1
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) instance_destroy()
	}
	if(x < -sprite_width) GS.monster[myself]= 0

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
