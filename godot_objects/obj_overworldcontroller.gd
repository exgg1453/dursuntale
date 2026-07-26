# Auto-converted from GameMaker: obj_overworldcontroller
extends Node2D

func _ready():
	selected3= 0
	saved= 0
	buffer= 0

func _on_outside_room():
	buffer++
	if(GS.interact == 5) {
	    currentmenu= GS.menuno
	    if(GS.menuno < 6) currentspot= GS.menucoord[GS.menuno]
	    xx= view_xview[view_current]
	    yy= view_yview[view_current] + 10
	    moveyy= yy
	    if(obj_mainchara.y > yy + 120) moveyy+= 135
	    if(GS.menuno != 4) {
	        draw_set_color(16777215)
	        draw_rectangle(16 + xx, 16 + moveyy, 86 + xx, 70 + moveyy, 0)
	        draw_rectangle(16 + xx, 74 + yy, 86 + xx, 147 + yy, 0)
	        if(GS.menuno == 1 or GS.menuno == 5 or GS.menuno == 6)
	            draw_rectangle(94 + xx, 16 + yy, 266 + xx, 196 + yy, 0)
	        if(GS.menuno == 2)
	            draw_rectangle(94 + xx, 16 + yy, 266 + xx, 224 + yy, 0)
	        if(GS.menuno == 3)
	            draw_rectangle(94 + xx, 16 + yy, 266 + xx, 150 + yy, 0)
	        if(GS.menuno == 7)
	            draw_rectangle(94 + xx, 16 + yy, 266 + xx, 216 + yy, 0)
	        draw_set_color(0)
	        draw_rectangle(19 + xx, 19 + moveyy, 83 + xx, 67 + moveyy, 0)
	        draw_rectangle(19 + xx, 77 + yy, 83 + xx, 144 + yy, 0)
	        if(GS.menuno == 1 or GS.menuno == 5 or GS.menuno == 6)
	            draw_rectangle(97 + xx, 19 + yy, 263 + xx, 193 + yy, 0)
	        if(GS.menuno == 2)
	            draw_rectangle(97 + xx, 19 + yy, 263 + xx, 221 + yy, 0)
	        if(GS.menuno == 3)
	            draw_rectangle(97 + xx, 19 + yy, 263 + xx, 147 + yy, 0)
	        if(GS.menuno == 7)
	            draw_rectangle(97 + xx, 19 + yy, 263 + xx, 213 + yy, 0)
	        draw_set_color(16777215)
	        draw_set_font(3)
	        draw_text(23 + xx, 49 + moveyy, "HP  " + string(GS.hp) + "/" + string(GS.maxhp))
	        draw_text(23 + xx, 40 + moveyy, "LV  " + string(GS.lv))
	        draw_text(23 + xx, 58 + moveyy, "G   " + string(GS.gold))
	        draw_set_font(2)
	        draw_text(23 + xx, 20 + moveyy, GS.charname)
	        if(GS.menuchoice[0] == 1) draw_text(42 + xx, 84 + yy, "ITEM")
	        if(GS.menuchoice[1] == 1)
	            draw_text(42 + xx, 102 + yy, "STAT")
	        if(GS.menuchoice[2] == 1)
	            draw_text(42 + xx, 120 + yy, "CELL")
	        if(GS.menuno == 1 or GS.menuno == 5) {
	            i= 0
	            while(i < 8) {
	                draw_text(116 + xx, 30 + yy + i * 16, GS.itemname[i])
	                i++
	            }
	            draw_text(116 + xx, 170 + yy, "USE")
	            draw_text(116 + xx + 48, 170 + yy, "INFO")
	            draw_text(116 + xx + 105, 170 + yy, "DROP")
	        }
	    }
	    if(GS.menuno == 3) {
	        i= 0
	        while(i < 7) {
	            draw_text(116 + xx, 30 + yy + i * 16, GS.phonename[i])
	            i++
	        }
	    }
	    if(GS.menuno == 6) {
	        scr_itemname()
	        i= 0
	        while(i < 8) {
	            draw_text(116 + xx, 30 + yy + i * 16, GS.itemname[i])
	            i++
	        }
	    }
	    if(GS.menuno == 7) {
	        scr_storagename(300)
	        i= 0
	        while(i < 10) {
	            draw_text(116 + xx, 30 + yy + i * 16, GS.itemname[i])
	            i++
	        }
	    }
	    if(GS.menuno == 2) {
	        draw_text(108 + xx, 32 + yy, "" + chr(ord('"')) + "" + GS.charname + "" + chr(ord('"')) + "")
	        draw_text(108 + xx, 62 + yy, "LV  " + string(GS.lv))
	        draw_text(108 + xx, 78 + yy, "HP  " + string(GS.hp) + " / " + string(GS.maxhp))
	        draw_text(108 + xx, 110 + yy, "AT  " + string(GS.at - 10) + " (" + string(GS.wstrength) + ")")
	        draw_text(108 + xx, 126 + yy, "DF  " + string(GS.df - 10) + " (" + string(GS.adef) + ")")
	        weaponname= " "
	        armorname= " "
	        if(GS.weapon == 3) weaponname= "Stick"
	        if(GS.weapon == 13) weaponname= "Toy Knife"
	        if(GS.weapon == 14) weaponname= "Tough Glove"
	        if(GS.weapon == 25) weaponname= "Ballet Shoes"
	        if(GS.weapon == 45) weaponname= "Torn Notebook"
	        if(GS.weapon == 47) weaponname= "Burnt Pan"
	        if(GS.weapon == 49) weaponname= "Empty Gun"
	        if(GS.weapon == 51) weaponname= "Worn Dagger"
	        if(GS.weapon == 52) weaponname= "Real Knife"
	        if(GS.armor == 4) armorname= "Bandage"
	        if(GS.armor == 12) armorname= "Faded Ribbon"
	        if(GS.armor == 15) armorname= "Manly Bandanna"
	        if(GS.armor == 24) armorname= "Old Tutu"
	        if(GS.armor == 44) armorname= "Clouded Glasses"
	        if(GS.armor == 46) armorname= "Stained Apron"
	        if(GS.armor == 48) armorname= "Cowboy Hat"
	        if(GS.armor == 50) armorname= "Heart Locket"
	        if(GS.armor == 53) armorname= "The Locket"
	        if(GS.armor == 64) armorname= "Temmie Armor"
	        draw_text(108 + xx, 156 + yy, "WEAPON: " + weaponname)
	        draw_text(108 + xx, 172 + yy, "ARMOR: " + armorname)
	        draw_text(108 + xx, 192 + yy, "GOLD: " + string(GS.gold))
	        if(GS.kills > 20)
	            draw_text(192 + xx, 192 + yy, "KILLS: " + string(GS.kills))
	        if(string_length(GS.charname) >= 7)
	            draw_text(192 + xx, 32 + yy, "Easy to#change,#huh?")
	        draw_text(192 + xx, 110 + yy, "EXP: " + string(GS.xp))
	        if(GS.lv == 1) nextlevel= 10 - GS.xp
	        if(GS.lv == 2) nextlevel= 30 - GS.xp
	        if(GS.lv == 3) nextlevel= 70 - GS.xp
	        if(GS.lv == 4) nextlevel= 120 - GS.xp
	        if(GS.lv == 5) nextlevel= 200 - GS.xp
	        if(GS.lv == 6) nextlevel= 300 - GS.xp
	        if(GS.lv == 7) nextlevel= 500 - GS.xp
	        if(GS.lv == 8) nextlevel= 800 - GS.xp
	        if(GS.lv == 9) nextlevel= 1200 - GS.xp
	        if(GS.lv == 10) nextlevel= 1700 - GS.xp
	        if(GS.lv == 11) nextlevel= 2500 - GS.xp
	        if(GS.lv == 12) nextlevel= 3500 - GS.xp
	        if(GS.lv == 13) nextlevel= 5000 - GS.xp
	        if(GS.lv == 14) nextlevel= 7000 - GS.xp
	        if(GS.lv == 15) nextlevel= 10000 - GS.xp
	        if(GS.lv == 16) nextlevel= 15000 - GS.xp
	        if(GS.lv == 17) nextlevel= 25000 - GS.xp
	        if(GS.lv == 18) nextlevel= 50000 - GS.xp
	        if(GS.lv == 19) nextlevel= 99999 - GS.xp
	        if(GS.lv >= 20) nextlevel= 0
	        draw_text(192 + xx, 126 + yy, "NEXT: " + string(nextlevel))
	    }
	    if(GS.menuno == 4) {
	        iniread= ini_open("undertale.ini")
	        name= ini_read_string("General", "Name", "EMPTY")
	        love= ini_read_real("General", "Love", 0)
	        time= ini_read_real("General", "Time", 1)
	        kills= ini_read_real("General", "Kills", 0)
	        roome= ini_read_real("General", "Room", 0)
	        ini_close()
	        draw_set_font(2)
	        draw_set_color(16777215)
	        draw_rectangle(54 + xx, 49 + yy, 265 + xx, 135 + yy, 0)
	        draw_set_color(0)
	        draw_rectangle(57 + xx, 52 + yy, 262 + xx, 132 + yy, 0)
	        draw_set_color(16777215)
	        if(GS.menucoord[4] == 2) draw_set_color(65535)
	        minutes= floor(time / 1800)
	        seconds= round((time / 1800 - minutes) * 60)
	        if(seconds == 60) seconds= 59
	        if(seconds < 10) seconds= "0" + string(seconds)
	        script_execute(54/* scr_roomname */, roome)
	        draw_text(70 + xx, 60 + yy, name)
	        draw_text(140 + xx, 60 + yy, "LV " + string(love))
	        draw_text(210 + xx, 60 + yy, string(minutes) + ":" + string(seconds))
	        draw_text(70 + xx, 80 + yy, roomname)
	        if(GS.menucoord[4] == 0) draw_sprite(49/* spr_heartsmall */, 0, xx + 71, yy + 113)
	        if(GS.menucoord[4] == 1)
	            draw_sprite(49/* spr_heartsmall */, 0, xx + 161, yy + 113)
	        if(GS.menucoord[4] < 2) {
	            draw_text(xx + 85, yy + 110, "Save")
	            draw_text(xx + 175, yy + 110, "Return")
	        } else  {
	            draw_text(xx + 85, yy + 110, "File saved.")
	            if(keyboard_multicheck_pressed(13/* ENTER */)) {
	                GS.menuno= -1
	                GS.interact= 0
	                GS.menucoord[4]= 0
	                keyboard_clear(13/* ENTER */)
	            }
	        }
	        if((Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right")) and GS.menucoord[4] < 2) {
	            if(GS.menucoord[4] == 1) GS.menucoord[4]= 0
	            else  GS.menucoord[4]= 1
	            keyboard_clear(37/* LEFT */)
	            keyboard_clear(39/* RIGHT */)
	        }
	        if(keyboard_multicheck_pressed(13/* ENTER */) and GS.menucoord[4] == 0) {
	            snd_play(25/* snd_save */)
	            script_execute(60/* scr_save */)
	            GS.menucoord[4]= 2
	            keyboard_clear(13/* ENTER */)
	        }
	        if(keyboard_multicheck_pressed(13/* ENTER */) and GS.menucoord[4] == 1) {
	            GS.menuno= -1
	            GS.interact= 0
	            GS.menucoord[4]= 0
	            keyboard_clear(13/* ENTER */)
	        }
	        if(keyboard_multicheck_pressed(16/* SHIFT */)) {
	            GS.menuno= -1
	            GS.interact= 0
	            GS.menucoord[4]= 0
	            keyboard_clear(16/* SHIFT */)
	        }
	    }
	    if(GS.menuno == 0)
	        draw_sprite(49/* spr_heartsmall */, 0, 28 + xx, 88 + yy + 18 * GS.menucoord[0])
	    if(GS.menuno == 1)
	        draw_sprite(49/* spr_heartsmall */, 0, 104 + xx, 34 + yy + 16 * GS.menucoord[1])
	    if(GS.menuno == 3)
	        draw_sprite(49/* spr_heartsmall */, 0, 104 + xx, 34 + yy + 16 * GS.menucoord[3])
	    if(GS.menuno == 6)
	        draw_sprite(49/* spr_heartsmall */, 0, 104 + xx, 34 + yy + 16 * GS.menucoord[6])
	    if(GS.menuno == 7)
	        draw_sprite(49/* spr_heartsmall */, 0, 104 + xx, 34 + yy + 16 * GS.menucoord[7])
	    if(GS.menuno == 5) {
	        if(GS.menucoord[5] == 0)
	            draw_sprite(49/* spr_heartsmall */, 0, 104 + xx + 45 * GS.menucoord[5], 174 + yy)
	        if(GS.menucoord[5] == 1)
	            draw_sprite(49/* spr_heartsmall */, 0, 104 + xx + 45 * GS.menucoord[5] + 3, 174 + yy)
	        if(GS.menucoord[5] == 2)
	            draw_sprite(49/* spr_heartsmall */, 0, 104 + xx + 45 * GS.menucoord[5] + 15, 174 + yy)
	    }
	    if(keyboard_multicheck_pressed(13/* ENTER */)) {
	        if(GS.menuno == 5) {
	            if(GS.menucoord[5] == 0) {
	                GS.menuno= 9
	                script_execute(73/* scr_itemuseb */, GS.menucoord[1], GS.item[GS.menucoord[1]])
	            }
	            if(GS.menucoord[5] == 1) {
	                GS.menuno= 9
	                script_execute(72/* scr_itemdesc */, GS.item[GS.menucoord[1]])
	                script_execute(146/* scr_writetext */, 0, "x", 0, 0)
	            }
	            if(GS.menucoord[5] == 2) {
	                GS.menuno= 9
	                dontthrow= 0
	                if(GS.item[GS.menucoord[1]] != 23 and GS.item[GS.menucoord[1]] != 27 and GS.item[GS.menucoord[1]] != 54 and GS.item[GS.menucoord[1]] != 56 and GS.item[GS.menucoord[1]] != 57)
	                    script_execute(146/* scr_writetext */, 12, "x", 0, 0)
	                else  {
	                    if(GS.item[GS.menucoord[1]] == 23) script_execute(146/* scr_writetext */, 23, "x", 0, 0)
	                    if(GS.item[GS.menucoord[1]] == 27) {
	                        script_execute(146/* scr_writetext */, 0, "* (You put the dog on the&  ground.)/%%", 0, 0)
	                        if(instance_exists(1147/* obj_rarependant */)) {
	                            // obj_rarependant
	                            with(1147) con= 1
	                        }
	                    }
	                    if(GS.item[GS.menucoord[1]] == 54) {
	                        script_execute(146/* scr_writetext */, 0, "* (You threw the Bad Memory&  away.^1)&* (But it came back.)/%%", 0, 0)
	                        dontthrow= 1
	                    }
	                    if(GS.item[GS.menucoord[1]] == 56) {
	                        if(not instance_exists(1313/* obj_undyne_friendc */)) {
	                            script_execute(146/* scr_writetext */, 0, "* (Despite what seems like&  common sense^1, you threw&  away the letter.)/%%", 0, 0)
	                            GS.flag[494]= 1
	                        } else  {
	                            GS.faceemotion= 1
	                            script_execute(146/* scr_writetext */, 0, "* Hey^1! Don\'t throw that&  away^1! Just deliver it!/%%", 5, 37)
	                            dontthrow= 1
	                        }
	                    }
	                    if(GS.item[GS.menucoord[1]] == 57) {
	                        script_execute(146/* scr_writetext */, 0, "* (The letter is too powerful to&  throw away.^1)&* (It gets the better of you.)/%%", 0, 0)
	                        dontthrow= 1
	                    }
	                }
	                if(dontthrow == 0) script_execute(66/* scr_itemshift */, GS.menucoord[1], 0)
	            }
	        }
	        if(GS.menuno == 3) {
	            GS.menuno= 9
	            script_execute(73/* scr_itemuseb */, GS.menucoord[3], GS.phone[GS.menucoord[3]])
	        }
	        if(GS.menuno == 6) {
	            GS.menuno= 9
	            script_execute(85/* scr_storageget */, GS.item[GS.menucoord[6]], 300)
	            if(noroom == 0) {
	                script_execute(146/* scr_writetext */, 16, "x", 0, 0)
	                script_execute(66/* scr_itemshift */, GS.menucoord[6], 0)
	            } else  script_execute(146/* scr_writetext */, 19, "x", 0, 0)
	        }
	        if(GS.menuno == 7) {
	            GS.menuno= 9
	            script_execute(84/* scr_itemget */, GS.flag[GS.menucoord[7] + 300])
	            if(noroom == 0) {
	                script_execute(146/* scr_writetext */, 17, "x", 0, 0)
	                scr_storageshift(GS.menucoord[7], 0, 300)
	            } else  script_execute(146/* scr_writetext */, 18, "x", 0, 0)
	        }
	        if(GS.menuno == 1) {
	            GS.menuno= 5
	            GS.menucoord[5]= 0
	        }
	        if(GS.menuno == 0)
	            GS.menuno+= GS.menucoord[0] + 1
	        if(GS.menuno == 3) {
	            script_execute(70/* scr_phonename */)
	            GS.menucoord[3]= 0
	        }
	        if(GS.menuno == 1) {
	            if(GS.item[0] != 0) {
	                GS.menucoord[1]= 0
	                script_execute(82/* scr_itemname */)
	            } else  GS.menuno= 0
	        }
	    }
	    if(Input.is_action_pressed("move_up")) {
	        if(GS.menuno == 0 and GS.menucoord[0] != 0)
	            GS.menucoord[0]--
	        if(GS.menuno == 1 and GS.menucoord[1] != 0)
	            GS.menucoord[1]--
	        if(GS.menuno == 3 and GS.menucoord[3] != 0)
	            GS.menucoord[3]--
	        if(GS.menuno == 6 and GS.menucoord[6] != 0)
	            GS.menucoord[6]--
	        if(GS.menuno == 7 and GS.menucoord[7] != 0)
	            GS.menucoord[7]--
	    }
	    if(Input.is_action_pressed("move_down")) {
	        if(GS.menuno == 0 and GS.menucoord[0] != 2 and GS.menuchoice[GS.menucoord[0] + 1] != 0)
	            GS.menucoord[0]++
	        if(GS.menuno == 1 and GS.menucoord[1] != 7 and GS.item[GS.menucoord[1] + 1] != 0)
	            GS.menucoord[1]++
	        if(GS.menuno == 3 and GS.menucoord[3] != 7 and GS.phone[GS.menucoord[3] + 1] != 0)
	            GS.menucoord[3]++
	        if(GS.menuno == 6 and GS.menucoord[6] != 7 and GS.item[GS.menucoord[6] + 1] != 0)
	            GS.menucoord[6]++
	        if(GS.menuno == 7 and GS.menucoord[7] != 9 and GS.flag[GS.menucoord[7] + 301] != 0)
	            GS.menucoord[7]++
	    }
	    if(keyboard_multicheck_pressed(16/* SHIFT */) and buffer >= 0) {
	        if(GS.menuno == 0) {
	            GS.menuno= -1
	            GS.interact= 0
	        } else  {
	            if(GS.menuno <= 3) GS.menuno= 0
	        }
	        if(GS.menuno == 5) GS.menuno= 1
	    }
	    if(Input.is_action_pressed("move_right") and GS.menuno == 5 and GS.menucoord[5] != 2)
	        GS.menucoord[5]++
	    if(Input.is_action_pressed("move_left") and GS.menuno == 5 and GS.menucoord[5] != 0)
	        GS.menucoord[5]--
	    if(keyboard_multicheck_pressed(17/* CTRL */) and GS.menuno == 0) {
	        GS.menuno= -1
	        GS.interact= 0
	    }
	    if(currentmenu < GS.menuno and GS.menuno != 9) snd_play(111/* snd_select */)
	    else  {
	        if(GS.menuno >= 0 and GS.menuno < 6 and currentspot != GS.menucoord[GS.menuno])
	            snd_play(114/* snd_squeak */)
	    }
	}
	if(GS.menuno == 9 and not instance_exists(779/* obj_dialoguer */)) {
	    GS.menuno= -1
	    GS.interact= 0
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
