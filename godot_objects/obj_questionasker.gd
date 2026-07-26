# Auto-converted from GameMaker: obj_questionasker
extends Node2D

func _ready():
	draw_set_font(1)
	phase= -1
	q= 0
	qtext= "No question."
	a1= "Funyuns"
	a2= "Juggalos"
	a3= "Happy Beefsteak"
	a4= "Thunder muffin"
	quiztimer= 0
	correct= -1
	answer= -1
	limit= 4
	quizinit= 0
	image_speed= 0.08
	mettamt= 0
	con= 0
	shake= 0

func _gm_event_2_9():
	caster_free(-3)
	room_goto(GS.currentroom)

func _gm_event_2_7():
	con++

func _gm_event_2_6():
	GS.msg[0]= "ERROR? %%"
	if(correct != answer) {
	    obj_mettatonb_quiz.right= 1
	    instance_create(obj_mettatonb_body.x + 94, obj_mettatonb_body.y - 60, 296/* obj_shockermaker */)
	    snd_play(24/* snd_shock */)
	    obj_heart.movement= 99
	    $Alarm5.start((40) / 30.0)
	    if(q == 1) GS.msg[0]= "HAHAHA, YOU WISH!&WRONG!"
	    if(q == 2) GS.msg[0]= "WRONG! IF ONLY ALPHYS&COULD HELP!"
	    if(q == 3) GS.msg[0]= "NOPE! TOO BAD ALPHYS&CAN\'T HELP!"
	    if(q == 4) GS.msg[0]= "WRONG!!! WRONG!!!&WROOOOOOOONG!!"
	    if(q == 5) GS.msg[0]= "COMPLETELY UTTERLY&WRONG!!!!!!"
	    if(q == 6) GS.msg[0]= "BOY, THAT\'S&EMBARRASSING, HUH?"
	    if(q == 7) GS.msg[0]= "TIME\'S UP!&GUESS THAT\'S A NO?? "
	    if(q == 8) GS.msg[0]= "NO NO NO!&CAN\'T YOU READ!?"
	}
	if(correct == answer) {
	    if(q == 1) GS.msg[0]= "RIGHT! SOUNDS LIKE&YOU GET IT!"
	    if(q == 2) GS.msg[0]= "CORRECT! WHAT A&TERRIFIC ANSWER!"
	    if(q == 3) GS.msg[0]= "TOO EASY FOR&YOU, HUH??????????"
	    if(q == 4) GS.msg[0]= "WONDERFUL! I\'M&ASTOUNDED, FOLKS!"
	    if(q == 5) GS.msg[0]= "CORRECT! YOU\'RE SO&LUCKY TODAY!!!"
	    if(q == 6) GS.msg[0]= "I\'M SO FLATTERED YOU&REMEMBERED!"
	    if(q == 7) GS.msg[0]= "GREAT ANSWER!&I LOVE IT!!!!!!!"
	    if(q == 8) GS.msg[0]= "OF COURSE THAT&WAS EASY FOR YOU!"
	}
	if(q != 6)
	    scr_blcon_x(obj_mettatonb_body.x + 95, obj_mettatonb_body.y - 100)
	else  scr_blcon_x(obj_mettatonb_body.x + 95, obj_mettatonb_body.y - 170)
	GS.msg[0]= "* The quiz show continues."

func _gm_event_2_5():
	dmgamt= ceil(GS.hp / 2)
	GS.hp-= dmgamt
	if(GS.hp <= 1) {
	    GS.hp= 1
	    q= 8
	}
	snd_play(53/* snd_hurt1 */)
	GS.hshake= 2
	GS.shakespeed= 2
	GS.vshake= 2
	instance_create(0, 0, 184/* obj_shaker */)
	GS.invc= 20

func _gm_event_2_4():
	phase++

func _gm_event_7_11():
	nod1= instance_create(240, 260, 306/* obj_answernodule */)
	nod1.qno= 0
	nod1.atext= a1
	nod2= instance_create(360, 260, 306/* obj_answernodule */)
	nod2.qno= 1
	nod2.atext= a2
	nod3= instance_create(240, 340, 306/* obj_answernodule */)
	nod3.qno= 2
	nod3.atext= a3
	nod4= instance_create(360, 340, 306/* obj_answernodule */)
	nod4.qno= 3
	nod4.atext= a4
	obj_answernodule.$Alarm0.start((alarm[4]) / 30.0)

func _gm_event_7_10():
	q++
	quiztimer= 300
	phase= 1
	answer= -1
	$Alarm4.start((90) / 30.0)
	obj_heart.movement= 99
	if(q == 99) {
	    $Alarm4.start((60) / 30.0)
	    qtext= "What\'s a pretzel\'s#favorite color?"
	    a1= "Black"
	    a2= "Yellow"
	    a3= "Red"
	    a4= "Dusk"
	    correct= 2
	    event_user(1)
	}
	if(q == 1) {
	    $Alarm4.start((80) / 30.0)
	    qtext= "What\'s the prize#for answering#correctly?"
	    a1= "Money"
	    a2= "Mercy"
	    a3= "New car"
	    a4= "More questions"
	    correct= 3
	    event_user(1)
	}
	if(q == 2) {
	    $Alarm4.start((60) / 30.0)
	    qtext= "What\'s the king\'s#full name?"
	    a1= "Lord Fluffybuns"
	    a2= "Fuzzy Pushover"
	    a3= "Asgore Dreemurr"
	    a4= "Dr. Friendship"
	    correct= 2
	    event_user(1)
	}
	if(q == 3) {
	    $Alarm4.start((60) / 30.0)
	    qtext= "What are robots#made of?"
	    a1= "Hopes&Dreams"
	    a2= "Metal&Magic"
	    a3= "Snips&Snails"
	    a4= "Sugar&Spice"
	    correct= 1
	    event_user(1)
	}
	if(q == 4) {
	    qtext= "Two trains, Train A and Train B,#simultaneously depart Station A#and Station B.#Station A and Station B are 252.5 miles#apart from each other.#Train A is moving at 124.7mph towards#Station B, and Train B is moving at#253.5mph towards station A.#If both trains departed at 10:00AM and it#is now 10:08, how much longer until#both trains pass each other?"
	    a1= "31.054 minutes"
	    a2= "16.232 minutes"
	    a3= "32.049 minutes"
	    a4= "32.058 minutes"
	    correct= 3
	    $Alarm4.start((90) / 30.0)
	    event_user(1)
	}
	if(q == 5) {
	    $Alarm4.start((60) / 30.0)
	    qtext= "How many flies are#in this jar?"
	    a1= "54"
	    a2= "53"
	    a3= "55"
	    a4= "52"
	    correct= 0
	    event_user(1)
	    instance_create(280, 120, 305/* obj_flyjar */)
	}
	if(q == 6) {
	    $Alarm4.start((60) / 30.0)
	    qtext= "What monster is this?"
	    a1= "Froggit"
	    a2= "Whimsun"
	    a3= "Moldsmal"
	    a4= "Mettaton"
	    correct= 3
	    event_user(1)
	    instance_create(250, 120, 303/* obj_zoomaton */)
	}
	if(q == 7) {
	    qtext= "Would you smooch#a ghost?"
	    a1= "Heck Yeah"
	    a2= "Heck Yeah"
	    a3= "Heck Yeah"
	    a4= "Heck Yeah"
	    correct= 5
	    $Alarm4.start((30) / 30.0)
	    event_user(1)
	}
	if(q == 8) {
	    $Alarm4.start((45) / 30.0)
	    qtext= "How many letters in#the name Mettaton"
	    a1= "special1"
	    a2= "special1"
	    a3= "special1"
	    a4= "special1"
	    correct= 2
	    event_user(1)
	}
	if(q == 9) {
	    $Alarm4.start((200) / 30.0)
	    qtext= "In the dating#simulation video game#" + chr(ord('"')) + "Mew Mew Kissy Cutie" + chr(ord('"')) + "#what is Mew Mew\'s#favorite food?"
	    a1= "Froggit"
	    a2= "Whimsun"
	    a3= "Moldsmal"
	    a4= "Mettaton"
	    correct= 5
	}
	if(q == 10) {
	    $Alarm4.start((70) / 30.0)
	    qtext= "Who does Dr. Alphys#have a crush on?"
	    a1= "Undyne"
	    a2= "Asgore"
	    a3= "The human"
	    a4= "Don\'t know"
	    correct= 6
	    event_user(1)
	}
	if(q == 14) {
	    qtext= "How bright is#this text?"
	    a1= "85% Bright"
	    a2= "84% Bright"
	    a3= "86% Bright"
	    a4= "83% Bright"
	    correct= 1
	    $Alarm4.start((60) / 30.0)
	    event_user(1)
	}

func _on_outside_room():
	draw_sprite_ext(sprite_index, round(frame), x - shake + random(shake * 2), y - shake + random(shake * 2), 2, 2, 0, 16777215, 1)
	if(phase == -1) sprite_index= 343/* spr_alphyshelper */
	if(phase > 0 and con == 0) sprite_index= 344/* spr_alphyshelper_lookup */
	if(phase == 2 and quiztimer < 280) {
	    if(correct == 0) sprite_index= 331/* spr_alphyshelper_a */
	    if(correct == 1) sprite_index= 332/* spr_alphyshelper_b */
	    if(correct == 2) sprite_index= 333/* spr_alphyshelper_c */
	    if(correct == 3) sprite_index= 337/* spr_alphyshelper_d */
	    if(q == 7) sprite_index= 345/* spr_alphyshelper_confused */
	}
	if(phase == 2 and quiztimer > 320) sprite_index= 345/* spr_alphyshelper_confused */
	if(phase > 2 and q < 10) {
	    sprite_index= 340/* spr_alphyshelper_shock */
	    obj_mettatonb_body.arms= 322
	    if(correct == answer) {
	        obj_mettatonb_body.arms= 321
	        sprite_index= 334/* spr_alphyshelper_thumbsup */
	        if(q == 7) sprite_index= 345/* spr_alphyshelper_confused */
	    }
	}
	if(q == 8 and quiztimer < 300) {
	    if(quiztimer % 2 == 0) mettamt++
	    if(not instance_exists(300/* obj_mettatonnn_writer */) and phase == 2)
	        instance_create(x, y, 300/* obj_mettatonnn_writer */)
	}
	if(q == 9 and alarm[4] < 140 and con == 0) {
	    sprite_index= 335/* spr_alphyshelper_tooexcited */
	    $Alarm4.start((-2) / 30.0)
	    GS.msc= 0
	    image_speed= 0.3
	    GS.typer= 52
	    GS.msg[0]= "OH^1! OH^1! I KNOW&THIS ONE!!!&IT\'S SNAIL ICE&CREAM!!!!!!!^1!%"
	    GS.msg[1]= "IN THE FOURTH&CHAPTER EVERYONE&GOES TO THE&BEACH!!!%"
	    GS.msg[2]= "AND SHE BUYS&ICE CREAM FOR&ALL OF HER&FRIENDS!!!!%"
	    GS.msg[3]= "BUT IT\'S SNAIL&FLAVOR AND SHE\'S&THE ONLY ONE&WHO WANTS IT!!!!!!%"
	    GS.msg[4]= "IT\'S ONE OF MY&FAVORITE PARTS&OF THE GAME&BECAUSE%"
	    GS.msg[5]= "IT\'S ACTUALLY A&VERY POWERFUL&message abou^1t&friendshi^1p and..^2.%%"
	    scr_blcon(x - 10, y - 120, 2)
	    con= 1
	}
	if(con == 1) {
	    go= 0
	    if(not instance_exists(782/* OBJ_WRITER */)) go= 1
	    if(not instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 5)
	        go= 1
	    if(go == 1) {
	        image_speed-= 0.004
	        if(image_speed <= 0) {
	            con= 2
	            $Alarm7.start((60) / 30.0)
	            sprite_index= 336/* spr_alphyshelper_excited2 */
	        }
	    }
	}
	if(con == 3) {
	    GS.typer= 51
	    phase= -2
	    GS.msg[0]= "ALPHYS^1,&ALPHYS^1,&ALPHYS./"
	    GS.msg[1]= "YOU AREN\'T HELPING&OUR CONTESTANT,&ARE YOU?/"
	    GS.msg[2]= "OOOOOOH!!!&YOU SHOULD HAVE&TOLD ME./"
	    GS.msg[3]= "I\'LL ASK A&QUESTION.../"
	    GS.msg[4]= "YOU\'LL BE SURE&TO KNOW THE&ANSWER TO!/%%"
	    con= 4
	    sprite_index= 336/* spr_alphyshelper_excited2 */
	    scr_blcon(obj_mettatonb_body.x + 95, obj_mettatonb_body.y - 100, 3)
	}
	if(con == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	    image_speed= 0.2
	    sprite_index= 342/* spr_alphyshelper_shock2 */
	    con= 5
	    event_user(0)
	}
	if(con == 4) {
	    if(instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 1)
	        sprite_index= 339/* spr_alphyshelper_shakehead */
	    if(OBJ_WRITER.stringno == 3) sprite_index= 338/* spr_alphyshelper_embarrass */
	    image_speed= 0.1
	    if(OBJ_WRITER.stringno == 4) sprite_index= 340/* spr_alphyshelper_shock */
	}
	if(con == 7) {
	    sprite_index= 341/* spr_alphyshelper_shockembarrass */
	    GS.typer= 51
	    phase= -2
	    GS.msg[0]= "ALPHYS^1, ALPHYS^1,&ALPHYS./"
	    GS.msg[1]= "YOU AREN\'T HELPING&OUR CONTESTANT,&ARE YOU?/"
	    GS.msg[2]= "OOOOOOH!!!&YOU SHOULD HAVE&TOLD ME./"
	    GS.msg[3]= "I\'LL ASK A&QUESTION.../"
	    GS.msg[4]= "YOU\'LL BE SURE&TO KNOW THE&ANSWER TO!/%%"
	    con= 30
	    if(answer == 0) {
	        GS.msg[0]= "SEE, ALPHYS?&I TOLD YOU IT&WAS OBVIOUS./"
	        GS.msg[1]= "EVEN THE HUMAN&FIGURED IT OUT./"
	        GS.msg[2]= "YES, SHE SCRAWLS&HER NAME IN THE&MARGINS OF HER&NOTES./"
	        GS.msg[3]= "SHE NAMES PROGRAMMING&VARIABLES AFTER&HER./"
	        fsgsfgsx= "LOOLLLL IF YOU CAME TO THIS PART OF THE CODE TO SEE WHO I HAVE A CRUSH ON YOURE OUT OF LUCK"
	        GS.msg[4]= "SHE EVEN WRITES&STORIES OF THEM&TOGETHER.../"
	        GS.msg[5]= "SHARING A DOMESTIC&LIFE./"
	        GS.msg[6]= "PROBABILITY OF&CRUSH:&101 PERCENT./"
	        GS.msg[7]= "MARGIN OF ERROR.&ONE PERCENT./%%"
	    }
	    if(answer == 1) {
	        GS.msg[0]= "WHY WOULD SOMEONE&OUTFIT AN&AMUSEMENT ROBOT.../"
	        GS.msg[1]= "WITH BRUTAL COMBAT&CAPABILITIES?/"
	        GS.msg[2]= "SIMPLE./"
	        GS.msg[3]= "TO IMPRESS MR.&ASGORE DREEMURR,&OF COURSE!/"
	        GS.msg[4]= "OR AS ALPHYS&CALLS HIM.../"
	        GS.msg[5]= "" + chr(ord('"')) + "MR. DREAMY." + chr(ord('"')) + "/"
	        GS.msg[6]= "THOSE STRONG ARMS.../"
	        GS.msg[7]= "THAT LUSTROUS&BEARD.../"
	        GS.msg[8]= "LIKE ALL THOSE WHO&CREATE WEAPONS./"
	        GS.msg[9]= "SHE CRAVES THE&TENDER EMBRACE OF&A BURLY MAN./"
	        GS.msg[10]= "CAN SHE TRULY&BE BLAMED?/%%"
	    }
	    if(answer == 2) {
	        sprite_index= 345/* spr_alphyshelper_confused */
	        shake= 0
	        GS.msg[0]= "... SERIOUSLY?/"
	        GS.msg[1]= "MY MY..^1.&HOW CONCEITED CAN&YOU GET...?/"
	        GS.msg[2]= "I LOVE IT!/"
	        GS.msg[3]= "AND WHILE YOU ARE&COMPLETELY WRONG^1,&YOU DESERVE SOME&CREDIT./"
	        GS.msg[4]= "I\'VE SEEN HER WATCH&YOU ON HER COMPUTER&SCREEN./"
	        GS.msg[5]= "SMILING WHEN YOU&SUCCEED./"
	        GS.msg[6]= "SHRIEKING WHEN YOU&FAIL./"
	        GS.msg[7]= "AND ALWAYS, ALWAYS,&WHISPERING.../"
	        GS.msg[8]= "" + chr(ord('"')) + "NO! WRONG!&YOU HAVE TO&GO THAT WAY!" + chr(ord('"')) + "/"
	        GS.msg[9]= "IN ITS OWN WAY^1,&IS THIS NOT&LOVE??/%%"
	    }
	    if(answer == 3) {
	        sprite_index= 334/* spr_alphyshelper_thumbsup */
	        image_speed= 0.2
	        GS.msg[0]= "CORRECT./"
	        GS.msg[1]= "DR. ALPHYS HAS&A CRUSH ON.../"
	        GS.msg[2]= "THE UNKNOWABLE./"
	        GS.msg[3]= "YOU SEE, ALPHYS&BELIEVES THERE IS&SOMEONE OUT THERE./"
	        GS.msg[4]= "SOMEONE WATCHING HER./"
	        GS.msg[5]= "SOMEONE SHE THINKS&IS " + chr(ord('"')) + "CUTE" + chr(ord('"')) + " AND&" + chr(ord('"')) + "INTERESTING." + chr(ord('"')) + "/"
	        GS.msg[6]= "HELLO, THEORETICAL&PERSON./"
	        GS.msg[7]= "DR. ALPHYS LIKES&YOU./"
	        GS.msg[8]= "TOO BAD YOU&ARE NOT REAL./"
	        GS.msg[9]= "*DERISIVE&LAUGHTRACK*/%%"
	        con= 20
	    }
	    if(con != 20) shake= 1
	    scr_blcon(obj_mettatonb_body.x + 95, obj_mettatonb_body.y - 100, 3)
	}
	if(con == 20 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 2) sprite_index= 345/* spr_alphyshelper_confused */
	    if(OBJ_WRITER.stringno == 4) sprite_index= 338/* spr_alphyshelper_embarrass */
	    if(OBJ_WRITER.stringno == 8) sprite_index= 345/* spr_alphyshelper_confused */
	}
	if(con == 20 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 21
	    sprite_index= 343/* spr_alphyshelper */
	    GS.typer= 52
	    GS.msg[0]= "H-hey^1, I\'ve done&research about this!/"
	    GS.msg[1]= "There are alternate&universes out there!/"
	    GS.msg[2]= "S-someday^1, maybe^1, I&could meet them.../%%"
	    scr_blcon(x - 10, y - 120, 2)
	}
	if(con == 21 and not instance_exists(782/* OBJ_WRITER */)) {
	    sprite_index= 338/* spr_alphyshelper_embarrass */
	    GS.typer= 51
	    phase= -2
	    GS.msg[0]= "YOU SAID THE&EXACT SAME THING&ABOUT " + chr(ord('"')) + "MEW MEW&KISSY CUTIE." + chr(ord('"')) + "/"
	    GS.msg[1]= "BUT I\'LL GIVE YOU&THE BENEFIT OF&THE DOUBT./"
	    GS.msg[2]= "PERSON^1, IF YOU\'RE&OUT THERE.../"
	    GS.msg[3]= "HOW ABOUT GIVING US&A SIGN^1, RIGHT NOW?/%%"
	    con= 22
	    scr_blcon(obj_mettatonb_body.x + 95, obj_mettatonb_body.y - 100, 3)
	}
	if(con == 22 and not instance_exists(782/* OBJ_WRITER */)) {
	    sprite_index= 343/* spr_alphyshelper */
	    caster_pause(GS.batmusic)
	    con= 23
	    $Alarm7.start((150) / 30.0)
	}
	if(con == 24) {
	    sprite_index= 338/* spr_alphyshelper_embarrass */
	    caster_resume(GS.batmusic)
	    con= 30
	    GS.msg[0]= "THAT SETTLES&THAT, DOESN\'T IT?/%%"
	    scr_blcon(obj_mettatonb_body.x + 95, obj_mettatonb_body.y - 100, 3)
	}
	if(con == 30 and not instance_exists(782/* OBJ_WRITER */)) {
	    // obj_mettatonb_body
	    with(301) event_user(1)
	    $Alarm7.start((20) / 30.0)
	    con= 31
	}
	if(con == 32 and not instance_exists(782/* OBJ_WRITER */)) {
	    shake= 0
	    obj_mettatonb_body.arms= 319
	    sprite_index= 343/* spr_alphyshelper */
	    GS.typer= 51
	    phase= -2
	    if(instance_exists(306/* obj_answernodule */)) {
	        // obj_answernodule
	        with(306) instance_destroy()
	    }
	    GS.msg[0]= "WELL WELL WELL./"
	    GS.msg[1]= "WITH DR. ALPHYS&HELPING YOU.../"
	    GS.msg[2]= "THE SHOW HAS NO&DRAMATIC TENSION!/"
	    GS.msg[3]= "WE CAN\'T GO ON&LIKE THIS!!/"
	    GS.msg[4]= "BUT./"
	    GS.msg[5]= "BUT!!!/"
	    GS.msg[6]= "THIS WAS JUST THE&PILOT EPISODE!!/"
	    GS.msg[7]= "NEXT UP, MORE&DRAMA!/"
	    GS.msg[8]= "MORE ROMANCE!!!/"
	    GS.msg[9]= "MORE BLOODSHED!!!/"
	    GS.msg[10]= "UNTIL NEXT TIME,&DARLINGS...!!!/%%"
	    con= 34
	    scr_blcon(obj_mettatonb_body.x - 320, obj_mettatonb_body.y - 120, 1)
	}
	if(con == 34 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_mettatonb_body.arms= 995
	    con= 35
	    obj_mettatonb_body.siner= 0
	    obj_mettatonb_body.sineron= 0
	    obj_mettatonb_body.sprite_index= 329/* spr_mettatonb_armsin */
	    obj_mettatonb_body.frame= 0
	    obj_mettatonb_body.image_speed= 0.25
	}
	if(con == 35 and obj_mettatonb_body.frame >= 5) {
	    con= 36
	    $Alarm7.start((10) / 30.0)
	    obj_mettatonb_body.image_speed= 0
	}
	if(con == 37) {
	    obj_mettatonb_body.shaker= 2
	    con= 38
	    $Alarm7.start((25) / 30.0)
	}
	if(con == 39) {
	    obj_mettatonb_body.image_speed= 0.334
	    obj_mettatonb_body.sprite_index= 330/* spr_mettatonb_rocketoff */
	    obj_mettatonb_body.gravity= -0.4
	    obj_mettatonb_body.gravity_direction= 270
	    con= 40
	    $Alarm7.start((20) / 30.0)
	}
	if(con == 41) {
	    con= 42
	    $Alarm7.start((40) / 30.0)
	    sprite_index= 344/* spr_alphyshelper_lookup */
	}
	if(con == 43) {
	    instance_create(x, y, 149/* obj_unfader */)
	    $Alarm9.start((12) / 30.0)
	    con= 44
	}
	if(phase >= 1 and phase < 3) {
	    obj_mettatonb_body.arms= 318
	    draw_set_color(16777215)
	    if(q == 10) draw_set_color(make_color_hsv(0, 0, 21165))
	    draw_set_font(1)
	    if(q != 4) draw_text(205 + random(1), 50 + random(1), qtext)
	    if(q == 4)
	        draw_text_transformed(170 + random(1), 20 + random(1), qtext, 0.5, 0.5, 6)
	}
	if(phase == 2) {
	    if(q != 10 and q != 9) quiztimer--
	    if(q == 7) quiztimer+= 2
	    drawtime= ceil(quiztimer / 10)
	    draw_set_color(255)
	    draw_set_font(1)
	    if(drawtime > 0) draw_text(300, 260, drawtime)
	    else  phase= 3
	}
	if(phase == 3) {
	    GS.msc= 0
	    GS.typer= 51
	    if(q != 10) {
	        if(instance_exists(300/* obj_mettatonnn_writer */)) {
	            // obj_mettatonnn_writer
	            with(300) instance_destroy()
	        }
	        if(instance_exists(303/* obj_zoomaton */)) {
	            // obj_zoomaton
	            with(303) event_user(0)
	        }
	        $Alarm6.start((4) / 30.0)
	        if(correct == answer and q != 7) {
	            snd_play(26/* snd_dumbvictory */)
	            repeat(60)  instance_create(random(640), -10, 109/* obj_confetti */)
	        }
	        if(q == 7) snd_play(27/* snd_wrongvictory */)
	        phase= 4
	        $Alarm4.start((70) / 30.0)
	    } else  {
	        correct= answer
	        phase= 4
	        con= 6
	        snd_play(28/* snd_bell */)
	        $Alarm7.start((30) / 30.0)
	    }
	}
	if(phase == 5) {
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    if(instance_exists(296/* obj_shockermaker */)) {
	        // obj_shockermaker
	        with(296) instance_destroy()
	    }
	    GS.mnfight= 3
	    phase= -1
	    obj_mettatonb_body.arms= 319
	    // obj_mettatonb_body
	    with(301) event_user(1)
	    // obj_answernodule
	    with(306) instance_destroy()
	}

func _gm_event_9_78():
	if(GS.debug == 1) q= 6

func _gm_event_9_32():
	if(GS.debug == 1) event_user(0)

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
