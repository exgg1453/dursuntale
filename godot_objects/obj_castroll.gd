# Auto-converted from GameMaker: obj_castroll
extends Node2D

func _ready():
	if(GS.flag[499] == 0) {
	    GS.cast_type= 0
	    GS.flag[499]= 1
	    splitter= 0
	    if(splitter == 1) {
	        ts= instance_create(0, 0, 1685/* obj_timersplits */)
	        with(ts) {
	            i= 0
	            while(i < 99) {
	                split[i]= 0
	                i++
	            }
	            splitno= 0
	        }
	    }
	    GS.endsong[0]= caster_load("music/end/cast_1.ogg")
	    GS.endsong[1]= caster_load("music/end/cast_2.ogg")
	    GS.endsong[2]= caster_load("music/end/cast_3.ogg")
	    GS.endsong[3]= caster_load("music/end/cast_4.ogg")
	    GS.endsong[5]= caster_load("music/end/cast_5.ogg")
	    GS.endsong[6]= caster_load("music/end/cast_5.ogg")
	    GS.endsong[7]= caster_load("music/end/cast_6.ogg")
	    GS.endsong[8]= caster_load("music/end/cast_7.ogg")
	    caster_play(GS.endsong[0], 1, 1)
	}
	timer= 0
	$Alarm0.start((2) / 30.0)
	active= 0
	vol= 0.9

func _on_destroy():
	GS.inbattle= 1
	type= GS.cast_type
	if(type == 0) {
	    froggit= instance_create(160, 600, 603/* obj_monster_extrabody */)
	    froggit.type= 1
	    whimsun= instance_create(380, 600, 603/* obj_monster_extrabody */)
	    whimsun.type= 2
	    moldsmal= instance_create(160, 940, 603/* obj_monster_extrabody */)
	    moldsmal.type= 3
	    loox= instance_create(380, 940, 603/* obj_monster_extrabody */)
	    loox.type= 6
	    vegetoid= instance_create(160, 1280, 603/* obj_monster_extrabody */)
	    vegetoid.type= 7
	    migosp= instance_create(380, 1280, 603/* obj_monster_extrabody */)
	    migosp.type= 5
	    napstablook= instance_create(280, 1620, 603/* obj_monster_extrabody */)
	    napstablook.type= 4
	    active= 2
	}
	if(type == 1) {
	    snowdrake= instance_create(110, 600, 603/* obj_monster_extrabody */)
	    snowdrake.type= 11
	    icecap= instance_create(380, 600, 603/* obj_monster_extrabody */)
	    icecap.type= 10
	    icecap.scale.y= 2
	    gyftrot= instance_create(110, 1040, 603/* obj_monster_extrabody */)
	    gyftrot.type= 12
	    gyftrot.scale.x= 2
	    gyftrot.scale.y= 2
	    doggo= instance_create(380, 1040, 603/* obj_monster_extrabody */)
	    doggo.type= 13
	    doggo.scale.y= 2
	    dogamy= instance_create(208, 1480, 603/* obj_monster_extrabody */)
	    dogamy.type= 14
	    dogamy.scale.x= 2
	    dogamy.scale.y= 2
	    lesserdog= instance_create(140, 1920, 603/* obj_monster_extrabody */)
	    lesserdog.type= 8
	    lesserdog.scale.x= 1
	    lesserdog.scale.y= 2
	    greaterdog= instance_create(340, 1920, 603/* obj_monster_extrabody */)
	    greaterdog.type= 9
	    greaterdog.scale.x= 2
	    greaterdog.scale.y= 2
	    active= 1
	}
	if(type == 2) {
	    aaron= instance_create(160, 600, 603/* obj_monster_extrabody */)
	    aaron.type= 16
	    aaron.scale.x= 2
	    aaron.scale.y= 2
	    moldbygg= instance_create(380, 600, 603/* obj_monster_extrabody */)
	    moldbygg.type= 19
	    moldbygg.scale.y= 2
	    woshua= instance_create(160, 1040, 603/* obj_monster_extrabody */)
	    woshua.type= 15
	    temmie= instance_create(380, 1040, 603/* obj_monster_extrabody */)
	    temmie.type= 18
	    temmie.scale.y= 1
	    maddummy= instance_create(160, 1380, 603/* obj_monster_extrabody */)
	    maddummy.type= 20
	    maddummy.scale.x= 1
	    maddummy.scale.y= 2
	    shyren= instance_create(380, 1380, 603/* obj_monster_extrabody */)
	    shyren.type= 17
	    shyren.scale.x= 1
	    shyren.scale.y= 2
	    active= 1
	}
	if(type == 3) {
	    vulkin= instance_create(160, 700, 603/* obj_monster_extrabody */)
	    vulkin.type= 22
	    tsunderplane= instance_create(340, 600, 603/* obj_monster_extrabody */)
	    tsunderplane.scale.y= 2
	    tsunderplane.scale.x= 2
	    tsunderplane.type= 23
	    pyrope= instance_create(160, 1040, 603/* obj_monster_extrabody */)
	    pyrope.scale.y= 2
	    pyrope.type= 24
	    muffet= instance_create(340, 1040, 603/* obj_monster_extrabody */)
	    muffet.scale.y= 2
	    muffet.scale.x= 2
	    muffet.type= 25
	    knighta= instance_create(140, 1480, 603/* obj_monster_extrabody */)
	    knighta.scale.y= 2
	    knighta.scale.x= 2
	    knighta.type= 21
	    finalfroggit= instance_create(160, 1940, 603/* obj_monster_extrabody */)
	    finalfroggit.type= 28
	    whimsalot= instance_create(380, 1940, 603/* obj_monster_extrabody */)
	    whimsalot.type= 29
	    astigmatism= instance_create(270, 2260, 603/* obj_monster_extrabody */)
	    astigmatism.type= 30
	    madjick= instance_create(110, 2600, 603/* obj_monster_extrabody */)
	    madjick.type= 26
	    madjick.scale.x= 2
	    madjick.scale.y= 2
	    knightknight= instance_create(380, 2600, 603/* obj_monster_extrabody */)
	    knightknight.type= 27
	    knightknight.scale.y= 2
	    knightknight.scale.x= 2
	    amalgamate1= instance_create(70, 3040, 603/* obj_monster_extrabody */)
	    amalgamate1.type= 32
	    amalgamate1.scale.x= 1
	    amalgamate1.scale.y= 3
	    amalgamate2= instance_create(180, 3140, 603/* obj_monster_extrabody */)
	    amalgamate2.type= 31
	    amalgamate2.scale.y= 1
	    amalgamate2.scale.x= 1
	    amalgamate3= instance_create(290, 3040, 603/* obj_monster_extrabody */)
	    amalgamate3.type= 33
	    amalgamate3.scale.y= 2
	    amalgamate3.scale.x= 2
	    amalgamate4= instance_create(500, 3140, 603/* obj_monster_extrabody */)
	    amalgamate4.type= 34
	    amalgamate4.scale.x= 1
	    amalgamate4.scale.y= 2
	    active= 1
	}

func _gm_event_7_4():
	if(GS.cast_type == 1) caster_play(GS.endsong[2], 1, 1)

func _on_outside_room():
	if(GS.cast_type == 0) {
	    timer++
	    if(timer > 3) {
	        draw_set_color(16777215)
	        draw_set_font(2)
	        draw_set_halign(1)
	        draw_sprite_ext(0/* spr_undertaletitle */, 0, 0, -100, 2, 2, 0, 16777215, 1)
	        draw_text_transformed(320, 280, "(( CAST ))", 3, 3, 0)
	    }
	    if(timer > 244) active= 1
	}
	if(active == 1) view_yview[0]+= 2
	if(active == 1) {
	    if(GS.cast_type == 0 and active == 1) {
	        g= 0
	        draw_set_halign(1)
	        draw_set_font(2)
	        draw_set_color(16777215)
	        mon= froggit
	        draw_text_transformed(210, mon.y - 70, "FROGGIT", 3, 3, 0)
	        draw_text_transformed(210, mon.y - 30, "by Toby", 1, 1, 0)
	        if(GS.flag[130] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(210, mon.y + 110, "Pondering#Life", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(210, mon.y + 110, "Professional#Frog", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        draw_text_transformed(430, 530, "WHIMSUN", 3, 3, 0)
	        draw_text_transformed(430, 570, "by Toby", 1, 1, 0)
	        if(GS.flag[131] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(430, 710, "Still A Bit#Guilty", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(430, 710, "Braver Every#Day ", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= moldsmal
	        draw_text_transformed(210, mon.y - 70, "MOLDSMAL", 3, 3, 0)
	        draw_text_transformed(210, mon.y - 30, "by Toby", 1, 1, 0)
	        if(GS.flag[132] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(210, mon.y + 110, "Found a New#Cave", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(210, mon.y + 110, "Backup Dancer", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= loox
	        draw_text_transformed(430, mon.y - 70, "LOOX", 3, 3, 0)
	        draw_text_transformed(430, mon.y - 30, "by Temmie", 1, 1, 0)
	        if(GS.flag[133] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(430, mon.y + 110, "Slightly#Bully-like", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(430, mon.y + 110, "Reformed#Bully", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= vegetoid
	        draw_text_transformed(210, mon.y - 70, "VEGETOID", 3, 3, 0)
	        draw_text_transformed(210, mon.y - 30, "by Toby & Temmie", 1, 1, 0)
	        if(GS.flag[134] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(210, mon.y + 110, "Pushy Grocer", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(210, mon.y + 110, "Popular#Nutritionist", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= migosp
	        draw_text_transformed(430, mon.y - 70, "MIGOSP", 3, 3, 0)
	        draw_text_transformed(430, mon.y - 30, "by Toby", 1, 1, 0)
	        if(GS.flag[135] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(430, mon.y + 110, "Dedicated#Yesman", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(430, mon.y + 110, "Casually#Enjoys Life", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= napstablook
	        draw_text_transformed(330, mon.y - 70, "NAPSTABLOOK", 3, 3, 0)
	        draw_text_transformed(330, mon.y - 30, "by Toby", 1, 1, 0)
	        if(GS.flag[36] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(330, mon.y + 210, "Zzzzzzz...", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(330, mon.y + 210, "Spooky DJ", 2, 2, 0)
	        }
	        draw_set_halign(0)
	        if(view_yview[0] > 1520 and view_yview[0] < 1540) exper= 0
	        if(view_yview[0] > 1540) {
	            exper+= 0.2
	            view_yview[0]+= exper
	            if(view_yview[0] > napstablook.y + 300) get_tree().change_scene_to_file("res://godot_rooms/279.tscn")
	        }
	    }
	    if(GS.cast_type == 1) {
	        g= 0
	        draw_set_alpha(1)
	        draw_set_halign(1)
	        draw_set_font(2)
	        draw_set_color(16777215)
	        draw_set_color(16777215)
	        mon= snowdrake
	        draw_text_transformed(210, mon.y - 70, "SNOWDRAKE", 3, 3, 0)
	        draw_text_transformed(210, mon.y - 30, "by Magnolia Porter", 1, 1, 0)
	        if(GS.flag[136] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(210, mon.y + 210, "Still Looking#For Laughs", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(210, mon.y + 210, "Semi-successful#Comedian", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= icecap
	        draw_text_transformed(430, mon.y - 70, "ICECAP", 3, 3, 0)
	        draw_text_transformed(430, mon.y - 30, "by Magnolia Porter", 1, 1, 0)
	        if(GS.flag[137] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(430, mon.y + 210, "Thinking#About Its Hat", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(430, mon.y + 210, "Fashion#Designer", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= gyftrot
	        draw_text_transformed(210, mon.y - 70, "GYFTROT", 3, 3, 0)
	        draw_text_transformed(210, mon.y - 30, "by Magnolia Porter (and Toby???)", 1, 1, 0)
	        if(GS.flag[138] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(210, mon.y + 210, "Finding Peace#And Quiet", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(210, mon.y + 210, "Christmas#Display", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= doggo
	        draw_text_transformed(430, mon.y - 70, "DOGGO", 3, 3, 0)
	        draw_text_transformed(430, mon.y - 30, "by Toby", 1, 1, 0)
	        if(GS.flag[139] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(430, mon.y + 210, "Believes In The#Almighty Stick", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(430, mon.y + 210, "Has His Own#Seeing Eye Dog", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= dogamy
	        draw_text_transformed(320, mon.y - 70, "DOGAMY & DOGARESSA", 3, 3, 0)
	        draw_text_transformed(320, mon.y - 30, "by Toby...?", 1, 1, 0)
	        draw_set_color(65535)
	        if(GS.flag[140] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(320, mon.y + 210, "Still Thinking#About That Stick", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(320, mon.y + 210, "Finally No. 1 Nose#Nuzzle Champions", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= lesserdog
	        draw_text_transformed(190, mon.y - 70, "LESSER DOG", 3, 3, 0)
	        draw_text_transformed(190, mon.y - 30, "by Temmie & Toby", 1, 1, 0)
	        if(GS.flag[141] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(190, mon.y + 210, "Searching For#Affection", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(190, mon.y + 210, "Found A Loving#Owner", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= greaterdog
	        draw_text_transformed(450, mon.y - 70, "GREATER DOG", 3, 3, 0)
	        draw_text_transformed(450, mon.y - 30, "by Toby & Temmie", 1, 1, 0)
	        if(GS.flag[142] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(450, mon.y + 210, "Unaware of Life\'s#Changes", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(450, mon.y + 210, "Excited by Life\'s#Changes", 2, 2, 0)
	        }
	        draw_set_halign(0)
	        if(view_yview[0] > 1920 and view_yview[0] < 1940) exper= 0
	        if(view_yview[0] > 1940) {
	            vol-= 0.02
	            caster_set_volume(-3, vol)
	            exper+= 0.5
	            view_xview[0]-= exper
	            if(view_xview[0] < -600) get_tree().change_scene_to_file("res://godot_rooms/280.tscn")
	        }
	    }
	    if(GS.cast_type == 2) {
	        g= 0
	        draw_set_alpha(1)
	        draw_set_halign(1)
	        draw_set_font(2)
	        draw_set_color(16777215)
	        draw_set_color(16777215)
	        mon= aaron
	        draw_text_transformed(210, mon.y - 70, "AARON", 3, 3, 0)
	        draw_text_transformed(210, mon.y - 30, "by Temmie (reluctantly)", 1, 1, 0)
	        if(GS.flag[95] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(210, mon.y + 210, "Still Flexing", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(210, mon.y + 210, "Paranormal#Investigator", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= moldbygg
	        draw_text_transformed(430, mon.y - 70, "MOLDBYGG", 3, 3, 0)
	        draw_text_transformed(430, mon.y - 30, "by Toby", 1, 1, 0)
	        if(GS.flag[144] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(430, mon.y + 210, "Wistfully Adjusting#to City Life", 1.5, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(430, mon.y + 210, "Idyllic Life#on the Beach", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= woshua
	        draw_text_transformed(210, mon.y - 70, "WOSHUA", 3, 3, 0)
	        draw_text_transformed(210, mon.y - 30, "Inspired by OMOCAT", 1, 1, 0)
	        if(GS.flag[145] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(210, mon.y + 110, "Normal#Janitor", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(210, mon.y + 110, "Legendary#Janitor", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= temmie
	        draw_text_transformed(430, mon.y - 70, "TEMMIE", 3, 3, 0)
	        draw_text_transformed(430, mon.y - 30, "Temmie", 1, 1, 0)
	        if(GS.flag[146] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(430, mon.y + 110, "Temmie", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(430, mon.y + 110, "Temmie", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= maddummy
	        draw_text_transformed(210, mon.y - 70, "MAD DUMMY", 3, 3, 0)
	        draw_text_transformed(210, mon.y - 30, "by Toby", 1, 1, 0)
	        if(GS.flag[147] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(210, mon.y + 210, "Changed Name to#Angry Dummy", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(210, mon.y + 210, "Calmed Down...#Just a Bit", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= shyren
	        draw_text_transformed(430, mon.y - 70, "SHYREN", 3, 3, 0)
	        draw_text_transformed(430, mon.y - 30, "by Toby", 1, 1, 0)
	        if(GS.flag[81] != 2) {
	            draw_set_color(16777215)
	            draw_text_transformed(430, mon.y + 210, "Taking Piano#Lessons Again", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(430, mon.y + 210, "Released Her First Hit Single,#" + chr(ord('"')) + "When You Say Goodbye#It\'s Like Magical Bullets#Are Slowly Flying Out of#Your Mouth And Hitting Me" + chr(ord('"')) + "", 1, 1, 0)
	        }
	        draw_set_halign(0)
	        if(view_yview[0] > 1220 and view_yview[0] < 1240) exper= 0
	        if(view_yview[0] > 1240) {
	            vol-= 0.02
	            caster_set_volume(-3, vol)
	            exper+= 0.2
	            view_yview[0]+= exper
	            if(view_yview[0] > shyren.y + 300) get_tree().change_scene_to_file("res://godot_rooms/281.tscn")
	        }
	    }
	    if(GS.cast_type == 3) {
	        g= 0
	        draw_set_alpha(1)
	        draw_set_halign(1)
	        draw_set_font(2)
	        draw_set_color(16777215)
	        draw_set_color(16777215)
	        mon= vulkin
	        draw_text_transformed(210, mon.y - 70 - 100, "VULKIN", 3, 3, 0)
	        draw_text_transformed(210, mon.y - 30 - 100, "by Magnolia Porter", 1, 1, 0)
	        if(GS.flag[148] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(210, mon.y + 210 - 100, "Strolling#Happily", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(210, mon.y + 210 - 100, "Encouraging#Space Heater", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= tsunderplane
	        draw_text_transformed(430, mon.y - 70, "TSUNDERPLANE", 3, 3, 0)
	        draw_text_transformed(430, mon.y - 30, "by Toby", 1, 1, 0)
	        if(GS.flag[149] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(430, mon.y + 210, "New Student#At School", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(430, mon.y + 210, "Finally Confesses#(What!? I don\'t!!)", 1.5, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= pyrope
	        draw_text_transformed(210, mon.y - 70, "PYROPE", 3, 3, 0)
	        draw_text_transformed(210, mon.y - 30, "by Toby", 1, 1, 0)
	        if(GS.flag[150] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(210, mon.y + 210, "Continually#In Trouble", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(210, mon.y + 210, "Candle In The#World\'s Largest#Birthday Cake", 1.5, 1.5, 0)
	        }
	        draw_set_color(16777215)
	        mon= muffet
	        draw_text_transformed(430, mon.y - 70, "MUFFET", 3, 3, 0)
	        draw_text_transformed(430, mon.y - 30, "by Michelle", 1, 1, 0)
	        draw_set_color(65535)
	        draw_text_transformed(430, mon.y + 210, "Spider Success#With a New Bakery", 2, 2, 0)
	        draw_set_color(16777215)
	        mon= knighta
	        draw_text_transformed(320, mon.y - 70, "ROYAL GUARDS", 3, 3, 0)
	        draw_text_transformed(320, mon.y - 30, "by Toby", 1, 1, 0)
	        draw_set_color(65535)
	        draw_text_transformed(320, mon.y + 210, "Use Your#Imagination", 2, 2, 0)
	        draw_set_color(16777215)
	        mon= finalfroggit
	        draw_text_transformed(210, mon.y - 90, "FINAL FROGGIT", 2, 3, 0)
	        draw_text_transformed(210, mon.y - 50, "by Toby", 1, 1, 0)
	        if(GS.flag[151] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(210, mon.y + 110, "Searching For#Life\'s Meaning", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(210, mon.y + 110, "Giving Life#Its Own Meaning", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= whimsalot
	        draw_text_transformed(430, mon.y - 90, "WHIMSALOT", 3, 3, 0)
	        draw_text_transformed(430, mon.y - 50, "by Toby", 1, 1, 0)
	        if(GS.flag[152] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(430, mon.y + 110, "Fighting For#The Future", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(430, mon.y + 110, "The Long Battle#Finally Ending...", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= astigmatism
	        draw_text_transformed(320, mon.y - 70, "ASTIGMATISM", 3, 3, 0)
	        draw_text_transformed(320, mon.y - 30, "by Toby", 1, 1, 0)
	        if(GS.flag[153] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(320, mon.y + 110, "Still A Big#Bully", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(320, mon.y + 110, "Domineering#Glasses Seller", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= madjick
	        draw_text_transformed(210, mon.y - 70, "MADJICK", 3, 3, 0)
	        draw_text_transformed(210, mon.y - 30, "by Toby", 1, 1, 0)
	        if(GS.flag[154] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(210, mon.y + 210, "Learning#Bowling", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(210, mon.y + 210, "Street#Magician", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= knightknight
	        draw_text_transformed(460, mon.y - 70, "KNIGHT KNIGHT", 3, 3, 0)
	        draw_text_transformed(460, mon.y - 30, "by Toby", 1, 1, 0)
	        if(GS.flag[155] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(460, mon.y + 210, "Retail Job", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(460, mon.y + 210, "Taking a Well-#Deserved Nap", 2, 2, 0)
	        }
	        draw_set_color(16777215)
	        mon= amalgamate1
	        draw_text_transformed(320, mon.y - 70, "AMALGAMATES", 3, 3, 0)
	        draw_text_transformed(320, mon.y - 30, "??????", 1, 1, 0)
	        if(GS.flag[156] == 0) {
	            draw_set_color(16777215)
	            draw_text_transformed(320, mon.y + 210, "Living With#Their Families,#Thinking About#Sticks", 2, 2, 0)
	        } else  {
	            draw_set_color(65535)
	            draw_text_transformed(320, mon.y + 210, "Living With#Their Families", 2, 2, 0)
	        }
	        draw_set_halign(0)
	        if(view_yview[0] > 3000 and view_yview[0] < 3040) exper= 0
	        if(view_yview[0] > 3040) {
	            exper+= 0.5
	            view_xview[0]+= exper
	            vol-= 0.02
	            caster_set_volume(-3, vol)
	            if(view_xview[0] > 640) get_tree().change_scene_to_file("res://godot_rooms/282.tscn")
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
