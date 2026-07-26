# Auto-converted from GameMaker: blt_sizebone
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	dmg= 6
	image_speed= 0
	blue= 0
	osc= 0
	oscmax= 20
	oscmin= 20
	drawn= 0
	captured= 0
	active= 1

func _gm_event_2_6():
	GS.hp= GS.maxhp
	GS.border= 0
	room_goto(GS.currentroom)

func _gm_event_2_5():
	if(not instance_exists(782/* OBJ_WRITER */)) {
	    with(blcon) instance_destroy()
	    instance_create(0, 0, 149/* obj_unfader */)
	    $Alarm6.start((50) / 30.0)
	    snd_play(90/* snd_txtasg */)
	}
	if(not instance_exists(782/* OBJ_WRITER */)) $Alarm5.start((2) / 30.0)

func _gm_event_2_4():
	GS.msg[0]= " THIS IS AN ERROR& MESSAGE^1.& REALLY!!!/%%"
	if(GS.flag[67] == -1) {
	    GS.msg[0]= " YOU\'RE TOO WEAK!!& I WAS EASILY ABLE& TO CAPTURE YOU!!!/"
	    GS.msg[1]= " I WILL NOW SEND& YOU TO THE& CAPTURE ZONE!!/"
	    GS.msg[2]= " OR^1, AS SANS& CALLS IT^1.../"
	    GS.msg[3]= " OUR GARAGE???/"
	    GS.msg[4]= " YOU\'RE IN THE& DOGHOUSE NOW!/"
	    GS.msg[5]= " NYEH HEH HEH HEH& HEH HEH HEH!!!/%%"
	}
	if(GS.flag[67] == -2) {
	    GS.msg[0]= " WELL!!^1! YOU MAY& HAVE CLEVERLY& ESCAPED FROM& JAIL BEFORE.../"
	    GS.msg[1]= " BUT THIS TIME^1,& I\'VE UPGRADED& THE FACILITIES./"
	    GS.msg[2]= " NOT ONLY WILL& YOU BE& TRAPPED.../"
	    GS.msg[3]= " BUT YOU WON\'T& EVEN WANT& TO LEAVE!!!/"
	    GS.msg[4]= " NYEH HEH HEH HEH& HEH HEH HEH!!!/%%"
	}
	if(GS.flag[67] == -3) {
	    GS.msg[0]= " YOU ARE...& PERSISTENT!/"
	    GS.msg[1]= " BUT^1!& IT JUST WON\'T& WORK ON ME!/"
	    GS.msg[2]= " I AM THE& PERSISTENTEST!/"
	    GS.msg[3]= " AND IF YOU& THINK YOU ARE& PERSISTENESTER.../"
	    GS.msg[4]= " THAT IS WRONG^1!& GRAMATICALLY& WRONG!/"
	    GS.msg[5]= " BECAUSE THE& CORRECT FORM& WOULD BE.../"
	    GS.msg[6]= " NOT AS& PERSISTENTEST AS& PAPYRUS^1, THE& PERSISTENTESTEST!/" + chr(ord('"')) + ""
	    GS.msg[7]= " I HOPE YOU& ENJOYED THIS& LESSON./"
	    GS.msg[8]= " NYEH HEH HEH HEH& HEH HEH HEH!!!/%%"
	}
	GS.typer= 22
	// OBJ_WRITER
	with(782) instance_destroy()
	blcon= instance_create(obj_papyrusboss.x + 145, obj_papyrusboss.y + 52, 187/* obj_blconwdflowey */)
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 782/* OBJ_WRITER */)
	$Alarm5.start((1) / 30.0)

func _gm_event_2_3():
	if(vol > 0.01) {
	    caster_set_volume(GS.batmusic, vol)
	    vol-= 0.01
	    $Alarm3.start((1) / 30.0)
	} else  caster_free(GS.batmusic)

func _gm_event_2_2():
	$Alarm3.start((2) / 30.0)
	vol= caster_get_volume(GS.batmusic)
	$Alarm4.start((40) / 30.0)

func _process_end(delta: float):
	if(GS.turntimer < 0 and active == 1) instance_destroy()

func _process(delta: float):
	if(drawn == 1 and active == 1) {
	    if(y <= ystart - oscmax or y >= ystart - oscmin)
	        osc= -osc
	    y+= osc
	}

func _gm_event_7_11():
	if(active == 1) {
	    hit= 1
	    if(blue == 1 and scr_blueat() == 0) hit= 0
	    if(GS.invc < 1 and hit == 1) {
	        dmgamt= round(dmg - (GS.df + GS.adef) / 5)
	        if(dmgamt < 3) dmgamt= 3
	        if(GS.hardmode == 0 and instance_exists(232/* obj_papyrusboss */) and obj_papyrusboss.fighto > 13) {
	            if(GS.hp < 10) dmgamt--
	            if(GS.hp < 5) dmgamt--
	        }
	        GS.hp-= dmgamt
	        GS.invc= GS.inv * 3
	        if(not instance_exists(559/* obj_ripoff_papyrus */)) {
	            if(GS.hp > 0) {
	                snd_play(53/* snd_hurt1 */)
	                GS.hshake= 2
	                GS.shakespeed= 2
	                GS.vshake= 2
	                instance_create(0, 0, 184/* obj_shaker */)
	                instance_destroy()
	            } else  {
	                if(captured == 0) {
	                    snd_play(53/* snd_hurt1 */)
	                    GS.hshake= 2
	                    GS.shakespeed= 2
	                    GS.vshake= 2
	                    instance_create(0, 0, 184/* obj_shaker */)
	                    visible= 0
	                    GS.hp= 1
	                    captured= 1
	                    GS.turntimer= 300
	                    // obj_papyrusboss
	                    with(232) dontcancel= 1
	                    GS.invc= 50
	                    velocity.x= 0
	                    if(instance_exists(651/* blt_sizebone */)) {
	                        blt_sizebone.active= 2
	                        blt_sizebone.visible= 0
	                    }
	                    if(instance_exists(652/* blt_topbone */)) {
	                        blt_topbone.active= 2
	                        blt_sizebone.visible= 0
	                    }
	                    if(instance_exists(685/* obj_blueattackgen */)) {
	                        // obj_blueattackgen
	                        with(685) instance_destroy()
	                    }
	                    obj_heart.velocity.y= 0
	                    $Alarm2.start((2) / 30.0)
	                }
	            }
	        } else  {
	            snd_play(53/* snd_hurt1 */)
	            GS.hshake= 2
	            GS.shakespeed= 2
	            GS.vshake= 2
	            instance_create(0, 0, 184/* obj_shaker */)
	            instance_destroy()
	        }
	    }
	}

func _on_outside_room():
	l= 0
	t= 0
	w= sprite_width
	h= sprite_height
	ll= GS.idealborder[0] - x + 1
	tt= GS.idealborder[2] - y + 1
	ww= x + w - GS.idealborder[1] - 1
	hh= y + h - GS.idealborder[3] - 1
	if(ll > 0) l+= ll
	if(tt > 0) t+= tt
	if(ww > 0) w-= ww
	if(hh > 0) h-= hh
	w= round(w)
	h= round(h)
	l= round(l)
	t= round(t)
	if(w > 0 and h > 0 and l < w and t < h) {
	    if(blue == 1) frame= 1
	    draw_sprite_part(106, frame, l, t, w - l, h - t, x + l, y + t)
	    draw_sprite_part(105, frame, l, t, w - l, h - t, x + l, GS.idealborder[3] - 10)
	}
	if(x > GS.idealborder[0] - 5 and x < GS.idealborder[1] - 4) {
	    drawn= 1
	    draw_set_color(16777215)
	    if(blue == 1) draw_set_color(16754964)
	    draw_rectangle(x + 3, y + 4, x + 9, GS.idealborder[3] - 6, 0)
	}
	if(abs(obj_heart.x - x) < 15 and GS.invc < 1 and collision_rectangle(x + 3, y + 2, x + 9, GS.idealborder[3] - 2, 743, 0, 1))
	    event_user(1)
	if(x < GS.idealborder[0] - 10 and velocity.x < 0)
	    instance_destroy()
	if(x > GS.idealborder[1] + 10 and velocity.x > 0)
	    instance_destroy()

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
