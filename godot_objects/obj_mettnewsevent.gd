# Auto-converted from GameMaker: obj_mettnewsevent
extends Node2D

func _ready():
	if(GS.plot > 160) instance_destroy()
	scale.y= 5
	con= 0
	quickskip= 0
	failure= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    obj_mainchara.cutscene= 1
	    GS.flag[17]= 1
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[2]= "* Okay^1, I\'m back!/"
	    GS.msg[3]= "\\E0* A-another dark room^1,&  huh?/"
	    GS.msg[4]= "\\E6* Don\'t worry!/"
	    GS.msg[5]= "\\E0* M-my hacking skills&  have got things&  covered!/%%"
	    scr_regulartext()
	    con= 3
	    snd_play(104/* snd_phone */)
	    if(quickskip == 1) con= 130
	}
	if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.flag[20]= 1
	    snd_play(106/* snd_noise */)
	    con= 4
	    news= caster_load("music/news.ogg")
	    if(quickskip == 0) event_user(0)
	    nitem[0]= 0
	    dog= instance_create(380, 250, 1222/* obj_mettnews_artifact */)
	    dog.type= 1
	    nitem[1]= dog
	    water= instance_create(276, 336, 1222/* obj_mettnews_artifact */)
	    water.type= 2
	    nitem[2]= water
	    script= instance_create(380, 342, 1222/* obj_mettnews_artifact */)
	    script.type= 3
	    nitem[3]= script
	    basketball= instance_create(278, 252, 1222/* obj_mettnews_artifact */)
	    basketball.type= 4
	    nitem[4]= basketball
	    present= instance_create(494, 246, 1222/* obj_mettnews_artifact */)
	    present.type= 5
	    nitem[5]= present
	    game= instance_create(494, 342, 1222/* obj_mettnews_artifact */)
	    game.type= 6
	    nitem[6]= game
	    if(quickskip == 0) {
	        ff1= instance_create(140, 300, 1183/* obj_kitchenforcefield */)
	        ff1.scale.x= 1
	        ff1.scale.y= 2
	        ff2= instance_create(560, 300, 1183/* obj_kitchenforcefield */)
	        ff2.scale.x= 1
	        ff2.scale.y= 2
	        ff3= instance_create(340, 200, 1183/* obj_kitchenforcefield */)
	        ff3.scale.x= 2
	        ff3.scale.y= 1
	        ff4= instance_create(420, 400, 1183/* obj_kitchenforcefield */)
	        ff4.scale.x= 2
	        ff4.scale.y= 1
	        ff5= instance_create(720, 300, 1183/* obj_kitchenforcefield */)
	        ff5.scale.x= 1
	        ff5.scale.y= 2
	        $Alarm4.start((60) / 30.0)
	    } else  con= 129
	}
	if(con == 5) {
	    GS.msg[0]= "\\E3* Are you serious?/%%"
	    d= instance_create(0, 0, 779/* obj_dialoguer */)
	    d.side= 0
	    con= 6
	}
	if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_loop(news, 0.9, 1)
	    con= 7
	    GS.typer= 27
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.msg[0]= "* OHHHHHH YESSS!!!/"
	    GS.msg[1]= "* GOOD EVENING^1, BEAUTIES AND&  GENTLEBEAUTIES!/"
	    GS.msg[2]= "* THIS IS METTATON^1, REPORTING&  LIVE FROM MTT NEWS!/"
	    GS.msg[3]= "\\M2* AN INTERESTING SITUATION HAS&  ARISEN IN EASTERN HOTLAND!/"
	    GS.msg[4]= "\\M3* FORTUNATELY^1, OUR CORRESPONDENT&  IS OUT THERE^1, REPORTING LIVE!/"
	    GS.msg[5]= "\\M6* BRAVE CORRESPONDENT^1!&* PLEASE FIND SOMETHING&  NEWSWORTHY TO REPORT!/"
	    GS.msg[6]= "\\M4* OUR TEN WONDERFUL VIEWERS&  ARE WAITING FOR YOU!!/%%"
	    dg= instance_create(0, 0, 779/* obj_dialoguer */)
	    dg.side= 0
	}
	if(con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.flag[20]= 2
	    GS.interact= 0
	    con= 8
	}
	if(con == 50) {
	    nitem[eventchoice].con= 2
	    GS.interact= 1
	    con= 51
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 51) GS.interact= 1
	if(con == 52) con= 60 + (eventchoice - 1) * 5
	if(con == 60) {
	    connor= 0
	    GS.typer= 27
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.facing= 0
	    GS.msg[0]= "\\M3* ATTENTION^1, VIEWERS^1!&* OUR CORRESPONDENT HAS&  FOUND..^1. A DOG!/"
	    GS.msg[1]= "\\M4* (CUE AUDIENCE AWWS)/"
	    GS.msg[2]= "\\M3* THAT\'S RIGHT^1, FOLKS^1!&* IT\'S THE FEEL-GOOD&  STORY OF THE YEAR!/"
	    GS.msg[3]= "\\M4* LOOK AT ITS LITTLE&  EARS^1, TINY PAWS^1, FLUFFY&  TAIL.../"
	    GS.msg[4]= "* .../"
	    GS.msg[5]= "* WAIT A SECOND./"
	    GS.msg[6]= "\\M5* THAT\'S NOT A TAIL!/"
	    GS.msg[7]= "\\M3* THAT\'S.../"
	    GS.msg[8]= "\\M5* A FUSE!!!/%%"
	    gr= instance_create(0, 0, 779/* obj_dialoguer */)
	    gr.side= 0
	    con= 61
	}
	if(con == 61 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 4 and connor == 0) {
	    connor= 1
	    caster_pause(news)
	}
	if(con == 61 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(106/* snd_noise */)
	    with(dog) sprite_index= bombsprite
	    con= 62
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 63) {
	    GS.msg[0]= "\\M4* THAT\'S RIGHT..^1.&* THAT DOG.../"
	    GS.msg[1]= "\\M5* IS A BOMB!!!/"
	    GS.msg[2]= "\\M5* BUT DON\'T PANIC!/"
	    GS.msg[3]= "\\M4* YOU HAVEN\'T EVEN SEEN&  THE REST OF THE ROOM&  YET!!!/%%"
	    gr= instance_create(0, 0, 779/* obj_dialoguer */)
	    gr.side= 0
	    con= 100
	}
	if(con == 65) {
	    connor= 0
	    GS.typer= 27
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.facing= 0
	    GS.msg[0]= "\\M3* ATTENTION^1, VIEWERS^1!&* OUR CORRESPONDENT HAS&  FOUND..^1. A GLASS OF WATER!/"
	    GS.msg[1]= "\\M4* BUT WHAT\'S ASTONISHING&  ABOUT THIS GLASS OF&  WATER.../"
	    GS.msg[2]= "\\M3* IS HOW UNINTERESTING IT IS!/"
	    GS.msg[3]= "\\M4* LIKE ALL GLASSES OF WATER^1,&  IT\'S COMPRISED OF WATER^1,&  GLASS^1, NITROGLYCERIN.../"
	    GS.msg[4]= "* .../"
	    GS.msg[5]= "* WAIT A SECOND./"
	    GS.msg[6]= "\\M5* THAT\'S NOT A GLASS OF&  WATER!!!/"
	    GS.msg[7]= "\\M3* THAT\'S.../"
	    GS.msg[8]= "\\M5* A BOMB!!!/%%"
	    gr= instance_create(0, 0, 779/* obj_dialoguer */)
	    gr.side= 0
	    con= 66
	}
	if(con == 66 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 4 and connor == 0) {
	    connor= 1
	    caster_pause(news)
	}
	if(con == 66 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(106/* snd_noise */)
	    with(water) sprite_index= bombsprite
	    con= 67
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 68) {
	    GS.msg[0]= "\\M5* OH NO!!^1!&* THIS NEWS REPORT.../"
	    GS.msg[1]= "\\M5* IS TURNING INTO A DISASTER&  REPORT!!!/"
	    GS.msg[2]= "\\M3* BUT DON\'T PANIC!/"
	    GS.msg[3]= "\\M4* YOU HAVEN\'T EVEN SEEN&  THE REST OF THE ROOM&  YET!/%%"
	    gr= instance_create(0, 0, 779/* obj_dialoguer */)
	    gr.side= 0
	    con= 100
	}
	if(con == 70) {
	    connor= 0
	    GS.typer= 27
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.facing= 0
	    GS.msg[0]= "\\M3* ATTENTION^1, VIEWERS^1!&* OUR CORRESPONDENT HAS&  FOUND..^1. A MOVIE SCRIPT!/"
	    GS.msg[1]= "\\M5* OH MY^1!&* AND IT LOOKS LIKE IT\'S&  FOR MY LATEST FILM!/"
	    GS.msg[2]= "\\M3* LET\'S NOT KEEP THEM WAITING^1!&* LET\'S OPEN IT UP AND GET&  THE SCOOP!/%%"
	    gr= instance_create(0, 0, 779/* obj_dialoguer */)
	    gr.side= 0
	    con= 71
	}
	if(con == 71 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_pause(news)
	    snd_play(106/* snd_noise */)
	    with(script) sprite_index= bombsprite
	    con= 72
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 73) {
	    GS.msg[0]= "\\M4* ... OH??^1?&* WHAT\'S THAT INSIDE THE&  SCRIPT?/"
	    GS.msg[1]= "\\M4* THAT TICKING SOUND..^1.&* THAT LIT FUSE.../"
	    GS.msg[2]= "\\M5* OH MY!!^1!&* LOOKS LIKE I WAS WRONG&  ABOUT THE MOVIE!/"
	    GS.msg[3]= "* WE DEFINITELY HAVE A BOX&  OFFICE BOMB ON OUR HANDS!/"
	    GS.msg[4]= "* AND IT\'S ABOUT TO BLAST&  YOU TO BITS!/"
	    GS.msg[5]= "\\M3* BUT DON\'T GET TOO EXCITED!/"
	    GS.msg[6]= "\\M4* YOU HAVEN\'T EVEN SEEN&  THE REST OF THE ROOM&  YET!/%%"
	    gr= instance_create(0, 0, 779/* obj_dialoguer */)
	    gr.side= 0
	    con= 100
	}
	if(con == 75) {
	    connor= 0
	    GS.typer= 27
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.facing= 0
	    GS.msg[0]= "\\M3* ATTENTION^1, VIEWERS^1!&* OUR CORRESPONDENT HAS&  FOUND..^1. A BASKETBALL!/"
	    GS.msg[1]= "\\M4* AH^1.&* BASKETBALLS./"
	    GS.msg[2]= "\\M3* CIRCLES OF FUN^1.&* ORBS OF JOY^1.&* SPHERES OF AMUSEMENT./"
	    GS.msg[3]= "\\M4* BUT YOU SHOULDN\'T PLAY&  WITH THIS ONE^1.&* IT\'S AN MTT-BRAND FASHIONBALL./"
	    GS.msg[4]= "\\M3* PROPER MAINTENANCE IS&  REQUIRED TO KEEP IT LOOKING&  GOOD./"
	    GS.msg[5]= "\\M3* AS YOU CAN SEE^1, EVEN EXPOSURE&  TO HUMAN BODY HEAT CAUSES&  THE PAINT TO SLOUGH OFF./"
	    GS.msg[6]= "* .../"
	    GS.msg[7]= "* WAIT A SECOND./"
	    GS.msg[8]= "* THAT\'S NOT A BASKETBALL./%%"
	    gr= instance_create(0, 0, 779/* obj_dialoguer */)
	    gr.side= 0
	    con= 76
	}
	if(con == 76 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 6 and connor == 0) {
	    connor= 1
	    caster_pause(news)
	}
	if(con == 76 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(106/* snd_noise */)
	    with(basketball) sprite_index= bombsprite
	    con= 77
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 78) {
	    GS.msg[0]= "\\M5* THAT\'S A BOMB!!!/"
	    GS.msg[1]= "* OH NO!!^1!&* THIS SPORT REVIEW.../"
	    GS.msg[2]= "* IS TURNING INTO A SHORT&  REVIEW!/"
	    GS.msg[3]= "* BECAUSE IT\'LL BE OVER^1.&* AFTER YOU BLOW UP./"
	    GS.msg[4]= "\\M3* BUT DON\'T GET TOO EXCITED!/"
	    GS.msg[5]= "\\M4* YOU HAVEN\'T EVEN SEEN&  THE REST OF THE ROOM&  YET!/%%"
	    gr= instance_create(0, 0, 779/* obj_dialoguer */)
	    gr.side= 0
	    con= 100
	}
	if(con == 80) {
	    connor= 0
	    GS.typer= 27
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.facing= 0
	    GS.msg[0]= "\\M3* ATTENTION^1, VIEWERS^1!&* OUR CORRESPONDENT HAS&  FOUND..^1. A PRESENT!/"
	    GS.msg[1]= "\\M4* AND IT\'S TIME FOR THE&  UNBOXING VIDEO!!!/"
	    GS.msg[2]= "\\M5* LET\'S FIND OUT WHAT\'S&  INSIDE!!/%%"
	    gr= instance_create(0, 0, 779/* obj_dialoguer */)
	    gr.side= 0
	    con= 81
	}
	if(con == 81 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_pause(news)
	    snd_play(106/* snd_noise */)
	    with(present) sprite_index= bombsprite
	    con= 82
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 83) {
	    GS.msg[0]= "\\M2* THAT ROUND^1, BLACK SHAPE..^1.&* COULD IT BE???/"
	    GS.msg[1]= "\\M4* LOOKS LIKE CHRISTMAS CAME&  EARLY THIS YEAR./"
	    GS.msg[2]= "\\M5* IF SANTA GAVE PEOPLE BOMBS&  INSTEAD OF PRESENTS!!/"
	    GS.msg[3]= "\\M2* REALLY THOUGH^1.&* A BOMB^1.&* WHAT A THOUGHTFUL GIFT./"
	    GS.msg[4]= "\\M4* THEY EVEN DECIDED TO&  LIGHT IT FOR YOU!/"
	    GS.msg[5]= "\\M3* BUT DON\'T GET TOO EXCITED!/"
	    GS.msg[6]= "\\M4* YOU HAVEN\'T EVEN SEEN&  THE REST OF THE ROOM&  YET!/%%"
	    gr= instance_create(0, 0, 779/* obj_dialoguer */)
	    gr.side= 0
	    con= 100
	}
	if(con == 85) {
	    connor= 0
	    GS.typer= 27
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msc= 0
	    GS.facing= 0
	    GS.msg[0]= "\\M3* ATTENTION^1, VIEWERS^1!&* OUR CORRESPONDENT HAS&  FOUND..^1. A VIDEO GAME!/"
	    GS.msg[1]= "\\M4* THIS ACTION-PACKED GAME&  IS GUARANTEED TO BLOW YOU&  AWAY!/"
	    GS.msg[2]= "\\M3* STRANGE ENEMIES^1!&* STRANGE ALLIES^1!&* ATTRACTIVE ROBOTS!/"
	    GS.msg[3]= "\\M4* FEATURING UP TO SIX&  ARBITRARY DIALOGUE CHOICES&  AT ONCE!/"
	    GS.msg[4]= "\\M5* CORRESPONDENT^1!&* LET\'S LOOK INSIDE THE CASE!/%%"
	    gr= instance_create(0, 0, 779/* obj_dialoguer */)
	    gr.side= 0
	    con= 86
	}
	if(con == 86 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_pause(news)
	    snd_play(106/* snd_noise */)
	    with(game) sprite_index= bombsprite
	    con= 87
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 88) {
	    GS.msg[0]= "\\M4* ..^1.&* THOSE RED CYLINDERS WITH&  BURNING FUSES.../"
	    GS.msg[1]= "\\M5* OH NO^1!&* THIS GAME LITERALLY IS&  DYNAMITE!/"
	    GS.msg[2]= "\\M5* I GUESS THEY WERE RIGHT&  ALL ALONG!!!/"
	    GS.msg[3]= "\\M5* VIDEO-GAMES DO CAUSE&  VIOLENCE!/"
	    GS.msg[4]= "\\M4* OR AT LEAST THIS ONE\'S&  ABOUT TO./"
	    GS.msg[5]= "\\M3* BUT DON\'T GET TOO EXCITED!/"
	    GS.msg[6]= "\\M4* YOU HAVEN\'T EVEN SEEN&  THE REST OF THE ROOM&  YET!/%%"
	    gr= instance_create(0, 0, 779/* obj_dialoguer */)
	    gr.side= 0
	    con= 100
	}
	if(con == 100 and not instance_exists(782/* OBJ_WRITER */)) {
	    water.sprite_index= water.bombsprite
	    script.sprite_index= script.bombsprite
	    game.sprite_index= game.bombsprite
	    if(eventchoice != 1 and eventchoice != 4)
	        present.sprite_index= present.bombsprite
	    GS.flag[20]= 8
	    with(ff2) instance_destroy()
	    with(ff3) instance_destroy()
	    with(ff4) instance_destroy()
	    con= 103
	    $Alarm4.start((50) / 30.0)
	    obj_mainchara.cutscene= 1
	    event_user(1)
	}
	if(con == 105) {
	    if(view_xview[0] > 240) view_xview[0]-= 3
	    if(view_xview[0] < 210) view_xview[0]+= 3
	    if(view_yview[0] < 140) view_yview[0]+= 3
	    if(view_yview[0] > 150) view_yview[0]-= 3
	}
	if(con == 104) {
	    con= 105
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 106) con= 107
	if(con == 107) {
	    GS.typer= 27
	    GS.msc= 0
	    GS.faceemotion= 0
	    GS.facechoice= 0
	    GS.msg[0]= "* OH MY!/"
	    GS.msg[1]= "* IT SEEMS EVERYTHING IN THIS&  AREA IS ACTUALLY A BOMB!/"
	    if(eventchoice != 1) {
	        GS.msg[2]= "* THAT DOG\'S A BOMB!/%%"
	        con= 108
	    } else  {
	        GS.msg[2]= "* THAT PRESENT\'S A BOMB!/%%"
	        con= 112
	    }
	    dg= instance_create(0, 0, 779/* obj_dialoguer */)
	    dg.side= 0
	}
	if(con == 108 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(106/* snd_noise */)
	    dog.sprite_index= dog.bombsprite
	    con= 109
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 110) con= 116
	if(con == 112 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(106/* snd_noise */)
	    present.sprite_index= present.bombsprite
	    con= 109
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 116) {
	    if(eventchoice != 4) {
	        GS.msg[0]= "* THAT BASKETBALL\'S A BOMB!/%%"
	        con= 118
	    } else  {
	        GS.msg[0]= "* THAT PRESENT\'S A BOMB!/%%"
	        con= 122
	    }
	    dg= instance_create(0, 0, 779/* obj_dialoguer */)
	    dg.side= 0
	}
	if(con == 118 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(106/* snd_noise */)
	    basketball.sprite_index= basketball.bombsprite
	    con= 119
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 122 and not instance_exists(782/* OBJ_WRITER */)) {
	    snd_play(106/* snd_noise */)
	    present.sprite_index= present.bombsprite
	    con= 119
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 120) con= 125
	if(con == 125) {
	    GS.msg[0]= "* EVEN MY WORDS ARE...!/%%"
	    dg= instance_create(0, 0, 779/* obj_dialoguer */)
	    dg.side= 0
	    con= 125.1
	}
	if(con == 125.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    wordfall= instance_create(view_xview[0] + 20, view_yview[0] + 20, 1230/* obj_wordfall */)
	    GS.typer= 5
	    GS.msg[0]= "\\TS ^7  %"
	    GS.msg[1]= " %%"
	    dg= instance_create(0, 0, 779/* obj_dialoguer */)
	    dg.side= 0
	    con= 126
	}
	if(con == 126 and not instance_exists(782/* OBJ_WRITER */)) {
	    bigbomb= scr_marker(340, 80, 1767)
	    bigbomb.z_index= 500000
	    bigbombsolid= instance_create(340, 100, 8/* obj_solidwide */)
	    GS.typer= 27
	    GS.msg[0]= "\\W* BRAVE CORRESPONDENT..^1.&* IF YOU DON\'T DEFUSE ALL OF&  THE BOMBS.../%%"
	    dg= instance_create(0, 0, 779/* obj_dialoguer */)
	    dg.side= 0
	    con= 127
	}
	if(con == 127 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.facing= 2
	    view_object[0]= -4
	    if(view_yview[0] > 40) {
	        obj_mettanchor.y-= 15
	        view_yview[0]-= 10
	    } else  con= 128
	}
	if(con == 128) {
	    GS.msg[0]= "\\W*\\M9 THIS BIG BOMB WILL BLOW&  YOU TO SMITHEREENS IN&  \\YTWO MINUTES\\W!/"
	    GS.msg[1]= "\\M8* THEN YOU WON\'T BE REPORTING&  " + chr(ord('"')) + "LIVE" + chr(ord('"')) + " ANY LONGER!/"
	    GS.msg[2]= "* HOW TERRIBLE^1!&* HOW DISTURBING!/"
	    GS.msg[3]= "\\M9* OUR NINE VIEWERS ARE GOING&  TO LOVE WATCHING THIS!/"
	    GS.msg[4]= "* GOOD LUCK^1, DARLING!!/%%"
	    dg= instance_create(0, 0, 779/* obj_dialoguer */)
	    dg.side= 1
	    con= 129
	    // obj_mettnews_artifact
	    with(1222) velocity.y= 5
	    // obj_mettnews_artifact
	    with(1222) gtfo= 1
	    with(dog) velocity.y= 0
	    with(dog) gtfo= 0
	}
	if(con == 129 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(is_instance_valid(game)) {
	        with(game) instance_destroy()
	    }
	    if(is_instance_valid(present)) {
	        with(present) instance_destroy()
	    }
	    if(is_instance_valid(script)) {
	        with(script) instance_destroy()
	    }
	    if(is_instance_valid(water)) {
	        with(water) instance_destroy()
	    }
	    if(is_instance_valid(basketball)) {
	        with(basketball) instance_destroy()
	    }
	    obj_mettanchor.velocity.x= 6
	    GS.facing= 0
	    go= 0
	    xx= obj_mainchara.x
	    yy= obj_mainchara.y
	    if(view_xview[0] < round(xx - view_wview[0] / 2 + 10))
	        view_xview[0]+= 5
	    if(view_xview[0] > round(xx - view_wview[0] / 2 + 10))
	        view_xview[0]-= 5
	    if(abs(view_xview[0] - round(xx - view_wview[0] / 2 + 10)) < 6) {
	        view_xview[0]= round(xx - view_wview[0] / 2 + 10)
	        go++
	    }
	    if(view_yview[0] < round(yy - view_hview[0] / 2 + 10))
	        view_yview[0]+= 5
	    if(view_yview[0] > round(yy - view_hview[0] / 2 + 10))
	        view_yview[0]-= 5
	    if(abs(view_yview[0] - round(yy - view_hview[0] / 2 + 10)) < 6) {
	        view_yview[0]= round(yy - view_hview[0] / 2 + 10)
	        go++
	    }
	    if(go == 2) con= 130
	}
	if(con > 129 and quickskip == 0 and is_instance_valid(dog)) {
	    clumber= 0
	    if(obj_mainchara.x > dog.x and dog.x > 300) clumber= 1
	    if(obj_mainchara.x < dog.x and dog.x < 400) clumber= 2
	    if(clumber != 0) {
	        if(clumber == 1) dog.velocity.x= -0.5
	        if(clumber == 2) dog.velocity.x= 0.5
	        dog.sprite_index= 1521/* spr_tobdogl_fire */
	    } else  {
	        dog.velocity.x= 0
	        dog.image_speed= 0.1
	        dog.sprite_index= 1517/* spr_tobdog_sleep_fire */
	    }
	}
	if(con == 130 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_free(-3)
	    GS.mercy= 1
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* Ring.../"
	    GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	    GS.msg[2]= "* D-don\'t worry!/"
	    GS.msg[3]= "\\E6* I installed a&  bomb-defusing program&  on your phone!/"
	    GS.msg[4]= "\\W* Use the \'defuse\' option&  when the bomb is in the&  \\GDEFUSE ZONE\\W!/"
	    GS.msg[5]= "\\E0* N-now^1, go get \'em!/%%"
	    scr_regulartext()
	    con= 131
	    snd_play(104/* snd_phone */)
	}
	if(con == 131 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(quickskip == 0) {
	        // obj_mettanchor
	        with(1223) instance_destroy()
	        newdog= instance_create(dog.x, dog.y, 1225/* obj_mettnews_battleobj */)
	        // obj_mettnews_artifact
	        with(1222) instance_destroy()
	    } else  newdog= instance_create(400, 300, 1225/* obj_mettnews_battleobj */)
	    newwater= instance_create(430, 400, 1225/* obj_mettnews_battleobj */)
	    newwater.bombtype= 2
	    newscript= instance_create(680, 420, 1225/* obj_mettnews_battleobj */)
	    newscript.bombtype= 3
	    newbasketball= instance_create(340, 100, 1225/* obj_mettnews_battleobj */)
	    newbasketball.bombtype= 4
	    newpresent= instance_create(650, 100, 1225/* obj_mettnews_battleobj */)
	    newpresent.bombtype= 5
	    newgame= instance_create(210, 500, 1225/* obj_mettnews_battleobj */)
	    newgame.bombtype= 6
	    newticker= instance_create(view_xview[0], view_yview[0] + 200, 1231/* obj_mettnews_ticker */)
	    newticker.on= 1
	    newticker.doom= 1
	    newticker.voff= 40
	    doomtimer= instance_create(0, 0, 1226/* obj_doomtimer */)
	    obj_mainchara.cutscene= 0
	    view_object[0]= 1570
	    GS.interact= 0
	    GS.currentsong= caster_load("music/news_battle.ogg")
	    caster_loop(GS.currentsong, 1, 1)
	    con= 132
	}
	if(con == 160) {
	    with(doomtimer) instance_destroy()
	    newticker.on= 0
	    newticker.velocity.y= 3
	    GS.interact= 1
	    con= 161
	    instance_create(0, 0, 92/* obj_musfadeout */)
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 161) GS.interact= 1
	if(con == 162) {
	    if(GS.flag[288] == 1) failure= 1
	    if(failure == 1) {
	        instance_create(0, 0, 118/* obj_flasher */)
	        snd_play(30/* snd_break2 */)
	        // obj_mettnews_battleobj
	        with(1225) instance_destroy()
	    }
	    with(newticker) instance_destroy()
	    mett= instance_create(view_xview[0] + 340, view_yview[0] + 70, 1223/* obj_mettanchor */)
	    GS.flag[20]= 8
	    mett.on= 2
	    if(instance_exists(92/* obj_musfadeout */)) {
	        // obj_musfadeout
	        with(92) instance_destroy()
	        caster_free(-3)
	    }
	    GS.currentsong= caster_load("music/mtgameshow.ogg")
	    caster_loop(GS.currentsong, 1, 1)
	    con= 163
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 164) {
	    conner= 0
	    GS.typer= 27
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msc= 0
	    if(failure == 0) {
	        GS.msg[0]= "* WELL DONE^1, DARLING!/"
	        GS.msg[1]= "* YOU\'VE DEACTIVATED ALL OF&  THE BOMBS!/"
	        GS.msg[2]= "\\W* IF YOU DIDN\'T DEACTIVATE&  THEM^1, THE BIG BOMB WOULD&  HAVE EXPLODED IN \\YTWO MINUTES\\W./"
	        GS.msg[3]= "\\W* NOW IT WON\'T EXPLODE&  IN \\YTWO MINUTES\\W!/"
	        GS.msg[4]= "\\W*\\M9 INSTEAD IT\'LL EXPLODE&  IN \\YTWO SECONDS\\W!/"
	        GS.msg[5]= "* GOODBYE^1, DARLING!/%%"
	    }
	    if(failure == 1) {
	        GS.msg[0]= "* TOO BAD^1, DARLING!/"
	        GS.msg[1]= "\\W* YOU FAILED TO DEFUSE ALL&  OF THE BOMBS WITHIN \\YTHREE&  MINUTES\\W!/"
	        GS.msg[2]= "* NOW THE BIG BOMB IS&  GOING TO BLOW YOU TO&  SMITHEREENS!/"
	        GS.msg[3]= "* READY^1, VIEWERS^1?&* HERE COMES THE MOMENT&  YOU\'VE ALL BEEN WAITING FOR!/"
	        GS.msg[4]= "* AHAHAH!/"
	        GS.msg[5]= "* GOODBYE^1, DARLING!/%%"
	    }
	    d= instance_create(0, 0, 779/* obj_dialoguer */)
	    d.side= 1
	    con= 165
	}
	if(con == 165 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 4 and conner == 0) {
	        conner= 1
	        caster_pause(GS.currentsong)
	    }
	    if(OBJ_WRITER.stringno == 5 and conner < 2) {
	        mypitch= 1
	        ohno= caster_load("music/bad.ogg")
	        caster_loop(ohno, 1, 1)
	        conner= 2
	    }
	}
	if(con == 165 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 166
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 167) {
	    mypitch-= 0.015
	    caster_set_volume(ohno, mypitch)
	    caster_set_pitch(ohno, mypitch)
	    if(mypitch < 0.06) {
	        con= 168
	        $Alarm4.start((30) / 30.0)
	        caster_free(ohno)
	    }
	}
	if(con == 169) {
	    conner= 0
	    GS.msg[0]= "\\M8* AH./"
	    GS.msg[1]= "* IT SEEMS THE BOMB ISN\'T&  GOING OFF./"
	    GS.msg[2]= "\\T0* Ring.../"
	    scr_alface(3, 6)
	    GS.msg[4]= "* That\'s b-because!!!/"
	    GS.msg[5]= "* While you were&  monologuing... I...!!!/"
	    GS.msg[6]= "\\E4* I f..^1. fix..^1.&* Um..^1. I ch-change.../"
	    GS.msg[7]= "\\TS \\F0 \\E0 \\TM %"
	    GS.msg[8]= "* OH NO^1.&* YOU DEACTIVATED THE BOMB&  WITH YOUR HACKING SKILLS./"
	    scr_alface(9, 5)
	    GS.msg[10]= "* Yeah^1!&* That\'s what I did!/"
	    GS.msg[11]= "\\TS \\F0 \\E0 \\TM %"
	    GS.msg[12]= "\\M9* CURSES^1!&* IT SEEMS I\'VE BEEN FOILED&  AGAIN!/"
	    GS.msg[13]= "* CURSE YOU^1, HUMAN^1!&* CURSE YOU^1, DR. ALPHYS^1,&  FOR HELPING SO MUCH!/"
	    GS.msg[14]= "\\M8* BUT I DON\'T CURSE MY&  EIGHT WONDERFUL VIEWERS&  FOR TUNING IN!!!/"
	    GS.msg[15]= "* UNTIL NEXT TIME^1, DARLING!/%%"
	    dg= instance_create(0, 0, 779/* obj_dialoguer */)
	    dg.side= 1
	    con= 170
	}
	if(con == 170 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 47
	    mett.velocity.x= 4
	    mett.on= 99
	    GS.facechoice= 6
	    GS.faceemotion= 0
	    if(failure == 0) {
	        GS.msg[0]= "* W-wow..^1.&* W-we really showed&  him^1, huh?/"
	        GS.msg[1]= "\\E2* .../"
	        GS.msg[2]= "\\E4* H-hey^1, I know I was&  kind of weird at&  first.../"
	        GS.msg[3]= "\\E0* But I really think&  I\'m getting more.../"
	        GS.msg[4]= "\\E4* Uh^1, more.../"
	        GS.msg[5]= "\\E6* M-more confident about&  guiding you!/"
	        GS.msg[6]= "\\E0* S-so don\'t worry&  about that b-big&  d-dumb robot.../"
	        GS.msg[7]= "\\E6* I-I\'ll protect you&  from him!/"
	        GS.msg[8]= "\\E3* A-and if it really&  c-came down to it^1,&  we could just t-turn.../"
	        GS.msg[9]= "\\E5* Um^1, nevermind./"
	        GS.msg[10]= "\\E0* Later!/"
	        GS.msg[11]= "\\TS \\F0 \\E0 \\T0 %"
	        GS.msg[12]= "* (Click...)/%%"
	    }
	    if(failure == 1) {
	        GS.faceemotion= 4
	        GS.msg[0]= "* B-boy..^1.&* That was close^1, huh?/"
	        GS.msg[1]= "\\E8* I guess a little&  closer than I would&  have liked./"
	        GS.msg[2]= "\\E9* I should have given&  you better directions.../"
	        GS.msg[3]= "\\E8* A-and there j-just&  w-wasn\'t enough&  time.../"
	        GS.msg[4]= "\\E6* W-well^1!&* That\'s Mettaton\'s fault^1,&  not mine!/"
	        GS.msg[5]= "\\E9* I c-can\'t second&  guess myself now./"
	        GS.msg[6]= "\\E4* I\'m f-finally starting&  to f-feel confident&  about g-guiding you./"
	        GS.msg[7]= "\\E6* I\'ll protect you from&  that mean old robot^1,&  n-no matter what!/"
	        GS.msg[8]= "\\E3* If I have to^1,&  I\'ll even t-turn.../"
	        GS.msg[9]= "\\E5* Um^1, nevermind./"
	        GS.msg[10]= "\\E0* We\'re over halfway&  to the core!/"
	        GS.msg[11]= "* Let\'s go!/"
	        GS.msg[12]= "\\TS \\F0 \\E0 \\T0 %"
	        GS.msg[13]= "* (Click...)/%%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 171
	}
	if(con == 171 and not instance_exists(782/* OBJ_WRITER */)) {
	    flowey= instance_create(40, 300, 1339/* obj_stalkerflowey */)
	    obj_mainchara.cutscene= 0
	    view_object[0]= 1570
	    // obj_mettnews_ticker
	    with(1231) instance_destroy()
	    // obj_mettanchor
	    with(1223) instance_destroy()
	    // obj_kitchenforcefield
	    with(1183) instance_destroy()
	    GS.plot= 161
	    con= 172
	    caster_free(-3)
	    // obj_bluelaser_o
	    with(1281) active= 2
	    GS.interact= 0
	    GS.flag[17]= 0
	    GS.mercy= 0
	    scr_tempsave()
	    instance_destroy()
	}
	if(view_yview[0] <= 0) view_yview[0]= 0

func _on_alarm_0_timeout():
	if(con == 0 and GS.interact == 0) {
	    GS.interact= 1
	    con= 1
	}

func _gm_event_7_11():
	obj_mettnews_part.on= 0
	obj_mettnews_ticker.write= 0
	obj_mettnews_ticker.on= 0
	obj_mettanchor.on= 2
	obj_mettnews_ticker.velocity.y= 6

func _gm_event_7_10():
	xx= view_xview[0]
	yy= view_yview[0]
	part1= instance_create(xx, yy + 20, 1227/* obj_mettnews_part */)
	part1.sprite_index= 1788/* spr_mettbg_part1 */
	part2= instance_create(xx + 93, yy + 20, 1227/* obj_mettnews_part */)
	part2.sprite_index= 1789/* spr_mettbg_part2 */
	part3= instance_create(xx + 93, yy + 67, 1227/* obj_mettnews_part */)
	part3.sprite_index= 1790/* spr_mettbg_part3 */
	part4= instance_create(xx + 221, yy + 20, 1227/* obj_mettnews_part */)
	part4.sprite_index= 1791/* spr_mettbg_part4 */
	floorpart= instance_create(xx, yy + 180, 1227/* obj_mettnews_part */)
	floorpart.sprite_index= 1793/* spr_mettnewsfloor */
	logo= instance_create(xx + 60, yy + 20, 1227/* obj_mettnews_part */)
	logo.sprite_index= 1794/* spr_mettnewslogo */
	scaff= instance_create(xx, yy, 1227/* obj_mettnews_part */)
	scaff.sprite_index= 1786/* spr_scaffoldingplaceholder */
	obj_mettnews_part.z_index= 200
	mett= instance_create(xx + 236, yy + 160 - 33, 1223/* obj_mettanchor */)
	mett.z_index= 170
	counter= instance_create(xx + 200, yy + 160, 1227/* obj_mettnews_part */)
	counter.sprite_index= 1792/* spr_mettnewscounter */
	counter.z_index= 180
	ticker= instance_create(xx, yy + 200, 1231/* obj_mettnews_ticker */)

func _on_outside_room():
	if(con < 4) {
	    z_index= obj_mainchara.z_index + 1000
	    draw_set_color(0)
	    draw_rectangle(-1, -1, 400, 500, 0)
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
