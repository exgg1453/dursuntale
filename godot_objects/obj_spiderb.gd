# Auto-converted from GameMaker: obj_spiderb
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	part1= 362
	mypart1= _spawn("part1", x + 62, y - 2)
	$Alarm9.start((8) / 30.0)
	hurtanim= 0
	hurtsound= 35
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= -960
	sha= 0
	shb= 0
	flex= 0
	encourage= 0
	criticize= 0
	hug= 0
	con= 0
	turnamt= 0
	purpletime= 0
	blconactive= 0
	struggle= 0
	GS.flag[382]= 10
	bribes= 0
	atkdown= 0
	type= 10
	obj_battlebg.visible= 0
	blconwd= 3717328137821
	talktime= 0
	ht= sprite_height
	wd= sprite_width
	itemuse= 0
	murder= 0
	if(scr_murderlv() >= 12) {
	    murder= 1
	    GS.monsterdef[myself]= -800
	    mercymod= -90000
	}

func _gm_event_2_9():
	mypart1.parent= GS.monsterinstance[myself]

func _gm_event_2_8():
	snd_play(hurtsound)

func _gm_event_2_6():
	GS.typer= 33
	blcontype= 1
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "What is it,&deary?/%%"
	if(talktime > 0) {
	    if(talktime >= 9) GS.msg[0]= ".../%%"
	    if(talktime == 8) GS.msg[0]= "No, no, it\'s&time to go~/%%"
	    if(talktime == 7)
	        GS.msg[0]= "...&well... maybe&ONE little&nibble~~/%%"
	    if(talktime == 6) GS.msg[0]= "Just kidding,&of course~/%%"
	    if(talktime == 5)
	        GS.msg[0]= "If you don\'t mind&being gobbled up~&Ahuhuhu~/%%"
	    if(talktime == 4)
	        GS.msg[0]= "Ahuhuhuhu~&Well, I don\'t&mind keeping&you here~/%%"
	    if(talktime == 3)
	        GS.msg[0]= "Feeling comfortable&trapped in that&web?/%%"
	    if(talktime == 2) GS.msg[0]= "It\'s time to go~/%%"
	    if(talktime == 1) GS.msg[0]= "Ahuhuhu~&What are you&doing~/%%"
	    talktime++
	}
	GS.msg[1]= "%%%"
	if(turnamt == 0)
	    GS.msg[0]= "Why so pale?&You should be proud~/%%"
	if(turnamt == 1)
	    GS.msg[0]= "Proud that you\'re&going to make a&delicious cake~&Ahuhuhu~/%%"
	if(turnamt == 2) GS.msg[0]= "Let you go^1?&Don\'t be silly~/%%"
	if(turnamt == 3) {
	    GS.msg[0]= "Your SOUL is going&to make every spider&very happy~~~/%%"
	    if(murder == 1)
	        GS.msg[0]= "You\'re scaring off&all my customers!/%%"
	}
	if(turnamt == 4) {
	    GS.msg[0]= "Oh, how rude of me!&I almost forgot&to introduce you&to my pet~/"
	    GS.msg[1]= "It\'s breakfast time,&isn\'t it?&Have fun, you two~ /%%"
	}
	if(turnamt == 5)
	    GS.msg[0]= "The person who warned&us about you.../%%"
	if(turnamt == 6) {
	    GS.msg[0]= "Offered us a LOT of&money for your SOUL./%%"
	    if(murder == 1) GS.msg[0]= "Looked like a total&nerd./%%"
	}
	if(turnamt == 7) {
	    GS.msg[0]= "They had such a sweet&smile~ and... ahuhu~/%%"
	    if(murder == 1)
	        GS.msg[0]= "She was very&adamant I run away&with her~~~&Ahuhuhu~~~/%%"
	}
	if(turnamt == 8) {
	    GS.msg[0]= "It\'s strange, but&I swore I saw them&in the shadows...&Changing shape...?/%%"
	    if(murder == 1)
	        GS.msg[0]= "She even left a&route for me to&escape from~/%%"
	}
	if(turnamt == 9)
	    GS.msg[0]= "Oh, it\'s lunch time,&isn\'t it?&And I forgot to&feed my pet~/%%"
	if(turnamt == 10) {
	    GS.msg[0]= "With that money,&the spider clans&can finally be&reunited~/%%"
	    if(murder == 1)
	        GS.msg[0]= "She said she would&block off the rest&of Hotland after I&followed her~/%%"
	}
	if(turnamt == 11) {
	    GS.msg[0]= "You haven\'t heard?&Spiders have been&trapped in the RUINS&for generations!/%%"
	    if(murder == 1)
	        GS.msg[0]= "Foolish nerd~&A spider NEVER leaves&her web~/"
	    GS.msg[1]= "(Except to sell&pastries~)/%%"
	}
	if(turnamt == 12) {
	    GS.msg[0]= "Even if they go&under the door,&Snowdin\'s fatal cold&is impassable alone./%%"
	    if(murder == 1)
	        GS.msg[0]= "Ah^1, but I do feel&a little regret&over it now.../%%"
	}
	if(turnamt == 13) {
	    GS.msg[0]= "But with the money&from your SOUL, we\'ll&be able to rent&them a heated limo~/%%"
	    if(murder == 1)
	        GS.msg[0]= "Yes^1, I should have&wrapped her up when&I had the chance~/%%"
	}
	if(turnamt == 14) {
	    GS.msg[0]= "And with all of&the leftovers...^1?&We could have a&nice vacation~/"
	    GS.msg[1]= "Or even build a&spider baseball&field~/%%"
	    if(murder == 1)
	        GS.msg[0]= "She looked like she&would have made a&juicy donut~~~/%%"
	}
	if(turnamt == 15)
	    GS.msg[0]= "But enough of that...&It\'s time for&dinner, isn\'t it?&Ahuhuhu~/%%"
	if(con == 0) GS.msg[0]= "Don\'t look so&blue^1, my deary~/%%"
	if(blcontype == 0)
	    blcon= instance_create(xstart + 105 + 60, ystart - 35, 186/* obj_blconsm */)
	if(blcontype == 1)
	    blcon= instance_create(xstart + 110 + 60, ystart - 10, 187/* obj_blconwdflowey */)
	if(blcontype == 0)
	    blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	if(blcontype == 1)
	    blconwd= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	GS.border= 21
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	blconactive= 1
	if(purpletime == 1) event_user(2)

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	if(mypart1.hurt != 1) {
	    dmgwriter= instance_create(x, y + ht - 60, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    mypart1.hurt= 1
	    snd_play(51/* snd_damage */)
	    $Alarm8.start((11) / 30.0)
	}
	if(sha == 0) sha= x
	x= sha + shudder
	if(shudder < 0) shudder= -(shudder + 1)
	else  shudder= -shudder
	if(shudder == 0) {
	    sha= 0
	    GS.hurtanim[myself]= 2
	    exit
	} else  {
	    $Alarm3.start((2) / 30.0)
	    exit
	}

func _process(delta: float):
	if(itemuse == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 50
	    GS.mnfight= 98
	    GS.myfight= 98
	    itemuse= 2
	}
	if(GS.mnfight == 3) {
	    attacked= 0
	    if(instance_exists(363/* obj_purpleheart */)) {
	        // obj_purpleheart
	        with(363) instance_destroy()
	    }
	    if(purpletime == 1 and not instance_exists(357/* obj_signspider */)) {
	        o= instance_create(650, 230, 357/* obj_signspider */)
	        o.signno= turnamt
	    }
	}
	if(alarm[5] > 0) {
	    if(GS.monster[0] == 1 and GS.monsterinstance[0].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[0].alarm[5]) / 30.0)
	    if(GS.monster[1] == 1 and GS.monsterinstance[1].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[1].alarm[5]) / 30.0)
	    if(GS.monster[2] == 1 and GS.monsterinstance[2].alarm[5] > alarm[5])
	        $Alarm5.start((GS.monsterinstance[2].alarm[5]) / 30.0)
	}
	if(GS.mnfight == 1 and talked == 0) {
	    $Alarm5.start((110) / 30.0)
	    $Alarm6.start((1) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(blconactive == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    blconactive= 0
	    event_user(1)
	}
	if(GS.hurtanim[myself] == 1) {
	    shudder= 8
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        GS.hurtanim[myself]= 0
	        mypart1.hurt= 0
	        GS.myfight= 0
	        GS.mnfight= 1
	    } else  {
	        GS.myfight= 0
	        GS.mnfight= 1
	        killed= 1
	        if(con < 95) event_user(4)
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
	if(GS.mnfight == 2) {
	    if(attacked == 0) {
	        pop= scr_monstersum()
	        if(con > 0 and turnamt < 20) {
	            GS.turntimer= 180
	            GS.firingrate= 10
	            gen= instance_create(x, y, 352/* obj_spiderbulletgen */)
	            idealdmg= GS.monsteratk[myself] - atkdown
	            gen.dmg= idealdmg
	            gen.type= turnamt
	            gen.$Alarm0.start((-1) / 30.0)
	            gen.$Alarm1.start((-1) / 30.0)
	            gen.$Alarm2.start((10) / 30.0)
	            with(gen) event_user(3)
	            if(turnamt == 4 or turnamt == 9 or turnamt == 15) {
	                GS.turntimer= 660
	                if(turnamt == 4) GS.turntimer= 620
	                if(turnamt == 15) GS.turntimer= 700
	                gege= instance_create(0, 0, 350/* obj_fakeborderdraw */)
	                gege.pattern= 1
	                gege.dmg= idealdmg
	                gen.$Alarm2.start((30) / 30.0)
	            }
	            turnamt++
	            if(turnamt > 99) {
	                gen.$Alarm0.start((60) / 30.0)
	                GS.turntimer= 360
	                GS.border= 22
	                obj_purpleheart.ttype= 3
	                if(turnamt == 15) obj_purpleheart.yadd2= 3
	                if(turnamt == 16) obj_purpleheart.yadd2= 4
	            }
	        } else  {
	            if(turnamt < 20) {
	                with(mypart1) event_user(0)
	                con= 1
	            } else  {
	                GS.turntimer= -1
	                GS.mnfight= 3
	                GS.myfight= -1
	            }
	        }
	        if(mycommand >= 0)
	            GS.msg[0]= "* Muffet pours you a cup of&  spiders."
	        if(mycommand >= 25)
	            GS.msg[0]= "* All the spiders clap along to&  the music."
	        if(mycommand >= 50)
	            GS.msg[0]= "* Muffet does a synchronized&  dance with the other spiders."
	        if(mycommand >= 75)
	            GS.msg[0]= "* Muffet tidies up the web&  around you."
	        if(mycommand >= 90)
	            GS.msg[0]= "* Smells like freshly baked&  cobwebs."
	        attacked= 1
	    }
	    if(criticize > 0 and pop == 1) {
	        GS.turntimer= -1
	        GS.mnfight= 3
	    }
	    atkdown= 0
	    whatiheard= -1
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* MUFFET - ATK 38.8 DEF 18.8&* If she invites you to her&  parlor^1, excuse your/^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        whatiheard= 9
	    }
	    if(whatiheard == 3) {
	        GS.msc= 0
	        GS.msg[0]= "* You struggle to escape the web^1.&* Nothing happened./^"
	        if(struggle == 0)
	            GS.msg[0]= "* You struggle to escape the web^1.&* Muffet covers her mouth&  and giggles at you./^"
	        if(struggle == 1)
	            GS.msg[0]= "* You struggle to escape the web^1.&* Muffet laughs and claps&  her hands./^"
	        if(struggle == 2) {
	            GS.msg[0]= "* You struggle to escape the web./"
	            GS.msg[1]= "* Muffet is so amused by your&  antics that she gives you a&  discount!/^"
	            if(GS.flag[382] <= GS.gold)
	                GS.flag[382]= ceil(GS.flag[382] / 2)
	            else  GS.flag[382]= GS.gold
	            if(GS.flag[382] <= 1) GS.flag[382]= 1
	        }
	        if(con > 50)
	            GS.msg[0]= "* You struggle to escape the web^1.&* Nothing happened./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	        struggle++
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        if(con < 50) {
	            if(GS.gold >= GS.flag[382]) {
	                GS.msg[0]= "* You pay " + string(GS.flag[382]) + "G^1.&* Muffet reduces her ATTACK&  for this turn!/^"
	                GS.gold-= GS.flag[382]
	                GS.flag[383]+= GS.flag[382]
	                bribes++
	                if(bribes == 1) GS.flag[382]+= 30
	                if(bribes == 2) GS.flag[382]+= 40
	                if(bribes == 3) GS.flag[382]+= 70
	                if(bribes == 4) GS.flag[382]+= 50
	                if(bribes > 4) GS.flag[382]+= 300
	                atkdown= 2
	            } else  {
	                GS.msg[0]= "* You empty your pockets^1, but you&  don\'t have enough money.&* Muffet lowers the price./^"
	                if(bribes == 0) GS.flag[382]-= 5
	                if(bribes == 1) GS.flag[382]-= 5
	                if(bribes == 2) GS.flag[382]-= 5
	                if(bribes > 2) GS.flag[382]-= 5
	                GS.flag[382]= ceil(GS.flag[382] / 10)
	                if(GS.flag[382] <= 1) GS.flag[382]= 1
	            }
	            if(bribes > 0 and GS.gold == 0)
	                GS.msg[0]= "* You\'re out of money^1.&* Muffet shakes her head./^"
	            if(GS.gold == 0 and bribes == 0) {
	                GS.msg[0]= "* You empty your pockets..^1.&* But you don\'t have any&  money at all!/"
	                GS.msg[1]= "* Muffet takes pity on you&  and reduces her ATTACK for&  this turn./^"
	                GS.flag[382]= 10
	                bribes= 1
	                atkdown= 2
	            }
	        } else  GS.msg[0]= "* Muffet refuses your money./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    GS.heard= 1
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) event_user(5)
	}
	if(con == 2) {
	    purpletime= 1
	    GS.msg[0]= "... I think purple is&a better look on&you! Ahuhuhu~/%%"
	    event_user(3)
	    con= 3
	}
	if(con == 3) GS.turntimer= 10
	if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= "* You\'re trapped in a strange&  purple web!"
	    GS.myfight= -1
	    GS.mnfight= 3
	    GS.turntimer= 20
	    con= 4
	}
	if(con == 50) {
	    GS.msg[0]= "You\'re still alive^1?&Ahuhuhu~/"
	    GS.msg[1]= "Oh, my pet~&Looks like it\'s&time for dessert~/%%"
	    if(itemuse > 0) {
	        GS.msg[0]= "Huh^1?&Where did you get&that...?/"
	        GS.msg[1]= "Did you steal it?/"
	        GS.msg[2]= "Oh^1, my pet^1~&It\'s time to show&them what we do&with thieves~/%%"
	    }
	    event_user(3)
	    con= 51
	}
	if(con == 51 and not instance_exists(782/* OBJ_WRITER */)) {
	    instance_create(720, 230, 358/* obj_telegramspider */)
	    con= 52
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 53) {
	    GS.msg[0]= "Huh?&A telegram from&the spiders in&the RUINS?/"
	    GS.msg[1]= "What?&They\'re saying&that they saw&you, and.../"
	    GS.msg[2]= "... that this is&an error message!?/"
	    if(GS.flag[59] == 0) {
	        GS.msg[2]= "... even if you&are stingy, you&never hurt a&single spider!/"
	        if(GS.kills > 0)
	            GS.msg[2]= "... even if you&hurt others, you&never hurt a&single spider!/"
	    }
	    if(GS.flag[59] > 0)
	        GS.msg[2]= "... you helped donate&to their cause!/"
	    if(GS.flag[59] > 20)
	        GS.msg[2]= "... you were&really passionate&about spiders!/"
	    if(GS.flag[59] > 50)
	        GS.msg[2]= "... you\'re a total&spider fanatic!/"
	    if(murder == 1) {
	        GS.msg[1]= "They say even if&you are a hyper-&violent murderer.../"
	        GS.msg[2]= "You never laid a&single finger on a&spider!/"
	    }
	    GS.msg[3]= "Oh my, this has&all been a big&misunderstanding~/"
	    GS.msg[4]= "I thought you&were someone that&hated spiders~/"
	    GS.msg[5]= "The person who&asked for that SOUL.../"
	    GS.msg[6]= "They must have&meant a DIFFERENT&human in a&striped shirt~/"
	    if(murder == 1) {
	        GS.msg[5]= "The person who&warned me about&you.../"
	        GS.msg[6]= "They really had&no idea what they&were talking about~/"
	    }
	    GS.msg[7]= "Sorry for all the&trouble~&Ahuhuhu~/"
	    GS.msg[8]= "I\'ll make it up&to you~/"
	    GS.msg[9]= "You can come back&here any time...&And, for no charge&at all.../"
	    GS.msg[10]= "I\'ll wrap you&up and let you&play with my pet&again!/"
	    GS.msg[11]= "Ahuhuhuhuhuhu~&Just kidding~/"
	    GS.msg[12]= "I\'ll SPARE you&now~/%%"
	    talktime= 1
	    event_user(3)
	    con= 54
	}
	if(con == 54 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= "* Muffet is sparing you."
	    // obj_telegramspider
	    with(358) con= 2
	    turnamt= 20
	    GS.myfight= -1
	    GS.mnfight= 3
	    GS.turntimer= -1
	    mercymod= 9999
	    GS.monsterdef[myself]= -9999
	    con= 55
	}
	if(con == 96) {
	    instance_create(660, 310, 359/* obj_sadspider */)
	    con= 97
	}
	if(con == 97 and not instance_exists(359/* obj_sadspider */)) {
	    GS.monster[myself]= 0
	    instance_destroy()
	}
	if(keyboard_multicheck_pressed(1/* ANYKEY */) and is_instance_valid(blconwd)) {
	    if(blconwd.halt == 0 and GS.typer != 10)
	        blconwd.stringpos= string_length(blconwd.originalstring)
	    keyboard_clear(16/* SHIFT */)
	}
	if(GS.debug == 1) {
	    if(Input.is_key_pressed(68)) turnamt++
	    if(Input.is_key_pressed(65) and turnamt > 0)
	        turnamt--
	}

func _gm_event_7_16():
	if(itemuse == 0 and con < 50) itemuse= 1

func _gm_event_7_15():
	GS.goldreward[myself]= 100 + round(GS.flag[382] / 2)
	if(GS.goldreward[myself] >= 999)
	    GS.goldreward[myself]= 999
	GS.flag[59]+= round(GS.flag[382] / 2)
	with(mypart1) instance_destroy()
	caster_stop(GS.batmusic)
	GS.flag[27]= 1
	scr_monsterdefeat()
	GS.monster[0]= 0
	instance_destroy()

func _gm_event_7_14():
	GS.goldreward[myself]= GS.flag[59] * 2 + GS.flag[383] * 2
	if(GS.goldreward[myself] >= 999)
	    GS.goldreward[myself]= 999
	with(mypart1) instance_destroy()
	con= 95
	$Alarm4.start((50) / 30.0)
	caster_stop(GS.batmusic)
	scr_monsterdefeat()
	GS.monster[0]= 1
	instance_destroy()
	instance_create(660, 230, 359/* obj_sadspider */)

func _gm_event_7_13():
	GS.typer= 33
	blcontype= 1
	blcon= instance_create(xstart + 110 + 60, ystart - 10, 188/* obj_blconwideslave */)
	blconwd= instance_create(blcon.x + 25, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	blcon.parent= blconwd

func _gm_event_7_12():
	purpleheart= instance_create(obj_heart.x, obj_heart.y, 363/* obj_purpleheart */)
	obj_heart.sprite_index= 37/* spr_heartpurple */
	obj_heart.x= -200
	obj_heart.movement= -1

func _gm_event_7_11():
	with(blcon) instance_destroy()
	talked= 0
	GS.mnfight= 2

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
