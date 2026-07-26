# Auto-converted from GameMaker: obj_shoetargettest
# GM parent: obj_battlethingparent
extends Node2D

func _ready():
	fade= 0
	hit= 0
	myscore= 0
	check= 274
	thensc= 0
	fatalx= 274 + x
	wherex= -50
	type= 0
	if(GS.weapon == 25) type= 0
	if(GS.weapon == 47) type= 1
	if(GS.weapon == 49) type= 2
	if(GS.weapon == 45) type= 3
	num= 3
	if(type == 0) {
	    lr= choose(0)
	    if(lr == 0) event_user(4)
	    if(lr == 1) event_user(5)
	    wherex= choose(0, 25, 50)
	    lr= choose(0)
	    if(lr == 0) event_user(4)
	    if(lr == 1) event_user(5)
	    wherex= choose(100, 125, 150)
	    lr= choose(0)
	    if(lr == 0) event_user(4)
	    if(lr == 1) event_user(5)
	    num= 3
	}
	if(type == 1) {
	    lr= choose(1)
	    if(lr == 0) event_user(4)
	    if(lr == 1) event_user(5)
	    wherex= choose(0, 25, 50)
	    lr= choose(1)
	    if(lr == 0) event_user(4)
	    if(lr == 1) event_user(5)
	    wherex= choose(100, 125, 150)
	    lr= choose(1)
	    if(lr == 0) event_user(4)
	    if(lr == 1) event_user(5)
	    wherex= 200
	    lr= choose(1)
	    if(lr == 0) event_user(4)
	    if(lr == 1) event_user(5)
	    num= 4
	}
	if(type == 2) {
	    wherex= 120
	    lr= choose(0)
	    if(lr == 0) event_user(4)
	    if(lr == 1) event_user(5)
	    wherex= choose(180, 210, 240)
	    lr= choose(0)
	    if(lr == 0) event_user(4)
	    if(lr == 1) event_user(5)
	    wherex= choose(300, 330, 360)
	    lr= choose(0)
	    if(lr == 0) event_user(4)
	    if(lr == 1) event_user(5)
	    wherex= choose(400, 430, 460)
	    lr= choose(0)
	    if(lr == 0) event_user(4)
	    if(lr == 1) event_user(5)
	    num= 4
	}
	if(type == 3) {
	    lr= choose(1)
	    wherex= choose(-50, -25)
	    if(lr == 0) event_user(4)
	    if(lr == 1) event_user(5)
	    wherex= choose(0, 25, 50)
	    lr= choose(1)
	    if(lr == 0) event_user(4)
	    if(lr == 1) event_user(5)
	    num= 2
	}

func _gm_event_7_15():
	newtarg= instance_create(x + sprite_width + wherex, y, 722/* obj_ztarget */)
	newtarg.velocity.x= -10
	if(GS.weapon == 49) newtarg.velocity.x= -15
	newtarg.priority= instance_number(719) - 1
	newtarg.fatalx= fatalx

func _gm_event_7_14():
	newtarg= instance_create(x - wherex, y, 721/* obj_xtarget */)
	newtarg.velocity.x= 10
	if(GS.weapon == 49) newtarg.velocity.x= 15
	newtarg.priority= instance_number(719) - 1
	newtarg.fatalx= fatalx

func _gm_event_7_13():
	thensc= 0
	sc= abs(floor(check.x / check.velocity.x) - floor(fatalx / check.velocity.x))
	if(sc < 28) thensc= 10
	if(sc < 22) thensc= 15
	if(sc < 16) thensc= 20
	if(sc < 10) thensc= 40
	if(sc < 5) thensc= 50
	if(sc < 4) thensc= 70
	if(sc < 3) thensc= 80
	if(sc < 2) thensc= 90
	if(sc < 1) {
	    thensc= 110
	    check.x= fatalx
	}
	myscore+= thensc
	fadebar= instance_create(check.x, check.y, 720/* obj_fadebar */)
	if(sc < 1) {
	    fadebar.frame= 2
	    fadebar.image_speed= 1
	    snd_play(54/* snd_victor */)
	} else  {
	    if(sc < 5) {
	        fadebar.frame= 1
	        snd_play(55/* snd_hit */)
	    }
	}
	with(check) instance_destroy()
	if(myscore > 430) myscore*= 1.8
	if(myscore >= 400) myscore*= 1.25

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, 1, 1, 0, 16777215, modulate.a)
	if(fade == 1) {
	    modulate.a-= 0.08
	    scale.x-= 0.06
	}
	if(scale.x < 0.08) instance_destroy()
	if(instance_number(719) == 0 and hit == 0) {
	    hit= 1
	    if(myscore == 0) {
	        GS.damage= 0
	        GS.hurtanim[GS.mytarget]= 5
	        fade= 1
	        exit
	    } else  {
	        if(myscore > 0) {
	            mons= GS.monsterinstance[GS.mytarget]
	            script_execute(162/* scr_attackcalc */)
	            damage*= myscore / 160 * 4 / num
	            damage= round(damage)
	            GS.damage= damage
	            GS.damage+= round(random(2))
	            mons.takedamage= GS.damage
	            GS.stretch= 2
	            ht= 100
	            wd= 100
	            mons.trgtest= id
	            critter= 0
	            if(myscore > 400 * num / 4) critter= 1
	            with(mons) {
	                trgtest.ht= ht
	                trgtest.wd= wd
	            }
	            if(GS.weapon == 25) {
	                instance_create(mons.x + wd / 2, mons.y + ht / 2, 717/* obj_strongpunch */)
	                if(critter == 1) {
	                    // obj_strongpunch
	                    with(717) event_user(5)
	                }
	                GS.damagetimer= 10
	            }
	            if(GS.weapon == 49) {
	                instance_create(mons.x + wd / 2, mons.y + ht / 2, 727/* obj_gunshot_stab */)
	                if(critter == 1) {
	                    // obj_gunshot_stab
	                    with(727) event_user(5)
	                }
	                GS.damagetimer= 20
	            }
	            if(GS.weapon == 47) {
	                instance_create(mons.x + wd / 2, mons.y + ht / 2, 731/* obj_frypan_impact */)
	                if(critter == 1) {
	                    // obj_frypan_impact
	                    with(731) event_user(5)
	                }
	                GS.damagetimer= 20
	            }
	            if(GS.weapon == 45) {
	                instance_create(mons.x + wd / 2, mons.y + ht / 2, 726/* obj_notebook_attackanim */)
	                if(critter == 1) {
	                    // obj_notebook_attackanim
	                    with(726) event_user(5)
	                }
	                GS.damagetimer= 24
	            }
	            GS.hurtanim[GS.mytarget]= 1
	            fade= 1
	        }
	    }
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
