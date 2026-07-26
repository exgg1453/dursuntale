# Auto-converted from GameMaker: obj_waterboardpuzzle1
extends Node2D

func _ready():
	waterboard= 0
	won= 0
	if(scr_murderlv() >= 8 and GS.flag[27] == 0) {
	    if(GS.plot < 107) GS.plot= 107
	    if(GS.flag[386] == 0) GS.flag[386]= 1
	}
	if(room == 88 and GS.entrance == 2) {
	    xx= 420
	    yy= 400
	    i= 0
	    repeat(4)  {
	        event_user(0)
	        xx+= 20
	    }
	}
	if(room == 88 and GS.plot > 106) {
	    xx= 220
	    yy= 180
	    i= 0
	    repeat(4)  {
	        event_user(0)
	        yy+= 20
	    }
	}
	if(room == 273 and (GS.plot > 110 or GS.entrance == 2)) {
	    xx= 180
	    yy= 440
	    i= 0
	    repeat(4)  {
	        event_user(0)
	        xx+= 20
	    }
	}
	if(room == 87 and GS.flag[386] == 1) {
	    xx= 280
	    yy= 140
	    i= 0
	    repeat(4)  {
	        event_user(0)
	        xx+= 20
	    }
	}

func _process(delta: float):
	if(won == 0) {
	    i= 0
	    while(i < instance_number(1114)) {
	        h= 0
	        v= 0
	        me= instance_find(1114, i)
	        xx= me.x
	        yy= me.y
	        j= 1
	        rx[0]= 1
	        lx[0]= 1
	        ux[0]= 1
	        dx[0]= 1
	        doodly= 0
	        repeat(3)  {
	            lx[j]= 0
	            dx[j]= 0
	            rx[j]= 0
	            ux[j]= 0
	            l[j]= instance_position(xx - 2 - doodly, yy, 1114)
	            r[j]= instance_position(xx + 22 + doodly, yy, 1114)
	            u[j]= instance_position(xx, yy - 2 - doodly, 1114)
	            d[j]= instance_position(xx, yy + 22 + doodly, 1114)
	            if(l[j] != -4 and lx[j - 1] == 1 and l[j].using == 3) {
	                h++
	                lx[j]= 1
	            }
	            if(r[j] != -4 and rx[j - 1] == 1 and r[j].using == 3) {
	                h++
	                rx[j]= 1
	            }
	            if(u[j] != -4 and ux[j - 1] == 1 and u[j].using == 3) {
	                v++
	                ux[j]= 1
	            }
	            if(d[j] != -4 and dx[j - 1] == 1 and d[j].using == 3) {
	                v++
	                dx[j]= 1
	            }
	            j++
	            doodly+= 20
	        }
	        if(v >= 3 and me.using == 3) {
	            won= 90
	            n= 1
	            me.using= 5
	            repeat(3)  {
	                if(u[n] != -4 and ux[n - 1] == 1)
	                    u[n].using= 5
	                if(d[n] != -4 and dx[n - 1] == 1)
	                    d[n].using= 5
	                n++
	            }
	        }
	        if(h >= 3 and me.using == 3) {
	            won= 90
	            n= 1
	            me.using= 5
	            repeat(3)  {
	                if(r[n] != -4 and rx[n - 1] == 1)
	                    r[n].using= 5
	                if(l[n] != -4 and lx[n - 1] == 1)
	                    l[n].using= 5
	                n++
	            }
	        }
	        i++
	    }
	}
	if(won == 9999) {
	    if(won == 2 and GS.interact == 0) {
	        GS.interact= 1
	        won= 97
	        vol1= caster_get_volume(GS.currentsong)
	        vol2= vol1
	        caster_pause(GS.currentsong)
	    }
	    if(won == 97) {
	        vol2-= 0.02
	        caster_set_volume(GS.currentsong, vol2)
	        if(vol2 < 0.04) {
	            vol2= 0
	            caster_pause(GS.currentsong)
	            won= 98
	        }
	    }
	    if(won == 98) {
	        snd_play(26/* snd_dumbvictory */)
	        GS.msg[0]= "* (You hear a small voice.)/"
	        GS.msg[1]= "* Congratulations!/"
	        GS.msg[2]= "* What\'s wrong with you!/%%"
	        scr_regulartext()
	        won= 99
	    }
	    if(won == 99 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.interact= 0
	        caster_set_volume(GS.currentsong, vol1)
	        caster_resume(GS.currentsong)
	        won= 100
	    }
	}

func _gm_event_7_10():
	block= instance_position(xx + 10, yy + 10, 820)
	if(block != -4) {
	    block.x= 0
	    block.y= 0
	}
	new= instance_create(xx, yy, 1363/* obj_npc_marker */)
	new.z_index= 850000
	new.sprite_index= 1552/* spr_bridgeseed */
	new.image_speed= 0
	new.frame= 6
	new.visible= 1
	new.image_speed= 0

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
