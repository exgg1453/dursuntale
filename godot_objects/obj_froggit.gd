# Auto-converted from GameMaker: obj_froggit
# GM parent: obj_fakefroggit
extends Node2D

func _gm_event_2_6():
	blcon= instance_create(x + sprite_width, y, 186/* obj_blconsm */)
	mycommand= round(random(100))
	if(mycommand >= 0 and mycommand < 30)
	    GS.msg[0]= "Ribbit,&ribbit."
	if(mycommand >= 30 and mycommand < 50)
	    GS.msg[0]= "Croak,&croak."
	if(mycommand >= 50 and mycommand < 80)
	    GS.msg[0]= "Hop,&hop."
	if(mycommand >= 80 and mycommand <= 100) GS.msg[0]= "Meow."
	if(whatiheard == 3) {
	    GS.msg[0]= "(Blushes&deeply.)&Ribbit.."
	    $Alarm5.start((108) / 30.0)
	}
	if(whatiheard == 1) GS.msg[0]= "Shiver,&shiver."
	GS.msg[1]= "%%%"
	GS.typer= 2
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 3
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	whatiheard= -1
	GS.mnfight= 2

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
	if(keyboard_multicheck_pressed(13/* ENTER */) and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0] and alarm[6] < 0)
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
	    if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 3)
	        GS.firingrate*= 1.5
	    if(GS.monster[0] + GS.monster[1] + GS.monster[2] == 2)
	        GS.firingrate*= 1.25
	    if(mycommand >= 0 and mycommand <= 40) {
	        if(GS.monster[0] + GS.monster[1] + GS.monster[2] > 1)
	            gen= instance_create(x, y, 713/* obj_1sidegen */)
	        else 
	            gen= instance_create(GS.idealborder[1] - 40, GS.idealborder[3] - 40, 625/* blt_leapfrog */)
	        gen.dmg= GS.monsteratk[myself]
	    } else  {
	        gen= instance_create(x, y, 713/* obj_1sidegen */)
	        gen.bullettype= 1
	    }
	    gen.myself= myself
	    if(mycommand >= 0)
	        GS.msg[0]= "* Froggit doesn\'t seem to&  know why it\'s here."
	    if(mycommand >= 30) GS.msg[0]= "* Froggit hops to and fro."
	    if(mycommand >= 60)
	        GS.msg[0]= "* The battlefield is filled&  with the smell of mustard&  seed."
	    if(mycommand >= 80)
	        GS.msg[0]= "* You are intimidated by&  Froggit\'s raw strength^4.&* Only kidding."
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
	    if(whatiheard == 1) {
	        GS.msc= 0
	        GS.msg[0]= "* Froggit didn\'t understand&  what you said^1, but was&  scared anyway./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        mercymod= 30
	    }
	    if(whatiheard == 3) {
	        GS.flag[130]= 1
	        GS.msc= 0
	        GS.msg[0]= "* Froggit didn\'t understand&  what you said^1, but was&  flattered anyway./^"
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
