# Auto-converted from GameMaker: obj_npc_room
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	if(room == 225) sprite_index= 1889/* spr_trashcan_tint */
	if(room == 90) sprite_index= 1469/* spr_telescope */
	if(room == 89) sprite_index= 1606/* spr_bench */
	if(room == 85) {
	    sprite_index= 1551/* spr_tutu */
	    if(GS.flag[105] == 1) instance_destroy()
	}
	if(room == 94) sprite_index= 1608/* spr_crystaltable */
	if(room == 98) {
	    sprite_index= 1550/* spr_balletshoes */
	    visible= 0
	    if(GS.flag[106] == 1) instance_destroy()
	}
	if(room == 76) sprite_index= 1629/* spr_signsock */
	if(room == 117) {
	    sprite_index= 1180/* spr_dummy */
	    if(GS.flag[252] == 1) instance_destroy()
	}
	if(room == 122) {
	    sprite_index= 1567/* spr_snailr */
	    if(scr_murderlv() >= 9) instance_destroy()
	}
	if(room == 91 and GS.plot < 110) instance_destroy()
	if(room == 95) {
	    sprite_index= 1546/* spr_tonsildude */
	    if(scr_murderlv() >= 8) instance_destroy()
	    y+= 10
	}
	if(room == 149) {
	    if(scr_murderlv() >= 12) instance_destroy()
	    sprite_index= 1681/* spr_skateboardgirl */
	    if(id == instance_find(object_index, 1))
	        sprite_index= 1680/* spr_fukufire */
	}
	if(room == 151) {
	    if(scr_murderlv() >= 12) instance_destroy()
	    sprite_index= 1679/* spr_businessdude */
	    if(id == instance_find(object_index, 1))
	        sprite_index= 1678/* spr_firecoffee */
	}
	if(room == 146) {
	    sprite_index= 1845/* spr_frypan */
	    if(GS.flag[110] == 1) instance_destroy()
	}
	if(room == 161) {
	    sprite_index= 1846/* spr_apron */
	    if(GS.flag[111] == 1) instance_destroy()
	}
	if(room == 96) {
	    sprite_index= 1267/* spr_chestbox */
	    x+= 10
	    y+= 20
	}
	if(room == 206 or room == 207) sprite_index= 1624/* spr_trashcan */
	if(room == 238) {
	    q= 0
	    ini_open("undertale.ini")
	    fcheck1= ini_read_real("Flowey", "K", 0)
	    fcheck2= ini_read_real("FFFFF", "E", 0)
	    ini_close()
	    if(GS.flag[475] == 1) q= 1
	    if(fcheck1 == 1 and fcheck2 == 2) q= 1
	    if(q == 1) sprite_index= 1096/* spr_flowey_empty */
	    else  instance_destroy()
	}
	if(room == 139 and y < 70) {
	    if(scr_murderlv() >= 12) instance_destroy()
	    sprite_index= 1840/* spr_royalguard_dragon_d */
	    if(GS.plot >= 136) instance_destroy()
	}
	if(room == 223) sprite_index= 1890/* spr_trophy */
	if(room == 224) sprite_index= 1899/* spr_presentbox */
	if(room == 251) {
	    image_blend= 8421504
	    sprite_index= 1245/* spr_dogbowl_empty */
	}
	if(room == 164) sprite_index= 1285/* spr_microwave */
	if(room == 170) {
	    sprite_index= 1674/* spr_donutscaredguy */
	    if(scr_murderlv() >= 12) instance_destroy()
	}
	if(room == 78) {
	    sprite_index= 1623/* spr_treadmill */
	    tread= scr_marker(x, y, 1623)
	    with(tread) {
	        scr_depth()
	        image_speed= 0.2
	    }
	    visible= 0
	}
	if(room == 83) {
	    sprite_index= 1543/* spr_fishnpc_echo */
	    if(scr_murderlv() >= 8) instance_destroy()
	}
	if(room == 48) sprite_index= 2148/* spr_amalgam_fridgenpc */
	if(room == 119) sprite_index= 1665/* spr_mettex_npc */
	if(room == 266) sprite_index= 1770/* spr_videogame */
	if(room == 184) {
	    if(x > 500) sprite_index= 1966/* spr_npc_oni */
	    if(x > 600) sprite_index= 1965/* spr_npc_charles */
	    if(x > 780) sprite_index= 1971/* spr_hotel_receptionist2 */
	    if(scr_murderlv() >= 12) instance_destroy()
	}
	if(room == 178) {
	    sprite_index= 1960/* spr_dresslion_a */
	    if(GS.flag[7] == 1) sprite_index= 1961/* spr_dresslion_b */
	    if(scr_murderlv() >= 12) instance_destroy()
	    if(GS.plot < 167) instance_destroy()
	}
	if(room == 183) {
	    sprite_index= 1970/* spr_diamond_recep */
	    if(scr_murderlv() >= 12) instance_destroy()
	}
	if(room == 158) {
	    if(scr_murderlv() >= 12) instance_destroy()
	    if(GS.flag[67] == 1) instance_destroy()
	    sprite_index= 1963/* spr_vulkinnpc_hotdog */
	    if(x > 160) sprite_index= 1962/* spr_hotdog_harpy */
	}
	if(room == 128) {
	    sprite_index= 1947/* spr_temmie_egg */
	    if(scr_murderlv() >= 10) instance_destroy()
	}

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(room == 224) {
	    if(x <= -10 + get_viewport_rect().size.x / 2) {
	        if(GS.flag[114] == 0) GS.msc= 268
	        else  GS.msc= 272
	    }
	    if(x >= -10 + get_viewport_rect().size.x / 2) {
	        if(GS.flag[115] == 0) GS.msc= 270
	        else  GS.msc= 272
	    }
	}
	if(room == 225) {
	    GS.msg[0]= "* (It\'s a trash can.)/"
	    GS.msg[1]= "* (It\'s full of crumpled-up&  recipes for butterscotch&  pie.)/%%"
	}
	if(room == 223)
	    GS.msg[0]= "* (It\'s a trophy.^1)&* (Number 1 Nose-Nuzzle&  Champs \'98!)/%%"
	if(room == 83) {
	    GS.msg[0]= "* This is an Echo Flower^1.&* It repeats the last thing&  it heard^1, over and over.../%%"
	    if(talkedto > 0) GS.msg[0]= "* Neat^1, huh?/%%"
	    if(obj_echoflower.v == 1)
	        GS.msg[0]= "* Never trust a flower..^1.&* That\'s one of the constants&  of this world./%%"
	}
	if(room == 89) GS.msc= 246
	if(room == 85) GS.msc= 248
	if(room == 94) {
	    GS.msg[0]= "* This cheese has been here so&  long^1, a magical crystal has&  grown around it./"
	    GS.msg[1]= "* It\'s stuck to the table.../%%"
	    if(GS.flag[7] == 1)
	        GS.msg[0]= "* (Seems like the mouse has&  freed some of the cheese&  from the crystal somehow.)/%%"
	}
	if(room == 95) {
	    GS.msg[0]= "* What\'s a star?/"
	    GS.msg[1]= "* Can you touch it?/"
	    GS.msg[2]= "* Can you eat it?/"
	    GS.msg[3]= "* Can you kill it?/"
	    GS.msg[4]= "* .../"
	    GS.msg[5]= "* Are you a star?/%%"
	    if(GS.flag[85] == 1)
	        GS.msg[0]= "* What are you holding^1?&* Is that a star?/%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* We can go and see the&  real stars now.../"
	        GS.msg[1]= "* But I still don\'t know&  what those are./%%"
	    }
	    if(GS.flag[350] == 1) {
	        GS.msg[0]= "* One of the stars faded out./"
	        GS.msg[1]= "* What does that mean...?/%%"
	    }
	}
	if(room == 96) GS.msc= 250
	if(room == 98) GS.msc= 252
	if(sprite_index == 1629) {
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* (It\'s a dirty sock with a&  series of notes on it.)/"
	    GS.msg[1]= "\\TP %"
	    GS.msg[2]= "SANS^1!&PLEASE PICK UP YOUR SOCK!/"
	    GS.msg[3]= "\\Ts %"
	    GS.msg[4]= "* ok./"
	    GS.msg[5]= "\\TP %"
	    GS.msg[6]= "DON\'T PUT IT BACK DOWN^1!&MOVE IT!/"
	    GS.msg[7]= "\\Ts %"
	    GS.msg[8]= "* ok./"
	    GS.msg[9]= "\\TP %"
	    GS.msg[10]= "YOU MOVED IT TWO INCHES^1!&MOVE IT TO YOUR ROOM!/"
	    GS.msg[11]= "\\Ts %"
	    GS.msg[12]= "* ok./"
	    GS.msg[13]= "\\TP %"
	    GS.msg[14]= "AND DON\'T BRING IT BACK!/"
	    GS.msg[15]= "\\Ts %"
	    GS.msg[16]= "* ok./"
	    GS.msg[17]= "\\TP %"
	    GS.msg[18]= "IT\'S STILL HERE!/"
	    GS.msg[19]= "\\Ts %"
	    GS.msg[20]= "* didn\'t you just say not&  to bring it back to my&  room?/"
	    GS.msg[21]= "\\TP %"
	    GS.msg[22]= "FORGET IT!/%%"
	}
	if(room == 304) GS.msc= 580
	if(room == 117) {
	    GS.msg[0]= "* What^1.&* What^1?&* WHAT!?/"
	    GS.msg[1]= "* It\'s a living./%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* So^1, you helped get us&  all free.../"
	        GS.msg[1]= "* I guess I really acted&  like a dummy to you./%%"
	    }
	    if(scr_murderlv() >= 9) {
	        GS.msg[0]= "* Sorry for acting like a&  dummy before./"
	        GS.msg[1]= "* You\'ve really helped me&  out!!/%%"
	    }
	}
	if(room == 122) {
	    GS.msg[0]= "* (It\'s a snail.)/"
	    GS.msg[1]= "* (For some reason^1, you can\'t&  help but wonder what it&  tastes like...)/%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* (It\'s a snail.)/"
	        GS.msg[1]= "* (You wonder if Toriel has&  seen it.)/%%"
	    }
	}
	if(room == 91) {
	    GS.msg[0]= "* Boo-hoo^1, boo-hoo./%%"
	    if(GS.flag[85] == 1)
	        GS.msg[0]= "* Boo-hoo^1, boo-hoo^1,&  umbrella boo-hoo./%%"
	    if(GS.flag[7] == 1)
	        GS.msg[0]= "* Boo-hoo^1, triumphant&  boo-hoo./%%"
	}
	if(room == 149) {
	    GS.msg[0]= "* We were hanging out&  when suddenly^1, a buncha puzzles&  reactivated out of nowhere./"
	    GS.msg[1]= "* This is a huge problem..^1.&* It rules^1! They\'ve GOTTA&  cancel school over this!/%%"
	    if(talkedto > 0)
	        GS.msg[0]= "* Wait a second..^1.&* Auuuugh^1, it\'s summer vacation!/%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* Hey^1, did you hear^1?&* The barrier\'s opened up!/"
	        GS.msg[1]= "* Now school HAS to be&  cancelled^1, right!?/%%"
	    }
	    if(GS.flag[425] == 1) {
	        GS.msg[0]= "* Why should we bother going&  to school^1, anyway...?/"
	        GS.msg[1]= "* This world\'s got no future./%%"
	    }
	    if(id == instance_find(object_index, 1)) {
	        GS.msg[0]= "* Finally!&* Someone turned off that laser!/"
	        GS.msg[1]= "* Now that we\'re free we can..^1.&* Well^1, uh^1, I guess we\'ll just&  keep standing here./%%"
	        if(talkedto > 0)
	            GS.msg[0]= "* Hm^1?&* Nice try^1, but your loitering&  technique still needs work./%%"
	        if(GS.flag[7] == 1)
	            GS.msg[0]= "* There will be lots of places&  to loiter on the surface^1,&  I bet./%%"
	        if(GS.flag[425] == 1)
	            GS.msg[0]= "* Loitering around..^1.&* What\'s the point?/%%"
	    }
	}
	if(room == 151) {
	    GS.msg[0]= "* The way to work is blocked^1,&  so I had time to catch&  Mettaton\'s show on my phone.../"
	    GS.msg[1]= "* The special effects were&  amazing today^1!&* That human almost looked REAL!/%%"
	    if(talkedto > 0)
	        GS.msg[0]= "* Of course^1, an experienced&  viewer like me knows CGI&  when they see it.../%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* The barrier\'s opened up^1, so&  we don\'t have to go to&  work today./"
	        GS.msg[1]= "* I mean^1, sure^1, we\'re free^1,&  but it\'s the little&  things^1, you know?/%%"
	    }
	    if(GS.flag[425] == 1) {
	        GS.msg[0]= "* That last episode had me&  really shaken.../"
	        GS.msg[1]= "* But Mettaton\'s OK^1.&* Everyone knows it\'s just CGI!/%%"
	    }
	    if(id == instance_find(object_index, 1)) {
	        GS.msg[0]= "* Mettaton^1?&* Yeah^1, he\'s the most popular&  star in the underground!/"
	        GS.msg[1]= "* His fan club probably has&  at least two..^1. no^1, THREE&  dozen members!/%%"
	        if(talkedto > 0)
	            GS.msg[0]= "* And that\'s not even counting&  me!/%%"
	        if(GS.flag[7] == 1) {
	            GS.msg[0]= "* Today^1, we all started as&  co-workers.../"
	            GS.msg[1]= "* Who knows what we\'ll be&  tomorrow?/%%"
	        }
	        if(GS.flag[425] == 1) {
	            GS.msg[0]= "* What a heartbreaker./"
	            GS.msg[1]= "* I bet his fanclub\'s almost&  doubled in size from that!/%%"
	        }
	    }
	}
	if(room == 146) GS.msc= 260
	if(room == 161) GS.msc= 262
	if(room == 164) {
	    GS.msg[0]= "* (There\'s a piece of cheese&  inside this computerized&  laser-safe.)/"
	    GS.msg[1]= "* (The lasers have melted the&  edges of the cheese..^1.)&* (It\'s stuck to the table.)/%%"
	    if(GS.flag[7] == 1)
	        GS.msg[0]= "* (Seems like the mouse hacked&  the safe and took the&  cheese out.)/%%"
	}
	if(room == 118) {
	    GS.facechoice= 5
	    GS.faceemotion= 9
	    GS.typer= 37
	    GS.msc= 0
	    GS.msg[0]= "* It\'s so nice to&  have you over!/"
	    GS.msg[1]= "* Why not take a&  seat at the&  table?/%%"
	    if(talkedto > 0)
	        GS.msg[0]= "* Sit at the freakin\'&  table^1, you little&  nerd./%%"
	}
	if(room == 170) {
	    GS.msg[0]= "* I..^1. I..^1. I ended up buying a&  donut.../"
	    GS.msg[1]= "* I..^1. I..^1. I didn\'t want to^1, but&  that girl..^1. even though I told&  her no^1, she.../"
	    GS.msg[2]= "* ... kept staring at me in this&  creepy way and licking her&  lips./"
	    GS.msg[3]= "* N..^1. now I\'m outta cash./%%"
	    if(talkedto > 0)
	        GS.msg[0]= "* Maybe I can sell it online&  and double my money back.../%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* On the surface^1, I won\'t&  buy any donuts from&  spiders./"
	        GS.msg[1]= "* That\'s my resolution./%%"
	    }
	    if(GS.flag[425] == 1) GS.msg[0]= "* .../%%"
	}
	if(room == 206) GS.msc= 264
	if(room == 207) GS.msc= 266
	if(room == 238)
	    GS.msg[0]= "* (It\'s just a regular flower.)/%%"
	if(room == 216)
	    GS.msg[0]= "* From now on^1, call me&  " + chr(ord('"')) + "Jimmy Hotpants." + chr(ord('"')) + "/%%"
	if(room == 139 and y < 70) {
	    GS.msg[0]= "* .../%%"
	    if(talkedto > 0) GS.msg[0]= "* ... what?/%%"
	}
	if(room == 251)
	    GS.msg[0]= "* (It\'s an empty dog food&  bowl.)/%%"
	if(room == 78) {
	    GS.msg[0]= "* (It\'s a treadmill.^1)&* (There\'s a message attached.)/"
	    GS.msg[1]= "* " + chr(ord('"')) + "the truth is that you got&  owned^1, nerd......" + chr(ord('"')) + "/%%"
	}
	if(room == 181) GS.msg[0]= "* (... he seems happy.)/%%"
	if(room == 48) GS.msg[0]= "* Sn..^1. ow..^1. y.../%%"
	if(room == 119) {
	    GS.typer= 27
	    GS.facechoice= 8
	    if(GS.flag[198] == 0) {
	        GS.msg[0]= "\\E0* There you are^1,&  Frisk-darling./"
	        GS.msg[1]= "\\E8* Feast your eyes^1!&* Dr. Alphys completed&  my wonderful new body./"
	        GS.msg[2]= "\\E7* Oooh^1!&* And did you hear^1?&* The barrier\'s OPEN!/"
	        GS.msg[3]= "\\E4* I can\'t wait to see&  the sun.../"
	        GS.msg[4]= "\\E5* ... the greatest&  spotlight of all!!/"
	        GS.msg[5]= "\\E9* Oh yes^1.&* I suppose I should thank&  you^1, too^1, darling./"
	        GS.msg[6]= "\\E2* Before fighting you^1,&  I had.../"
	        GS.msg[7]= "\\E4* Forgotten how fun it&  was to perform with&  others./"
	        GS.msg[8]= "\\E6* So I\'ve been searching&  for HOT TALENTS to fill&  up my upcoming troupe./"
	        GS.msg[9]= "\\E0* So far^1, Shyren\'s agreed&  to be my back-up singer./"
	        GS.msg[10]= "\\E0* And Bl..^1.&* Napstablook^1, here^1, will&  be my sound mixer!/"
	        GS.msg[11]= "\\E2* The three of us&  performing together.../"
	        GS.msg[12]= "\\E4* It really feels overdue^1,&  doesn\'t it?/%%"
	    }
	    if(GS.flag[198] == 1) {
	        GS.msg[0]= "\\E0* Frisk^1, darling^1.&* Can you help me with&  something?/"
	        GS.msg[1]= "\\E2* What kind of merchandise&  do you think humans&  would want to buy...?/"
	        GS.msg[2]= "\\E1* I\'ve thought of a few&  ideas so far./"
	        GS.msg[3]= "\\E6* Buttons (with my face)&* Stickers (with my face)&* CDs (with my face)/"
	        GS.msg[4]= "\\E7* Posters (with my face)&* T-shirts (with my face)&* Underwear (with my face)/"
	        GS.msg[5]= "\\E9* ... and plush dolls of&  TORIEL./"
	        GS.msg[6]= "\\E8* But, you know^1.&* With my face instead&  of hers./"
	        GS.msg[7]= "\\E0* So what do you think?/"
	        GS.msg[8]= "\\TS \\F0 \\T0 %"
	        GS.msg[9]= "* (...)/"
	        GS.msg[10]= "* (A yes or no prompt was not&  provided.)/"
	        GS.msg[11]= "\\TS \\F8 \\TM %"
	        GS.msg[12]= "\\E9* Fabulous^1!&* I completely agree!/%%"
	    }
	    if(GS.flag[198] >= 2) {
	        GS.msg[0]= "\\E2* Oh^1, Frisk^1.&* Why don\'t you go see&  how Alphys is doing?/"
	        GS.msg[1]= "\\E1* Since the flash of light&  she\'s been working hard&  to set everything right./"
	        GS.msg[2]= "\\E0* Ha-Ha^1.&* About time^1, huh?/%%"
	    }
	    GS.flag[198]++
	}
	if(room == 266) {
	    GS.msg[0]= "* (By barking with text-to-speech&  on^1, the dog accidentally&  programmed a whole game.)/"
	    GS.msg[1]= "* (Hmmm..^1. seems fine.)/%%"
	}
	if(room == 184) {
	    GS.msg[0]= "* Blub blub..^1.&* You\'ll have to reserve a&  table to eat here./"
	    GS.msg[1]= "* You\'ll also need to reserve&  your chair^1, your silverware^1,&  your food^1, your.../%%"
	    if(GS.flag[7] == 1)
	        GS.msg[0]= "* Blub blub..^1.&* Now we can live life&  without reservations./%%"
	    if(GS.flag[425] == 1) {
	        GS.msg[0]= "* Blub blub..^1.&* Mettaton isn\'t here to press&  his face into the steaks./"
	        GS.msg[1]= "* He told me that if he ever&  disappeared^1, we could use&  my face instead.../"
	        GS.msg[2]= "* But^1, I\'m nervous^1.&* What if my face doesn\'t&  taste very good...?/%%"
	    }
	    if(x < 120) {
	        GS.msg[0]= "* As I came in^1, I realized I&  forgot to make a reservation./"
	        GS.msg[1]= "* But I didn\'t want to look&  like I messed up^1.&* So I kept walkin\' in anyway./"
	        GS.msg[2]= "* Now I\'m just..^1. kinda..^1.&* Consuming dew off this ficus./%%"
	        if(GS.flag[7] == 1) {
	            GS.msg[0]= "* Oh^1, we\'re all free?/"
	            GS.msg[1]= "* Oh..^1.&* Guess I can..^1.&* Stop lickin\' this ficus./"
	            GS.msg[2]= "* ... but I don\'t want to look&  like I messed up^1, so&  I\'ll keep going.../%%"
	        }
	        if(GS.flag[425] == 1) {
	            GS.msg[0]= "* What would Mettaton think if&  he saw me licking this&  plant of his...?/"
	            GS.msg[1]= "* Eh..^1. who cares./%%"
	        }
	    }
	    if(y > 120) {
	        if(x > 600 and x < 660) {
	            GS.msg[0]= "* I work at the CORE^1.&* The inside is a maze made of&  swappable parts.../"
	            GS.msg[1]= "* That means we can shuffle the&  layout at will./"
	            GS.msg[2]= "* Boy^1, was today a FUN day^1!&* I sure love PUZZLE!!!/%%"
	            if(GS.flag[7] == 1) {
	                GS.msg[0]= "* So^1, if we\'re leaving^1, will&  my job...?/"
	                GS.msg[1]= "* Ugh^1, and I just got a raise^1!&* Well^1, guess every apple has&  its CORE^1, heheh./%%"
	            }
	            if(GS.flag[425] == 1) {
	                GS.msg[0]= "* Today^1, we received the&  promise of a lot of money&  from a strange source./"
	                GS.msg[1]= "* It may not be kosher^1, but..^1.&* Whew^1! I love puzzle!/%%"
	            }
	        }
	        if(x > 510 and x < 540) {
	            GS.msg[0]= "* Originally^1, we dug mazes&  with puzzles in order to&  foil human attacks./"
	            GS.msg[1]= "* But now^1, building things&  winding and confusing...^1.&* It\'s some awful tradition./"
	            GS.msg[2]= "* You can\'t go (ugh) two feet&  without being up to your&  armpits in puzzles./%%"
	            if(GS.flag[7] == 1) {
	                GS.msg[0]= "* The surface world..^1.&* Really!/"
	                GS.msg[1]= "* Maybe I\'ll be able to&  go two feet without running&  into a puzzle./%%"
	            }
	            if(GS.flag[425] == 1) {
	                GS.msg[0]= "* One thing I can say.../"
	                GS.msg[1]= "* I respect Mettaton for not&  putting any puzzles here./"
	                GS.msg[2]= "* At another hotel^1, I had&  to find 12 magic keys just to&  unlock the shower./%%"
	            }
	        }
	    }
	}
	if(room == 178) {
	    GS.msg[0]= "* Mettaton looked really..^1.&* Really cool in that dress./"
	    GS.msg[1]= "* It sort of makes me feel like&  I could wear one^1, too!/%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* Mettaton..^1.!&* He recognized my voice from&  when I called in^1, and.../"
	        GS.msg[1]= "* He..^1. he gave me his dress^1!&* I\'m so...^1!&* Ha ha ha!/%%"
	    }
	    if(GS.flag[425] == 1)
	        GS.msg[0]= "* Please don\'t talk to me^1.&* I am feeling discouraged&  about something./%%"
	}
	if(room == 183) {
	    GS.msg[0]= "* Welcome to MTT Resort - &* Hotland\'s biggest apartment-&  building-turned-hotel!/"
	    GS.msg[1]= "* Whether you\'re here for a night&  or still live here^1, MTT Resort&  prides itself on a great stay!/"
	    GS.msg[2]= "* Just passing through...^1? Nice^1!&* MTT Resort prides itself on&  being passed through!/%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* Sorry - the resort\'s shutting&  down./"
	        GS.msg[1]= "* But I think you\'ll find it\'s&  still great to pass through!/%%"
	    }
	    if(GS.flag[425] == 1) {
	        GS.msg[0]= "* Welcome to MTT Resort^1!&* Have you seen Mettaton?/"
	        GS.msg[1]= "* He hasn\'t come by lately^1.&* I have a lot of respect for&  that man./"
	        GS.msg[2]= "* I had trouble getting a job&  because I am so pointy and&  angular./"
	        GS.msg[3]= "* But^1, being a rectangle^1, he&  understood my struggles./%%"
	    }
	}
	if(room == 158) {
	    if(x > 170) {
	        GS.msg[0]= "* I love hot dogs!/"
	        GS.msg[1]= "* Hey..^1.&* Isn\'t it weird there\'s&  SNOW on that guy\'s roof?/"
	        GS.msg[2]= "* ... guess he\'s just too lazy&  to clean it off./%%"
	        if(not instance_exists(1022/* obj_sans_room */)) {
	            GS.msg[0]= "* I love hot dogs!/"
	            GS.msg[1]= "* But the hot dog guy left..^1.&* Even though all of his&  stuff is still here./"
	            GS.msg[2]= "* ... guess he\'s just too lazy&  to clean it away./%%"
	        }
	        if(GS.flag[7] == 1) {
	            GS.msg[0]= "* I wanted another hot dog^1.&* But the hot dog guy never&  came back./"
	            GS.msg[1]= "* Besides that^1?&* Today was fine./"
	            GS.msg[2]= "* Count your blessings^1.&* Even if you don\'t get a&  second hot dog./%%"
	        }
	    } else  GS.msg[0]= "* Toasty bun!/%%"
	}
	if(room == 128) GS.msg[0]= "* (It\'s hard-boiled.)/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	scr_npc_anim()
	if(room == 85 and not instance_exists(782/* OBJ_WRITER */) and GS.flag[105] == 1) {
	    GS.interact= 0
	    instance_destroy()
	}
	if(room == 98 and not instance_exists(782/* OBJ_WRITER */) and GS.flag[106] == 1) {
	    GS.interact= 0
	    instance_destroy()
	}
	if(room == 146 and not instance_exists(782/* OBJ_WRITER */) and GS.flag[110] == 1) {
	    GS.interact= 0
	    instance_destroy()
	}
	if(room == 161 and not instance_exists(782/* OBJ_WRITER */) and GS.flag[111] == 1) {
	    GS.interact= 0
	    instance_destroy()
	}
	if(room == 224) {
	    if(x < -10 + get_viewport_rect().size.x / 2) {
	        if(GS.flag[114] == 1) frame= 1
	        else  frame= 0
	    }
	    if(x >= -10 + get_viewport_rect().size.x / 2) {
	        if(GS.flag[115] == 1) frame= 1
	        else  frame= 0
	    }
	}
	if(sprite_index == 1680) image_speed= 0.2
	if(sprite_index == 1962) image_speed= 0.2

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
