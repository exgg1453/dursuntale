# Auto-converted from GameMaker: obj_papyrusboss
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scr_monstersetup(0, 0, 0, 0, 0)
	image_speed= 0
	// obj_battlebg
	with(185) instance_destroy()
	gen= 4
	part1= 231
	mypart1= _spawn("part1", x, y)
	hurtanim= 0
	hurtsound= 43
	talked= 0
	whatiheard= -1
	attacked= 0
	killed= 0
	GS.heard= 0
	takedamage= 0
	mercymod= 0
	insult= 0
	close= 0
	dogignore= 0
	pet= 0
	GS.vaporspeed= 0
	hotcha= 0
	flirto= 0
	flirt2= 0
	stalk= 0
	conversation= 0
	prevhp= GS.monsterhp[myself]
	talkify= 0
	GS.batmusic2= caster_load("music/papyrusboss.ogg")
	truefight= 0
	fighto= -1
	xfight= 0
	dontcancel= 0
	bonetalk= 0
	bonetalk2= 0
	bonetalk3= 0
	bonetalk4= 0
	hearthp= GS.hp
	hearthp2= GS.hp
	xxtalk= 0
	if(GS.flag[67] < 0) {
	    truefight= 1
	    conversation= 1
	}
	if(GS.flag[67] == -2) GS.flag[67]= -3
	if(GS.flag[67] == -1) GS.flag[67]= -2
	if(GS.flag[67] == 0) GS.flag[67]= -1
	GS.flag[68]= 1
	ht= sprite_height
	wd= sprite_width
	murder= 0
	if(scr_murderlv() >= 7) {
	    murder= 1
	    GS.flag[290]= 1
	    GS.monsterdef[myself]= -20000
	    dontcancel= 0
	    $Alarm8.start((-2) / 30.0)
	    bonetalk3= 2
	    mercymod= 8000
	}
	blcon= 8589458454
	blconwd= 584589485934

func _gm_event_1_0():
	scr_monsterdefeat(0, 0, 0, 0, 0)
	with(mypart1) instance_destroy()

func _gm_event_2_10():
	if(bonetalk4 == 1) {
	    GS.msg[0]= " ALAS^1, POOR& PAPYRUS!/%%"
	    if(murder == 1)
	        GS.msg[0]= " W-WELL^1, THAT\'S& NOT WHAT I& EXPECTED.../%%"
	    GS.typer= 22
	    blcon= instance_create(x + 145, y + 52, 187/* obj_blconwdflowey */)
	    blconwdS= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    bonetalk4= 2
	}
	if(bonetalk4 == 3) {
	    GS.msg[0]= " WELL^1, AT LEAST I& STILL HAVE MY& HEAD!/%%"
	    if(murder == 1) {
	        GS.msg[0]= " BUT.../"
	        GS.msg[1]= " ST..^1. STILL^1!& I BELIEVE IN& YOU!/"
	        GS.msg[2]= " YOU CAN DO A& LITTLE BETTER!/"
	        GS.msg[3]= " EVEN IF YOU& DON\'T THINK SO!/"
	        GS.msg[4]= " I..^1.& I PROMISE.../%%"
	    }
	    GS.typer= 22
	    blcon= instance_create(x + 145, y + 104, 187/* obj_blconwdflowey */)
	    blconwdS= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    bonetalk4= 3.5
	}
	$Alarm10.start((2) / 30.0)
	if(bonetalk4 == 5) {
	    bonetalk4= 6
	    event_user(2)
	    $Alarm10.start((-2) / 30.0)
	}
	if(bonetalk4 == 4) {
	    GS.xp+= 200
	    dh.c= 7
	    GS.kills++
	    $Alarm10.start((150) / 30.0)
	    bonetalk4= 5
	}
	if(bonetalk4 == 3.5 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(blcon) instance_destroy()
	    bonetalk4= 4
	    $Alarm10.start((100) / 30.0)
	}
	if(bonetalk4 == 2.5) {
	    dh.c= 5
	    bonetalk4= 3
	    $Alarm10.start((80) / 30.0)
	}
	if(bonetalk4 == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    dh.c= 4
	    db.c= 4
	    with(blcon) instance_destroy()
	    $Alarm10.start((30) / 30.0)
	    bonetalk4= 2.5
	}
	if(bonetalk4 == 0) {
	    dh.c= 1
	    $Alarm10.start((60) / 30.0)
	    bonetalk4= 1
	}

func _gm_event_2_9():
	scr_levelup()
	GS.border= 0
	room_goto(GS.currentroom)

func _gm_event_2_8():
	if(bonetalk3 == 0) {
	    vol= caster_get_volume(GS.batmusic)
	    GS.msg[0]= " WELL...! *HUFF^1*& IT\'S CLEAR...& YOU CAN\'T^1! *HUFF^1*& DEFEAT ME!!!/"
	    GS.msg[1]= " YEAH!!!& I CAN SEE YOU& SHAKING IN YOUR& BOOTS!!!/"
	    GS.msg[2]= " THEREFORE I^1, THE& GREAT PAPYRUS^1,& ELECT TO GRANT& YOU PITY!!/"
	    GS.msg[3]= "\\X I WILL \\RSPARE\\X YOU,& HUMAN!!!/"
	    GS.msg[4]= " \\XNOW\'S YOUR CHANCE& TO ACCEPT MY& \\RMERCY\\X./%%"
	    GS.typer= 22
	    blcon= instance_create(x + 145, y + 52, 187/* obj_blconwdflowey */)
	    blconwdS= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    bonetalk3= 1
	}
	$Alarm8.start((2) / 30.0)
	if(bonetalk3 == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    vol= 0
	    with(blcon) instance_destroy()
	    dontcancel= 0
	    $Alarm8.start((-2) / 30.0)
	    bonetalk3= 2
	    mercymod= 8000
	    GS.msg[0]= "* Papyrus is sparing you."
	    GS.monsterdef[myself]= -GS.monsterhp[myself] * 2
	}
	if(vol > 0.01) vol-= 0.01
	caster_set_volume(GS.batmusic, vol)

func _gm_event_2_7():
	if(bonetalk == 0) {
	    GS.msg[0]= " WHAT THE HECK!/"
	    GS.msg[1]= " THAT\'S MY& SPECIAL ATTACK!/%%"
	    GS.typer= 22
	    blcon= instance_create(x + 145, y + 52, 187/* obj_blconwdflowey */)
	    blconwdS= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    bonetalk= 1
	}
	if(bonetalk == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= " HEY^1!& YOU STUPID DOG!/%%"
	    GS.typer= 22
	    blconwdS= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    bonetalk= 2
	    blt_tobydogbone.sprite_index= 81/* spr_tobydogsurprise */
	    blt_tobydogbone.frame= 0
	    blt_tobydogbone.image_speed= 0
	}
	if(bonetalk == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= " DO YOU HEAR& ME!?/"
	    GS.msg[1]= " STOP MUNCHING ON& THAT BONE!!!/%%"
	    GS.typer= 22
	    blconwdS= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    bonetalk= 3
	    blt_tobydogbone.frame= 1
	}
	if(bonetalk == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= " HEY!!!& WHAT ARE YOU& DOING!!!/"
	    GS.msg[1]= " COME BACK HERE& WITH MY SPECIAL& ATTACK!!!/%%"
	    GS.msg[2]= " .../"
	    GS.msg[3]= " OH WELL./%%"
	    GS.typer= 22
	    blconwdS= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    bonetalk= 4
	    blt_tobydogbone.image_speed= 0.2
	    blt_tobydogbone.sprite_index= 83/* spr_tobydogscoot */
	    blt_tobydogbone.velocity.x= 1
	}
	if(bonetalk == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.border= 5
	    GS.msg[0]= " .../"
	    GS.msg[1]= " OH WELL./"
	    GS.msg[2]= " I\'LL JUST USE& A REALLY COOL& REGULAR ATTACK./%%"
	    GS.typer= 22
	    blconwdS= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    bonetalk= 5
	}
	$Alarm7.start((2) / 30.0)
	if(bonetalk == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.msg[0]= "* Papyrus is getting ready&  for a regular attack."
	    with(blcon) instance_destroy()
	    // blt_tobydogbone
	    with(639) instance_destroy()
	    dontcancel= 0
	    $Alarm7.start((-2) / 30.0)
	}

func _gm_event_2_6():
	GS.msc= 0
	if(stalk == 0)
	    blcon= instance_create(x + 145, y + 52, 187/* obj_blconwdflowey */)
	else  blcon= sblcon
	gg= floor(random(3))
	mycommand= round(random(100))
	GS.msg[0]= "  ..."
	if(conversation == 0 and GS.talked == 91)
	    GS.msg[0]= " OH^1, I SHOULD& HAVE BROUGHT ONE&  OF THOSE."
	if(conversation == 0 and whatiheard == -1 and GS.talked != 91 and murder == 0) {
	    talkify= 1
	    $Alarm5.start((-1) / 30.0)
	    if(GS.monsterhp[myself] < prevhp)
	        GS.msg[0]= " SO YOU\'RE& SERIOUS.../"
	    else  GS.msg[0]= " SO YOU WON\'T& FIGHT.../"
	    GS.msg[1]= " THEN^1, LET\'S SEE& IF YOU CAN HANDLE& MY FABLED& \'BLUE ATTACK!\'/%%"
	    GS.msg[2]= "%%%"
	    conversation= 1
	    mycommand= -1
	}
	if(GS.monsterhp[myself] <= 140 and fighto <= 14 and xfight < 4) {
	    fighto= 14
	    xfight= 4
	}
	if(GS.monsterhp[myself] <= 80 and fighto < 15) {
	    fighto= 15
	    xfight= 0
	}
	if(truefight == 1) {
	    talkify= 0
	    if(fighto == -1) GS.msg[0]= " BEHOLD!"
	    if(fighto == -1 and GS.flag[66] == 1)
	        GS.msg[0]= " HMMM... I WONDER& WHAT I SHOULD& WEAR..."
	    if(fighto == 0) GS.msg[0]= " HOW HIGH CAN YOU& JUMP?"
	    if(fighto == 0 and GS.flag[66] == 1)
	        GS.msg[0]= " WHAT!? I\'M NOT& THINKING ABOUT& THAT DATE THING!!"
	    if(fighto == 0 and hearthp2 < hearthp and xxtalk == 0) {
	        GS.msg[0]= " TRY HOLDING THE& \'UP\' BUTTON TO& JUMP!!!"
	        fighto= -1
	        xxtalk= 1
	    }
	    if(fighto == 1)
	        GS.msg[0]= "\\X YEAH!& DON\'T MAKE ME& USE MY \\RSPECIAL& ATTACK\\X!"
	    if(fighto == 1 and hearthp2 < hearthp and xxtalk < 2) {
	        GS.msg[0]= " HOLD \'UP\' LONGER& TO JUMP HIGHER!& JEEZ!!!"
	        fighto= 0
	        xxtalk= 2
	    }
	    if(fighto == 2)
	        GS.msg[0]= " I CAN ALMOST& TASTE MY FUTURE& POPULARITY!!!"
	    if(fighto == 3)
	        GS.msg[0]= " PAPYRUS:& HEAD OF THE& ROYAL GUARD!"
	    if(fighto == 4)
	        GS.msg[0]= " PAPYRUS:& UNPARALLELED& SPAGHETTORE!"
	    if(fighto == 5)
	        GS.msg[0]= " UNDYNE WILL BE& REALLY PROUD& OF ME!!"
	    if(fighto == 6)
	        GS.msg[0]= " THE KING WILL& TRIM A HEDGE& IN THE SHAPE& OF MY SMILE!!!"
	    if(fighto == 7)
	        GS.msg[0]= " MY BROTHER WILL& ... WELL, HE& WON\'T CHANGE& VERY MUCH."
	    if(fighto == 8)
	        GS.msg[0]= " I\'LL HAVE LOTS& OF ADMIRERS!!& BUT..."
	    if(fighto == 9)
	        GS.msg[0]= " HOW WILL I& KNOW IF PEOPLE& SINCERELY LIKE& ME???"
	    if(fighto == 9 and GS.flag[66] == 1)
	        GS.msg[0]= " WILL ANYONE LIKE& ME AS SINCERELY& AS YOU?"
	    if(fighto == 10)
	        GS.msg[0]= " SOMEONE LIKE& YOU IS REALLY& RARE..."
	    if(fighto == 11)
	        GS.msg[0]= " I DON\'T THINK& THEY\'LL LET YOU& GO..."
	    if(fighto == 11 and GS.flag[66] == 1)
	        GS.msg[0]= " AND DATING MIGHT& BE KIND OF& HARD..."
	    if(fighto == 12)
	        GS.msg[0]= " AFTER YOU\'RE& CAPTURED AND& SENT AWAY."
	    if(fighto == 13) GS.msg[0]= " URGH...& WHO CARES!& GIVE UP!!"
	    if(fighto == 14 and xfight == 0)
	        GS.msg[0]= "\\X GIVE UP OR& FACE MY...& \\RSPECIAL ATTACK\\X!!!"
	    if(fighto == 14 and xfight == 1)
	        GS.msg[0]= "\\X YEAH!!!& VERY SOON I WILL& USE MY& \\RSPECIAL ATTACK\\X! "
	    if(fighto == 14 and xfight == 2)
	        GS.msg[0]= "\\X NOT TOO LONG& AND I WILL& USE THAT& \\RSPECIAL ATTACK\\X!!!"
	    if(fighto == 14 and xfight > 2)
	        GS.msg[0]= "\\X THIS IS YOUR& LAST CHANCE...& BEFORE MY& \\RSPECIAL ATTACK\\X!!"
	    if(fighto == 14 and xfight > 3)
	        GS.msg[0]= "\\X BEHOLD...!& MY \\RSPECIAL& ATTACK\\X!"
	    if(fighto == 15)
	        GS.msg[0]= " *SIGH* HERE\'S AN& ABSOLUTELY& NORMAL ATTACK."
	}
	if(whatiheard > -1 and fighto < 2 and fighto < 0) {
	    talkify= 0
	    if(whatiheard == 0 and fighto < 2)
	        GS.msg[0]= " NYEH HEH HEH!"
	    if(whatiheard == 1)
	        GS.msg[0]= " I DON\'T DESERVE& SUCH HOSPITALITY& FROM YOU ..."
	    if(whatiheard == 1 and insult == 2)
	        GS.msg[0]= " YOUR BARBS HIDE A& HIDDEN AFFECTION^1!& YOU EMOTIONAL& CACTUS!"
	    if(whatiheard == 1 and insult > 2)
	        GS.msg[0]= " DON\'T WASTE YOUR& WORDS ON ME!"
	    if(whatiheard == 6 or whatiheard == 7 or whatiheard == 3)
	        GS.msg[0]= " LET\'S DATE& L-LATER!^1!& AFTER I CAPTURE& YOU!"
	}
	if(murder == 1) GS.msg[0]= "  ..."
	GS.typer= 22
	blconwd= instance_create(blcon.x + 15, blcon.y + 10, 782/* OBJ_WRITER */)
	GS.border= 5
	obj_heart.x= round((GS.idealborder[0] + GS.idealborder[1]) / 2) - 8
	obj_heart.y= round((GS.idealborder[2] + GS.idealborder[3]) / 2) - 8
	stalk= 0

func _gm_event_2_5():
	with(blconwd) instance_destroy()
	with(blcon) instance_destroy()
	talked= 0
	whatiheard= -1
	GS.mnfight= 2

func _gm_event_2_3():
	if(frame != 1) {
	    prevhp= GS.monsterhp[myself]
	    with(mypart1) instance_destroy()
	    dogignore= 0
	    dmgwriter= instance_create(x, y + 150, 189/* obj_dmgwriter */)
	    GS.damage= takedamage
	    with(dmgwriter) dmg= GS.damage
	    frame= 1
	    snd_play(51/* snd_damage */)
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
	    $Alarm5.start((320) / 30.0)
	    $Alarm6.start((2) / 30.0)
	    talked= 1
	    GS.heard= 0
	}
	if(keyboard_multicheck_pressed(13/* ENTER */) and talkify == 0 and alarm[5] > 5 and obj_lborder.x == GS.idealborder[0] and alarm[6] < 0)
	    $Alarm5.start((2) / 30.0)
	if(talkify == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    $Alarm5.start((-2) / 30.0)
	    with(blconwd) instance_destroy()
	    with(blcon) instance_destroy()
	    talkify= 0
	    talked= 0
	    whatiheard= -1
	    GS.mnfight= 2
	}
	if(GS.hurtanim[myself] == 1) {
	    shudder= 16
	    $Alarm3.start((GS.damagetimer) / 30.0)
	    GS.hurtanim[myself]= 3
	}
	if(GS.hurtanim[myself] == 2) {
	    GS.monsterhp[myself]-= takedamage
	    with(dmgwriter) $Alarm2.start((15) / 30.0)
	    if(GS.monsterhp[myself] >= 1) {
	        mypart1= _spawn("part1", x, y)
	        GS.hurtanim[myself]= 0
	        frame= 0
	        GS.myfight= 0
	        GS.mnfight= 1
	    } else  {
	        GS.myfight= 0
	        GS.mnfight= 99
	        killed= 1
	        event_user(3)
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
	        GS.turntimer= 4
	        GS.firingrate= 15
	        if(truefight == 0 and mycommand >= 0) {
	            GS.turntimer= 140
	            if(murder == 1) GS.turntimer= 2
	            GS.border= 5
	            bz= round(random(20))
	            gen= instance_create(GS.idealborder[1] + 10, GS.idealborder[3] - 20 + bz, 651/* blt_sizebone */)
	            with(gen) velocity.x= -3
	            bz= round(random(20))
	            gen= instance_create(GS.idealborder[1] + 90, GS.idealborder[3] - 20 + bz, 651/* blt_sizebone */)
	            with(gen) velocity.x= -3
	            bz= round(random(20))
	            gen= instance_create(GS.idealborder[1] + 170, GS.idealborder[3] - 20 + bz, 651/* blt_sizebone */)
	            with(gen) velocity.x= -3
	        }
	        if(truefight == 1) obj_heart.sprite_index= 40/* spr_heartblue */
	        if(truefight == 1 and fighto == 15) {
	            dontcancel= 4
	            obj_heart.movement= 2
	            obj_heart.velocity.y= -1
	            obj_heart.jumpstage= 2
	            GS.turntimer= 1300
	            GS.border= 5
	            k= GS.idealborder[1] + 1900
	            gen= instance_create(GS.idealborder[0] - 10, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 60, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[1] + 160, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 210, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[0] - 360, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[1] + 360, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[0] - 540, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen.osc= -4
	            gen.oscmin= -1
	            gen.oscmax= 60
	            gen= instance_create(GS.idealborder[1] + 540, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen.osc= -4
	            gen.oscmin= -1
	            gen.oscmax= 60
	            gen= instance_create(GS.idealborder[0] - 640, GS.idealborder[3] - 50, 652/* blt_topbone */)
	            gen.velocity.x= 4
	            gen.osc= -4
	            gen.oscmin= -1
	            gen.oscmax= 60
	            gen= instance_create(GS.idealborder[1] + 640, GS.idealborder[3] - 50, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen.osc= -4
	            gen.oscmin= -1
	            gen.oscmax= 60
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[0] - 740, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen.osc= -2
	            gen.oscmin= -1
	            gen.oscmax= 40
	            gen= instance_create(GS.idealborder[1] + 740, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen.osc= -2
	            gen.oscmin= -1
	            gen.oscmax= 40
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[0] - 890, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen.osc= -2
	            gen.oscmin= -1
	            gen.oscmax= 40
	            gen= instance_create(GS.idealborder[1] + 890, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen.osc= -2
	            gen.oscmin= -1
	            gen.oscmax= 40
	            gen= instance_create(GS.idealborder[1] + 1090, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen.osc= -1
	            gen.oscmin= -1
	            gen.oscmax= 30
	            gen= instance_create(GS.idealborder[1] + 1120, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen.osc= -1
	            gen.oscmin= -1
	            gen.oscmax= 30
	            gen= instance_create(GS.idealborder[1] + 1150, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen.osc= -1
	            gen.oscmin= -1
	            gen.oscmax= 30
	            gen= instance_create(GS.idealborder[0] - 1340, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen.osc= -1
	            gen.oscmin= -1
	            gen.oscmax= 30
	            gen= instance_create(GS.idealborder[0] - 1370, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen.osc= -1
	            gen.oscmin= -1
	            gen.oscmax= 30
	            gen= instance_create(GS.idealborder[0] - 1400, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen.osc= -1
	            gen.oscmin= -1
	            gen.oscmax= 30
	            gen= instance_create(GS.idealborder[1] + 2000, GS.idealborder[3] - 40, 636/* blt_scootdog */)
	            gen.velocity.x= -5
	            gen= instance_create(GS.idealborder[1] + 2240, GS.idealborder[3] - 60, 636/* blt_scootdog */)
	            gen.velocity.x= -5
	            gen.sprite_index= 72/* spr_cbone */
	            gen= instance_create(GS.idealborder[1] + 2280, GS.idealborder[3] - 60, 636/* blt_scootdog */)
	            gen.velocity.x= -5
	            gen.sprite_index= 73/* spr_oolbone */
	            gen= instance_create(GS.idealborder[1] + 2500, GS.idealborder[3] - 60, 636/* blt_scootdog */)
	            gen.velocity.x= -5
	            gen.sprite_index= 74/* spr_dbone */
	            gen= instance_create(GS.idealborder[1] + 2540, GS.idealborder[3] - 60, 636/* blt_scootdog */)
	            gen.velocity.x= -5
	            gen.sprite_index= 75/* spr_udebone */
	            gen= instance_create(GS.idealborder[1] + 2220, GS.idealborder[3] - 60, 636/* blt_scootdog */)
	            gen.velocity.x= -4
	            gen.sprite_index= 76/* spr_skatebone */
	            gen= instance_create(k + 10, GS.idealborder[3] - 60, 637/* blt_coolbus */)
	            gen.velocity.x= -3
	            gen= instance_create(k + 70, GS.idealborder[3] - 60, 637/* blt_coolbus */)
	            gen.velocity.x= -3
	            gen= instance_create(k + 130, GS.idealborder[3] - 60, 637/* blt_coolbus */)
	            gen.velocity.x= -3
	            gen= instance_create(k + 190, GS.idealborder[3] - 60, 637/* blt_coolbus */)
	            gen.velocity.x= -3
	            gen= instance_create(k + 250, GS.idealborder[3] - 60, 637/* blt_coolbus */)
	            gen.velocity.x= -3
	            gen= instance_create(k + 310, GS.idealborder[3] - 60, 637/* blt_coolbus */)
	            gen.velocity.x= -3
	            gen= instance_create(k + 370, GS.idealborder[3] - 60, 637/* blt_coolbus */)
	            gen.velocity.x= -3
	            gen= instance_create(k + 430, GS.idealborder[3] - 60, 637/* blt_coolbus */)
	            gen.velocity.x= -3
	            gen= instance_create(k + 490, GS.idealborder[3] - 60, 637/* blt_coolbus */)
	            gen.velocity.x= -3
	            gen= instance_create(k + 550, GS.idealborder[3] - 240, 638/* blt_superbone */)
	            gen.velocity.x= -3
	            gen= instance_create(GS.idealborder[1] + 970, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= -1
	            fighto= 16
	        }
	        if(truefight == 1 and fighto == 14 and xfight > 3) {
	            obj_heart.movement= 2
	            obj_heart.velocity.y= -1
	            obj_heart.jumpstage= 2
	            fighto= 15
	            xfight= 0
	            dontcancel= 1
	            GS.border= 50
	            instance_create(GS.idealborder[1], GS.idealborder[3] - 40, 639/* blt_tobydogbone */)
	            $Alarm7.start((80) / 30.0)
	        }
	        if(truefight == 1 and fighto == 14) {
	            if(truefight == 1) {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	            }
	            xfight++
	            if(mycommand < 20) {
	                GS.turntimer= 210
	                GS.border= 5
	                gen= instance_create(GS.idealborder[0] - 60, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	                gen.velocity.x= 4
	                gen= instance_create(GS.idealborder[0] - 90, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	                gen.velocity.x= 4
	                gen= instance_create(GS.idealborder[0] - 120, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	                gen.velocity.x= 4
	                gen= instance_create(GS.idealborder[0] - 150, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	                gen.velocity.x= 4
	                gen= instance_create(GS.idealborder[0] - 180, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	                gen.velocity.x= 4
	                gen= instance_create(GS.idealborder[0] - 210, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	                gen.velocity.x= 4
	                gen= instance_create(GS.idealborder[0] - 240, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	                gen.velocity.x= 4
	                gen= instance_create(GS.idealborder[1] + 680, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	                gen.velocity.x= -6.4
	                gen= instance_create(GS.idealborder[1] + 720, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	                gen.velocity.x= -6.4
	                gen= instance_create(GS.idealborder[1] + 760, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	                gen.velocity.x= -6.4
	                gen= instance_create(GS.idealborder[1] + 800, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	                gen.velocity.x= -6.4
	                gen= instance_create(GS.idealborder[1] + 840, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	                gen.velocity.x= -6.4
	                gen= instance_create(GS.idealborder[1] + 880, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	                gen.velocity.x= -6.4
	                gen= instance_create(GS.idealborder[1] + 920, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	                gen.velocity.x= -6.4
	            }
	            if(mycommand >= 20 and mycommand < 40) {
	                GS.turntimer= 200
	                GS.border= 5
	                gen= instance_create(GS.idealborder[1] + 10, GS.idealborder[3] - 80, 651/* blt_sizebone */)
	                gen.velocity.x= -5
	                gen.blue= 1
	                gen= instance_create(GS.idealborder[1] + 90, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= -5
	                gen.blue= 0
	                gen= instance_create(GS.idealborder[1] + 170, GS.idealborder[3] - 80, 651/* blt_sizebone */)
	                gen.velocity.x= -5
	                gen.blue= 1
	                gen= instance_create(GS.idealborder[1] + 250, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= -5
	                gen.blue= 0
	                gen= instance_create(GS.idealborder[1] + 330, GS.idealborder[3] - 80, 651/* blt_sizebone */)
	                gen.velocity.x= -5
	                gen.blue= 1
	                gen= instance_create(GS.idealborder[1] + 410, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= -5
	                gen.blue= 0
	                gen= instance_create(GS.idealborder[1] + 490, GS.idealborder[3] - 80, 651/* blt_sizebone */)
	                gen.velocity.x= -5
	                gen.blue= 1
	                gen= instance_create(GS.idealborder[1] + 570, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= -5
	                gen.blue= 0
	                gen= instance_create(GS.idealborder[1] + 1150, GS.idealborder[3] - 80, 651/* blt_sizebone */)
	                gen.velocity.x= -8
	                gen.blue= 1
	                gen= instance_create(GS.idealborder[1] + 1230, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	                gen.velocity.x= -8
	                gen.blue= 0
	            }
	            if(mycommand >= 40) fighto= floor(random(11)) + 2
	        }
	        if(truefight == 1 and fighto == 13) {
	            fighto++
	            if(truefight == 1) {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	            }
	            GS.turntimer= 220
	            GS.border= 5
	            gen= instance_create(GS.idealborder[1] + 20, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen.osc= -3
	            gen.oscmin= -1
	            gen.oscmax= 60
	            gen= instance_create(GS.idealborder[1] + 60, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen.osc= -3
	            gen.oscmin= -1
	            gen.oscmax= 60
	            gen= instance_create(GS.idealborder[1] + 100, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen.osc= -3
	            gen.oscmin= -1
	            gen.oscmax= 60
	            gen= instance_create(GS.idealborder[1] + 240, GS.idealborder[3] - 10, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen.osc= -3
	            gen.oscmin= -1
	            gen.oscmax= 60
	            gen= instance_create(GS.idealborder[1] + 270, GS.idealborder[3] - 10, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen.osc= -3
	            gen.oscmin= -1
	            gen.oscmax= 60
	            gen= instance_create(GS.idealborder[1] + 300, GS.idealborder[3] - 10, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen.osc= -3
	            gen.oscmin= -1
	            gen.oscmax= 60
	            gen= instance_create(GS.idealborder[1] + 460, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 460, GS.idealborder[3] - 40, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen.osc= -3
	            gen.oscmin= -1
	            gen.oscmax= 40
	            gen= instance_create(GS.idealborder[1] + 580, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 580, GS.idealborder[3] - 60, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen.osc= -3
	            gen.oscmin= -1
	            gen.oscmax= 40
	        }
	        if(truefight == 1 and fighto == 12) {
	            fighto++
	            if(truefight == 1) {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	            }
	            GS.turntimer= 200
	            GS.border= 5
	            gen= instance_create(GS.idealborder[0] - 60, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 87, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 114, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 141, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 168, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 195, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 222, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[1] + 600, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -6.4
	            gen= instance_create(GS.idealborder[1] + 640, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	            gen.velocity.x= -6.4
	            gen= instance_create(GS.idealborder[1] + 680, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	            gen.velocity.x= -6.4
	            gen= instance_create(GS.idealborder[1] + 720, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= -6.4
	            gen= instance_create(GS.idealborder[1] + 760, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	            gen.velocity.x= -6.4
	            gen= instance_create(GS.idealborder[1] + 800, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	            gen.velocity.x= -6.4
	            gen= instance_create(GS.idealborder[1] + 840, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -6.4
	        }
	        if(truefight == 1 and fighto == 11) {
	            fighto++
	            if(truefight == 1) {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	            }
	            GS.turntimer= 250
	            GS.border= 5
	            gen= instance_create(GS.idealborder[1] + 60, GS.idealborder[3] - 80, 651/* blt_sizebone */)
	            gen.velocity.x= -4.5
	            gen.blue= 1
	            gen= instance_create(GS.idealborder[1] + 140, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= -4.5
	            gen.blue= 0
	            gen= instance_create(GS.idealborder[1] + 220, GS.idealborder[3] - 80, 651/* blt_sizebone */)
	            gen.velocity.x= -4.5
	            gen.blue= 1
	            gen= instance_create(GS.idealborder[1] + 300, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= -4.5
	            gen.blue= 0
	            gen= instance_create(GS.idealborder[1] + 380, GS.idealborder[3] - 80, 651/* blt_sizebone */)
	            gen.velocity.x= -4.5
	            gen.blue= 1
	            gen= instance_create(GS.idealborder[1] + 460, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= -4.5
	            gen.blue= 0
	            gen= instance_create(GS.idealborder[1] + 540, GS.idealborder[3] - 80, 651/* blt_sizebone */)
	            gen.velocity.x= -4.5
	            gen.blue= 1
	            gen= instance_create(GS.idealborder[1] + 620, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= -4.5
	            gen.blue= 0
	            gen= instance_create(GS.idealborder[1] + 1250, GS.idealborder[3] - 80, 651/* blt_sizebone */)
	            gen.velocity.x= -7
	            gen.blue= 1
	            gen= instance_create(GS.idealborder[1] + 1330, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= -7
	            gen.blue= 0
	        }
	        if(truefight == 1 and fighto == 10) {
	            fighto++
	            if(truefight == 1) {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	            }
	            GS.turntimer= 230
	            GS.border= 5
	            gen= instance_create(GS.idealborder[0] - 40, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 60, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 60, GS.idealborder[3] - 90, 652/* blt_topbone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 80, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 80, GS.idealborder[3] - 100, 652/* blt_topbone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 100, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 100, GS.idealborder[3] - 110, 652/* blt_topbone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 280, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 280, GS.idealborder[3] - 100, 652/* blt_topbone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 295, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 295, GS.idealborder[3] - 90, 652/* blt_topbone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 310, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 310, GS.idealborder[3] - 80, 652/* blt_topbone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[1] + 600, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen.osc= -3
	            gen.oscmin= -1
	            gen.oscmax= 60
	            gen= instance_create(GS.idealborder[1] + 620, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen.osc= -3
	            gen.oscmin= -1
	            gen.oscmax= 60
	            gen= instance_create(GS.idealborder[1] + 640, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen.osc= -3
	            gen.oscmin= -1
	            gen.oscmax= 60
	            blt_topbone.speed= 4.2
	            blt_sizebone.speed= 4.2
	        }
	        if(truefight == 1 and fighto == 9) {
	            fighto++
	            if(truefight == 1) {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	            }
	            GS.turntimer= 355
	            GS.border= 5
	            gen= instance_create(GS.idealborder[1] + 60, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 220, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 220, GS.idealborder[3] - 100, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 360, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 360, GS.idealborder[3] - 90, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 500, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 500, GS.idealborder[3] - 80, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 640, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 640, GS.idealborder[3] - 70, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 780, GS.idealborder[3] - 10, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 780, GS.idealborder[3] - 50, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 990, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen.osc= -1
	            gen.oscmin= -1
	            gen.oscmax= 30
	            gen= instance_create(GS.idealborder[1] + 990, GS.idealborder[3] - 80, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen.osc= -1
	            gen.oscmin= -1
	            gen.oscmax= 30
	            gen= instance_create(GS.idealborder[1] + 1130, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen.osc= -2
	            gen.oscmin= -20
	            gen.oscmax= 30
	            gen= instance_create(GS.idealborder[1] + 1130, GS.idealborder[3] - 100, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen.osc= -2
	            gen.oscmin= -20
	            gen.oscmax= 30
	            blt_topbone.speed= 4.2
	            blt_sizebone.speed= 4.2
	        }
	        if(truefight == 1 and fighto == 8) {
	            fighto++
	            if(truefight == 1) {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	            }
	            GS.turntimer= 230
	            GS.border= 5
	            gen= instance_create(GS.idealborder[1] + 40, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 170, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 170, GS.idealborder[3] - 70, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 310, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 310, GS.idealborder[3] - 80, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 460, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 460, GS.idealborder[3] - 90, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 610, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 610, GS.idealborder[3] - 100, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 760, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 760, GS.idealborder[3] - 110, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            blt_topbone.speed= 4.4
	            blt_sizebone.speed= 4.4
	        }
	        if(truefight == 1 and fighto == 7) {
	            fighto++
	            if(truefight == 1) {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	            }
	            GS.turntimer= 150
	            GS.border= 5
	            gen= instance_create(GS.idealborder[0] - 10, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= 2
	            gen= instance_create(GS.idealborder[0] - 110, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= 2
	            gen= instance_create(GS.idealborder[0] - 210, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= 2
	            gen= instance_create(GS.idealborder[0] - 310, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= 2
	            gen= instance_create(GS.idealborder[1] + 10, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= -2
	            gen= instance_create(GS.idealborder[1] + 110, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= -2
	            gen= instance_create(GS.idealborder[1] + 210, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= -2
	            gen= instance_create(GS.idealborder[1] + 310, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= -2
	            if(xfight > 0) blt_sizebone.speed= 4.4
	            else  {
	                blt_sizebone.speed= 4
	                GS.turntimer= 150
	            }
	        }
	        if(truefight == 1 and fighto == 6) {
	            fighto++
	            if(truefight == 1) {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	            }
	            GS.turntimer= 200
	            GS.border= 5
	            gen= instance_create(GS.idealborder[0] - 10, GS.idealborder[3] - 35, 651/* blt_sizebone */)
	            gen.velocity.x= 2
	            gen= instance_create(GS.idealborder[0] - 110, GS.idealborder[3] - 35, 651/* blt_sizebone */)
	            gen.velocity.x= 2
	            gen= instance_create(GS.idealborder[0] - 210, GS.idealborder[3] - 35, 651/* blt_sizebone */)
	            gen.velocity.x= 2
	            gen= instance_create(GS.idealborder[1] + 10, GS.idealborder[3] - 35, 651/* blt_sizebone */)
	            gen.velocity.x= -2
	            gen= instance_create(GS.idealborder[1] + 110, GS.idealborder[3] - 35, 651/* blt_sizebone */)
	            gen.velocity.x= -2
	            gen= instance_create(GS.idealborder[1] + 210, GS.idealborder[3] - 35, 651/* blt_sizebone */)
	            gen.velocity.x= -2
	        }
	        if(truefight == 1 and fighto == 5) {
	            fighto++
	            if(truefight == 1) {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	            }
	            GS.turntimer= 330
	            GS.border= 5
	            gen= instance_create(GS.idealborder[1] + 40, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -3
	            gen= instance_create(GS.idealborder[1] + 70, GS.idealborder[3] - 45, 651/* blt_sizebone */)
	            gen.velocity.x= -3
	            gen= instance_create(GS.idealborder[1] + 100, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= -3
	            gen= instance_create(GS.idealborder[1] + 130, GS.idealborder[3] - 45, 651/* blt_sizebone */)
	            gen.velocity.x= -3
	            gen= instance_create(GS.idealborder[1] + 160, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -3
	            gen= instance_create(GS.idealborder[1] + 190, GS.idealborder[3] - 15, 651/* blt_sizebone */)
	            gen.velocity.x= -3
	            gen= instance_create(GS.idealborder[1] + 300, GS.idealborder[3] - 15, 651/* blt_sizebone */)
	            gen.velocity.x= -3
	            gen= instance_create(GS.idealborder[1] + 330, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -3
	            gen= instance_create(GS.idealborder[1] + 360, GS.idealborder[3] - 45, 651/* blt_sizebone */)
	            gen.velocity.x= -3
	            gen= instance_create(GS.idealborder[1] + 390, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= -3
	            gen= instance_create(GS.idealborder[1] + 700, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 730, GS.idealborder[3] - 45, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 760, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 790, GS.idealborder[3] - 45, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 820, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 850, GS.idealborder[3] - 15, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 970, GS.idealborder[3] - 15, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 1000, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 1030, GS.idealborder[3] - 45, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 1060, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	        }
	        if(truefight == 1 and fighto == 4) {
	            fighto++
	            if(truefight == 1) {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	            }
	            GS.turntimer= 240
	            GS.border= 5
	            gen= instance_create(GS.idealborder[0] - 40, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 40, GS.idealborder[3] - 80, 652/* blt_topbone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 60, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 60, GS.idealborder[3] - 80, 652/* blt_topbone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 170, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 170, GS.idealborder[3] - 110, 652/* blt_topbone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 190, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 190, GS.idealborder[3] - 110, 652/* blt_topbone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 320, GS.idealborder[3] - 90, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen.blue= 1
	            gen= instance_create(GS.idealborder[1] + 480, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 700, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 700, GS.idealborder[3] - 80, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[0] - 700, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 700, GS.idealborder[3] - 80, 652/* blt_topbone */)
	            gen.velocity.x= 4
	        }
	        if(truefight == 1 and fighto == 3) {
	            fighto++
	            if(truefight == 1) {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	            }
	            GS.turntimer= 150
	            GS.border= 5
	            gen= instance_create(GS.idealborder[0] - 40, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 40, GS.idealborder[3] - 90, 652/* blt_topbone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[1] + 140, GS.idealborder[3] - 40, 652/* blt_topbone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[0] - 260, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 280, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 300, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 320, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 340, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 360, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 380, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 400, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            if(xfight > 0) {
	                // blt_sizebone
	                with(651) speed= 4.5
	            }
	        }
	        if(truefight == 1 and fighto == 2) {
	            fighto++
	            if(truefight == 1) {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	            }
	            GS.turntimer= 240
	            GS.border= 5
	            gen= instance_create(GS.idealborder[0] - 30, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= 3.5
	            gen= instance_create(GS.idealborder[0] - 160, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= 3.5
	            gen= instance_create(GS.idealborder[0] - 290, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= 3.5
	            gen= instance_create(GS.idealborder[0] - 390, GS.idealborder[3] - 80, 651/* blt_sizebone */)
	            gen.velocity.x= 3.5
	            gen.blue= 1
	            if(xfight > 0) blt_sizebone.speed= 4
	            gen= instance_create(GS.idealborder[1] + 1120, GS.idealborder[3] - 30, 651/* blt_sizebone */)
	            gen.velocity.x= -6
	        }
	        if(truefight == 1 and fighto == 1) {
	            fighto++
	            if(truefight == 1) {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	            }
	            GS.turntimer= 220
	            GS.border= 5
	            gen= instance_create(GS.idealborder[0] - 10, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= 3
	            gen= instance_create(GS.idealborder[0] - 80, GS.idealborder[3] - 40, 652/* blt_topbone */)
	            gen.velocity.x= 3
	            gen= instance_create(GS.idealborder[0] - 230, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 310, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 390, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 490, GS.idealborder[3] - 50, 651/* blt_sizebone */)
	            gen.velocity.x= 4
	            gen= instance_create(GS.idealborder[0] - 580, GS.idealborder[3] - 40, 652/* blt_topbone */)
	            gen.velocity.x= 4
	            if(xfight > 0) blt_sizebone.speed= 4.5
	        }
	        if(truefight == 1 and fighto == 0) {
	            fighto++
	            if(truefight == 1) {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	            }
	            GS.turntimer= 300
	            GS.border= 5
	            gen= instance_create(GS.idealborder[1] + 20, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 150, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 280, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 410, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	            gen.velocity.x= -4
	            gen= instance_create(GS.idealborder[1] + 390, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= -3
	            gen= instance_create(GS.idealborder[1] + 510, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= -3
	            gen= instance_create(GS.idealborder[1] + 630, GS.idealborder[3] - 60, 651/* blt_sizebone */)
	            gen.velocity.x= -3
	        }
	        if(truefight == 1 and fighto == -1) {
	            fighto++
	            if(truefight == 1) {
	                obj_heart.movement= 2
	                obj_heart.velocity.y= -1
	                obj_heart.jumpstage= 2
	                obj_heart.sprite_index= 40/* spr_heartblue */
	            }
	            GS.turntimer= 200
	            GS.border= 5
	            gen= instance_create(GS.idealborder[1] + 30, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= -3
	            gen= instance_create(GS.idealborder[1] + 200, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	            gen.velocity.x= -3
	            gen= instance_create(GS.idealborder[1] + 370, GS.idealborder[3] - 40, 651/* blt_sizebone */)
	            gen.velocity.x= -3
	        }
	        if(mycommand == -1) {
	            GS.border= 5
	            GS.turntimer= 300
	            gen= instance_create(x, y, 685/* obj_blueattackgen */)
	        }
	        if(is_instance_valid(gen)) gen.myself= myself
	        hearthp= GS.hp
	        if(mycommand >= 0)
	            GS.msg[0]= "* Papyrus is preparing a bone&  attack."
	        if(mycommand > 15)
	            GS.msg[0]= "* Papyrus prepares a non-bone&  attack then spends a minute&  fixing his mistake."
	        if(mycommand >= 20) GS.msg[0]= "* Papyrus is cackling."
	        if(mycommand >= 30)
	            GS.msg[0]= "* Papyrus whispers " + chr(ord('"')) + "Nyeh heh&  heh!" + chr(ord('"')) + ""
	        if(mycommand >= 40)
	            GS.msg[0]= "* Papyrus is rattling his bones."
	        if(mycommand >= 60)
	            GS.msg[0]= "* Papyrus is trying hard to play&  it cool."
	        if(mycommand >= 80)
	            GS.msg[0]= "* Papyrus is considering his&  options."
	        if(mycommand >= 90) GS.msg[0]= "* Smells like bones."
	        if(mycommand >= 97)
	            GS.msg[0]= "* Papyrus remembered a bad joke&  Sans told and is frowning."
	        if(GS.flag[66] == 1) flirt2++
	        if(flirt2 > 0 and flirt2 < 11) {
	            if(flirt2 == 1)
	                GS.msg[0]= "* Papyrus is thinking about&  what to wear for his date."
	            if(flirt2 == 2)
	                GS.msg[0]= "* Papyrus is thinking about&  what to cook for his date."
	            if(flirt2 == 3)
	                GS.msg[0]= "* Papyrus dabs some Bone&  Cologne behind his ear."
	            if(flirt2 == 4)
	                GS.msg[0]= "* Papyrus dabs marinara sauce&  behind his ear."
	            if(flirt2 == 5)
	                GS.msg[0]= "* Papyrus dabs MTT-Brand Bishie&  Cream behind his ear."
	            if(flirt2 == 6)
	                GS.msg[0]= "* Papyrus dabs MTT-Brand Anime&  Powder behind his ear."
	            if(flirt2 == 7)
	                GS.msg[0]= "* Papyrus dabs MTT-Brand Cute&  Juice behind his ear."
	            if(flirt2 == 8)
	                GS.msg[0]= "* Papyrus dabs MTT-Brand&  Attraction Slime behind his&  ear."
	            if(flirt2 == 9)
	                GS.msg[0]= "* Papyrus dabs MTT-Brand&  Beauty Yogurt behind his&  ear."
	            if(flirt2 == 10)
	                GS.msg[0]= "* Papyrus realizes he doesn\'t&  have ears."
	            if(flirt2 == 11)
	                GS.msg[0]= "* Papyrus has lumps of weird-&  smelling ointment on his&  head."
	        }
	        if(GS.monsterhp[myself] < 100)
	            GS.msg[0]= "* Papyrus is at the edge of&  defeat."
	        if(mercymod >= 8000) GS.msg[0]= "* Papyrus is sparing you."
	        if(murder == 1) GS.msg[0]= "* Papyrus is sparing you."
	        attacked= 1
	        if(xfight > 0) fighto= 14
	    }
	    if(GS.turntimer < 3 and dontcancel == 0) {
	        hearthp2= GS.hp
	        obj_heart.velocity.y= 0
	        obj_heart.jumpstage= 0
	        GS.turntimer= -1
	        GS.mnfight= 3
	        obj_heart.movement= 0
	    }
	    if(GS.turntimer < 3 and dontcancel == 4) {
	        $Alarm8.start((2) / 30.0)
	        dontcancel= 5
	    }
	}
	if(GS.myfight == 2 and whatiheard != -1 and GS.heard == 0) {
	    if(whatiheard == 0) {
	        GS.msc= 0
	        GS.msg[0]= "* PAPYRUS - ATK 20 DEF 20&* He likes to say:&  " + chr(ord('"')) + "Nyeh heh heh!" + chr(ord('"')) + "/^"
	        if(murder == 1)
	            GS.msg[0]= "* PAPYRUS - ATK 3 DEF 3&* Forgettable./^"
	        OBJ_WRITER.halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	        with(iii) halt= 0
	    }
	    if(whatiheard == 1) {
	        GS.msc= 0
	        // OBJ_WRITER
	        with(782) instance_destroy()
	        if(insult <= 2 and truefight == 0) {
	            GS.msg[0]= " HOW SELFLESS.../"
	            GS.msg[1]= " YOU WANT ME TO& FEEL BETTER& ABOUT FIGHTING& YOU.../%%"
	            if(insult == 1)
	                GS.msg[0]= " THERE\'S NO NEED& TO LIE TO& YOURSELF!!!/%%"
	            if(insult > 1) GS.msg[0]= " DON\'T...!/%%"
	            if(insult <= 2) {
	                insult++
	                flirto= 2
	                GS.typer= 22
	                sblcon= instance_create(x + 145, y + 52, 187/* obj_blconwdflowey */)
	                sblconwd= instance_create(sblcon.x + 15, sblcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	            }
	        } else  {
	            GS.msc= 0
	            GS.msg[0]= "* You INSULT^1, but to no avail^1.&* Seems ACTing won\'t escalate&  this battle.../^"
	            if(truefight > 0)
	                GS.msg[0]= "* Papyrus is too busy FIGHTing&  to accept your insult./^"
	            // OBJ_WRITER
	            with(782) halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	        }
	    }
	    if(whatiheard == 3) {
	        hotcha++
	        // OBJ_WRITER
	        with(782) halt= 3
	        if(hotcha <= 2 and truefight == 0) {
	            GS.msg[0]= " WHAT!^1?& FL-FLIRTING!?/"
	            GS.msg[1]= "\\X SO YOU FINALLY& REVEAL YOUR\\R & ULTIMATE FEELINGS\\X!/"
	            GS.msg[2]= " W-WELL^1!& I\'M A SKELETON& WITH VERY HIGH& STANDARDS!!!/%%"
	            flirto= 1
	            if(hotcha == 2) {
	                GS.msg[0]= " OH NO!!!/%%"
	                flirto= 2
	            }
	            if(hotcha > 2) {
	                flirto= 0
	                whatiheard= 3
	                GS.myfight= 0
	                GS.mnfight= 1
	            } else  {
	                GS.flag[66]= 1
	                GS.typer= 22
	                sblcon= instance_create(x + 145, y + 52, 187/* obj_blconwdflowey */)
	                sblconwd= instance_create(sblcon.x + 15, sblcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	            }
	        } else  {
	            GS.msc= 0
	            GS.msg[0]= "* You FLIRT^1, but to no avail^1.&* Seems ACTing won\'t escalate&  this battle.../^"
	            if(truefight > 0)
	                GS.msg[0]= "* Papyrus is too busy FIGHTing&  to flirt back./^"
	            // OBJ_WRITER
	            with(782) halt= 3
	            iii= instance_create(GS.idealborder[0], GS.idealborder[2], 782/* OBJ_WRITER */)
	            with(iii) halt= 0
	        }
	    }
	    if(whatiheard == 6) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	        GS.msg[0]= " OH NO!!^1! YOU\'RE& MEETING ALL MY& STANDARDS!!!/"
	        GS.msg[1]= " I GUESS THIS MEANS& I HAVE TO GO ON A& DATE WITH YOU...?/%%"
	        flirto= 2
	        GS.typer= 22
	        sblcon= instance_create(x + 145, y + 52, 187/* obj_blconwdflowey */)
	        sblconwd= instance_create(sblcon.x + 15, sblcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    }
	    GS.heard= 1
	    if(whatiheard == 7) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	        GS.msg[0]= " OH NO!!^1!& THAT HUMILITY..^1.& IT REMINDS ME OF,/"
	        GS.msg[1]= " MYSELF!!!/"
	        GS.msg[2]= " YOU\'RE MEETING ALL&  MY STANDARDS!!!/%%"
	        flirto= 2
	        GS.typer= 22
	        sblcon= instance_create(x + 145, y + 52, 187/* obj_blconwdflowey */)
	        sblconwd= instance_create(sblcon.x + 15, sblcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    }
	}
	if(GS.myfight == 4 and GS.mercyuse == 0) {
	    script_execute(163/* scr_mercystandard */)
	    if(mercy < 0) event_user(2)
	}
	if(flirto > 0 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(flirto == 1) {
	        GS.msc= 0
	        GS.typer= 1
	        GS.myfight= 3
	        GS.bmenuno= 6
	        GS.msg[0]= "   I can           I have zero&   make            redeeming&   spaghetti       qualities\\C"
	        // OBJ_WRITER
	        with(782) halt= 3
	        iii= instance_create(GS.idealborder[0], GS.idealborder[2], 785/* OBJ_INSTAWRITER */)
	        with(iii) halt= 0
	        with(sblcon) instance_destroy()
	    }
	    if(flirto == 2) {
	        GS.myfight= 0
	        GS.mnfight= 1
	        stalk= 1
	    }
	    flirto= 0
	}

func _gm_event_7_13():
	$Alarm10.start((30) / 30.0)
	GS.hurtanim[myself]= 0
	with(mypart1) instance_destroy()
	visible= 0
	dh= instance_create(x + 41, y, 229/* obj_papyrusdeadhead */)
	db= instance_create(x, y, 230/* obj_papyrusdeadbody */)
	caster_free(GS.batmusic)
	caster_free(GS.batmusic2)

func _gm_event_7_12():
	GS.myfight= 19
	instance_create(0, 0, 149/* obj_unfader */)
	GS.flag[67]= 0
	if(killed == 1) GS.flag[67]= 1
	$Alarm9.start((45) / 30.0)
	GS.plot= 100
	caster_free(-3)

func _gm_event_9_80():
	if(GS.debug == 1) fighto++

func _gm_event_9_79():
	if(GS.debug == 1) fighto--

func _gm_event_9_32():
	if(GS.debug == 1) {
	    truefight= 1
	    conversation= 1
	    fighto= 6
	    xfight= 0
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
