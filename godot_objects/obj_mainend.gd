# Auto-converted from GameMaker: obj_mainend
extends Node2D

func _ready():
	con= 1
	mc= instance_create(120, 20, 1570/* obj_mainchara */)
	mc.visible= 0
	q= 20
	if(GS.flag[45] != 4 and GS.flag[67] <= 0 and GS.flag[350] != 1 and GS.kills < 10)
	    q= 0
	if(GS.flag[45] != 4 and GS.kills >= 10) q= 1
	if(GS.flag[45] != 4 and (GS.flag[67] == 1 or GS.flag[350] == 1))
	    q= 1
	if(GS.flag[45] == 4 and GS.flag[350] != 1) q= 2
	if(GS.flag[45] == 4 and GS.flag[350] == 1 and GS.flag[425] == 0)
	    q= 3
	if(GS.flag[45] == 4 and GS.flag[350] == 1 and GS.flag[425] == 1 and GS.flag[67] != 1)
	    q= 4
	if(GS.flag[45] == 4 and GS.flag[350] == 1 and GS.flag[425] == 1 and GS.flag[67] == 1)
	    q= 5
	if(GS.flag[45] == 4 and GS.flag[350] == 1 and GS.flag[425] == 1 and GS.flag[67] == 1 and GS.kills == 4)
	    q= 6
	if(scr_murderlv() >= 12 and GS.flag[425] == 1) q= 7
	if(q == 0 or q == 1 or q == 2 or q == 4)
	    GS.currentsong= caster_load("music/z_ending.ogg")
	if(q == 3) GS.currentsong= caster_load("music/mtgameshow.ogg")
	if(q == 5) GS.currentsong= caster_load("music/wind.ogg")
	if(q == 6 or q == 20)
	    GS.currentsong= caster_load("music/dogsong.ogg")
	GS.interact= 1
	musiccon= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 0) {
	    con= 1
	    snd_play(104/* snd_phone */)
	}
	if(con == 1) {
	    GS.faceemotion= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.msc= 0
	    GS.msg[0]= "* (Ring^1, ring...)/"
	    scr_sansface(1, 0)
	    GS.msg[2]= "* heya./"
	    GS.msg[3]= "\\E1* is anyone there...?/"
	    GS.msg[4]= "\\E2* well^1, i\'ll just leave&  a message.../%%"
	    scr_itemcheck(16)
	    if(haveit == 1 and GS.flag[67] != 1) {
	        GS.msg[3]= "\\E1* is anyone there...?/"
	        GS.msg[4]= "\\E2* well..^1. just calling&  to say./"
	        GS.msg[5]= "\\E1* you made a snowman&  really happy./"
	        GS.msg[6]= "\\E2* ... guess i should&  say something else^1,&  too./%%"
	    }
	    if(not file_exists("file0") and GS.flag[67] != 1) {
	        GS.msg[2]= "* heya./"
	        GS.msg[4]= "\\E2* well..^1. just calling&  to say./"
	        GS.msg[5]= "\\E1* it\'s been a while^1.&* shouldn\'t you SAVE?/"
	        GS.msg[6]= "\\E2* ... guess i should&  say something else^1,&  too./%%"
	    }
	    if(GS.armor == 4 and GS.flag[67] != 1) {
	        GS.msg[3]= "\\E1* is anyone there...?/"
	        GS.msg[4]= "\\E2* well..^1. just calling&  to ask./"
	        GS.msg[5]= "\\E1* did you ever take&  off that gross&  bandage...?/"
	        GS.msg[6]= "\\E2* ... guess i should&  say something else^1,&  too./%%"
	    }
	    if(GS.flag[260] == 0 and GS.flag[67] != 1) {
	        GS.msg[3]= "\\E1* is anyone there...?/"
	        GS.msg[4]= "\\E2* well..^1. just calling&  to ask./"
	        GS.msg[5]= "\\E1* did you ever get&  something to eat?/"
	        GS.msg[6]= "\\E2* ... guess i should&  say something else^1,&  too./%%"
	    }
	    if(GS.flag[260] == 0 and GS.lv == 1 and GS.armor == 4 and GS.flag[67] != 1) {
	        GS.msg[3]= "\\E1* is anyone there...?/"
	        GS.msg[4]= "\\E2* well..^1. just calling&  to ask./"
	        GS.msg[5]= "\\E1* you really like to&  challenge yourself^1,&  huh...?/"
	        GS.msg[6]= "\\E2* well..^1. good job^1./"
	        GS.msg[7]= "\\E1* just promise not to&  brag about it^1,&  okay?/"
	        GS.msg[8]= "\\E2* ... guess i should&  say something else^1,&  too./%%"
	    }
	    if(q == 7) {
	        GS.msg[2]= "* .../"
	        GS.msg[3]= "* alright^1, i\'ve got the&  number./%%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 2
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(q != 3 and q != 7) caster_loop(GS.currentsong, 1, 1)
	    $Alarm4.start((60) / 30.0)
	    if(q == 0) con= 3
	    if(q == 1) con= 20
	    if(q == 2) con= 30
	    if(q == 3) con= 40
	    if(q == 4) con= 50
	    if(q == 5) con= 60
	    if(q == 6) con= 70
	    if(q == 7) con= 90
	    if(q == 20) con= 80
	}
	if(con == 4) {
	    GS.facechoice= 3
	    GS.faceemotion= 3
	    GS.msg[0]= "* so..^1.&* it\'s been a while./"
	    GS.msg[1]= "\\E0* the queen returned^1, and&  is now ruling over&  the underground./"
	    GS.msg[2]= "* she\'s enstated a new&  policy.../"
	    GS.msg[3]= "\\E3* all the humans who fall&  here will be treated&  not as enemies.../"
	    GS.msg[4]= "\\E0* but as friends./"
	    GS.msg[5]= "\\E1* it\'s probably for the&  best^1, anyway./"
	    GS.msg[6]= "\\E0* the human souls the king&  gathered.../"
	    GS.msg[7]= "\\E3* seem to have&  disappeared./"
	    GS.msg[8]= "\\E1* so^1, uh^1, that plan&  ain\'t happening any&  time soon./"
	    GS.msg[9]= "* but even though people&  are heartbroken over&  the king.../"
	    GS.msg[10]= "\\E1* ... and things are&  looking grim for our&  freedom.../"
	    GS.msg[11]= "\\E0* the queen\'s trying her&  best not to let us&  give up hope./"
	    GS.msg[12]= "\\E1* so^1, uh^1, hey.../"
	    GS.msg[13]= "\\E1* if we\'re not giving&  up down here.../"
	    GS.msg[14]= "\\E2* don\'t give up wherever&  you are^1, ok?/"
	    GS.msg[15]= "\\E3* who knows how long&  it will take.../"
	    GS.msg[16]= "\\E0* but we will get out&  of here./"
	    GS.msg[17]= "\\E2* that\'s a promise./"
	    scr_papface(17, 1)
	    GS.msg[18]= "SANS!!!&WHO ARE YOU&TALKING TO???/"
	    scr_sansface(19, 2)
	    GS.msg[20]= "* oh^1, nobody./"
	    scr_papface(21, 1)
	    GS.msg[22]= "WHAT!^1?&NOBODY!?/"
	    GS.msg[23]= "\\E0CAN I TALK TO&THEM TOO???/"
	    scr_sansface(24, 1)
	    GS.msg[25]= "* here^1, knock yourself&  out./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 5
	}
	if(con == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 6
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 3
	    GS.msg[0]= "WAIT A SECOND.../"
	    GS.msg[1]= "\\E1I RECOGNIZE THIS&NUMBER!!!/"
	    GS.msg[2]= "\\E0ATTENTION^1, HUMAN!/"
	    GS.msg[3]= "\\E2I^1, THE GREAT&PAPYRUS.../"
	    GS.msg[4]= "\\E0AM NOW CAPTAIN OF&THE ROYAL GUARD!/"
	    GS.msg[5]= "\\E2IT\'S EVERYTHING I\'VE&EVER DREAMED OF.../"
	    GS.msg[6]= "\\E3EXCEPT^1, INSTEAD&OF FIGHTING^1, WE&JUST WATER FLOWERS./"
	    GS.msg[7]= "\\E0SO THAT\'S EVER-&SO-SLIGHTLY&DIFFERENT./"
	    GS.msg[8]= "\\E0AND^1, WE\'RE HELPING&DR. ALPHYS&WITH HER RESEARCH!/"
	    GS.msg[9]= "\\E0SHE\'S GONNA FIND A&WAY TO GET US OUT&OF HERE./"
	    GS.msg[10]= "UNDYNE IS HELPING&HER TOO!/"
	    GS.msg[11]= "\\E3THOUGH^1, TO BE&HONEST^1, HER METHOD&OF HELPING.../"
	    GS.msg[12]= "\\E2SEEMS KIND OF.../"
	    GS.msg[13]= "\\E3EXPLOSION-INDUCING./"
	    GS.msg[14]= "\\E0BUT I THINK ALPHYS&LIKES HAVING HER&AROUND./"
	    GS.msg[15]= "\\E5UH OH!!!/%%"
	    if(GS.flag[389] <= 3 or GS.kills > 0) {
	        GS.msg[2]= "\\E0HEY!!^1! HUMAN!!!/"
	        GS.msg[3]= "HOW ARE YOU DOING^1?&I\'M DOING FINE!!!/"
	        GS.msg[4]= "\\E3WELL, BESIDES ONE&THING.../"
	        GS.msg[5]= "\\E3THE QUEEN&DISBANDED THE&ROYAL GUARD./"
	        GS.msg[6]= "SINCE WE DON\'T&HAVE TO FIGHT&HUMANS ANYMORE./"
	        GS.msg[7]= "\\E0WOW!!!/"
	        GS.msg[8]= "\\E3I HAVE NO IDEA&WHAT TO DO&WITH MY LIFE./"
	        GS.msg[9]= "\\E0BUT^1, THAT\'S&OKAY!/"
	        GS.msg[10]= "BECAUSE I\'M&STILL WORKING&HARD!/"
	        GS.msg[11]= "\\E4EVEN IF IT\'S&ON NOTHING AT&ALL!/"
	        GS.msg[12]= "\\E0SO DON\'T FEEL&BAD!/"
	        GS.msg[13]= "PAPYRUS IS FINE!/"
	        GS.msg[14]= "\\E5UNDYNE IS THE&ONE THAT\'S GOT&IT BAD!/"
	        GS.msg[15]= "\\E3SHE LOST HER&JOB.../"
	        GS.msg[16]= "THEN SHE LOST&HER HOUSE.../"
	        GS.msg[17]= "\\E2IT WAS SAD..^1.&BUT WE\'RE TAKING&CARE OF HER!/"
	        GS.msg[18]= "\\E0SHE LIVES ON&OUR COUCH NOW./"
	        GS.msg[19]= "IT\'S LIKE A&SLEEPOVER EVERY&NIGHT!/"
	        GS.msg[20]= "A SLEEPOVER&THERE\'S NO&ESCAPE FROM./"
	        GS.msg[21]= "OH^1, WE GAVE HER&A JOB^1, TOO./"
	        GS.msg[22]= "\\E3SANS HIRED HER AT&HIS ILLEGAL HOT&DOG STAND./"
	        GS.msg[23]= "\\E5SHE HATES WORKING&THERE!/"
	        GS.msg[24]= "\\E3BUT SHE MAKES&A MEAN HOT DOG./"
	        GS.msg[25]= "\\E3.../"
	        GS.msg[26]= "\\E5OH YEAH./"
	        if(GS.kills >= 1 and GS.flag[389] > 0) {
	            GS.msg[27]= "I DON\'T KNOW HOW&TO PUT THIS^1,&BUT.../"
	            GS.msg[28]= "\\E3SHE^1, UM^1, REALLY&HATES YOU NOW./"
	            GS.msg[29]= "\\E6EVEN MORE THAN&SHE EVER HAS./"
	            GS.msg[30]= "IT\'S BECAUSE SHE&MADE FRIENDS WITH&YOU^1, THEN.../"
	            GS.msg[31]= "\\E5SHE SAID YOU&KILLED SOMEONE?/"
	            GS.msg[32]= "\\E3I KNOW^1, THAT&SOUNDS RIDICULOUS&DOESN\'T IT?/"
	            GS.msg[33]= "\\E6BUT SHE FEELS SO&HURT AND BETRAYED./"
	            GS.msg[34]= "AND ANGRY AT&HERSELF^1, TOO./"
	            GS.msg[35]= "SHE SAYS.../"
	            GS.msg[36]= "SHE DOESN\'T&UNDERSTAND WHY.../"
	            GS.msg[37]= "SHE EVER LET&HERSELF BECOME&FRIENDS WITH YOU./"
	            GS.msg[38]= "THAT SHE KNEW&WHAT HUMANS WERE&LIKE.../"
	            GS.msg[39]= "\\E3AND YET SHE&STILL FAILED TO&RESIST./"
	            GS.msg[40]= "\\E6MORE PEOPLE GOT&HURT BECAUSE OF&HER MISTAKE./"
	            GS.msg[41]= "\\E5I REALLY CAN\'T&UNDERSTATE./"
	            GS.msg[42]= "HOW MUCH SHE&HATES YOU./"
	            GS.msg[43]= "\\E6IT PAINS ME TO&SAY THIS^1, BUT.../"
	            GS.msg[44]= "YOU SHOULD&PROBABLY NEVER&COME BACK HERE./"
	            GS.msg[45]= "\\E3IF YOU DO^1, UNDYNE&WILL DEFINITELY&DESTROY YOU./"
	            GS.msg[46]= "\\E5NOT EVEN THE QUEEN&CAN STOP HER./"
	            GS.msg[47]= "\\E6SO^1, UH..^1.&GOODBYE FOREVER./"
	            GS.msg[48]= "I\'LL MISS YOU^1,&MY FRIEND./%%"
	            if(GS.flag[425] == 1) {
	                GS.msg[32]= "\\E5AND YOU MADE&ASGORE DISAPPEAR?/"
	                GS.msg[33]= "\\E3AND MADE ALPHYS&DISAPPEAR^1, TOO./"
	                GS.msg[34]= "\\E6SHE\'S NOT VERY&HAPPY./"
	                GS.msg[35]= "SHE SAYS THINGS&LIKE.../"
	                GS.msg[36]= "" + chr(ord('"')) + "I COULDN\'T PROTECT&HER.../" + chr(ord('"')) + ""
	                GS.msg[37]= "IT\'S HARD TO GET&HER TO DO ANYTHING&NOW./"
	                GS.msg[38]= "\\E5I EVEN SUGGESTED&WE TRY TO GET&REVENGE ON YOU./"
	                GS.msg[39]= "\\E0YOU KNOW^1, SO I&COULD SEE YOU&AGAIN./"
	                GS.msg[40]= "\\E5BUT SHE JUST&LOOKED AT ME AND&SAID.../"
	                GS.msg[41]= "\\E6REVENGE WON\'T BRING&ANYBODY BACK./"
	                GS.msg[42]= "\\E3I HAVE NO IDEA&WHAT YOU DID^1,&BUT.../"
	                GS.msg[43]= "\\E5CAN YOU PLEASE&BRING BACK HER&FRIENDS?/"
	                GS.msg[44]= "IF YOU MADE THEM&DISAPPEAR?/"
	                GS.msg[45]= "\\E6PLEASE.../"
	                GS.msg[46]= "UNDYNE\'S NOT&DOING VERY WELL./"
	                GS.msg[47]= "BYE./%%"
	            }
	        } else  {
	            GS.msg[27]= "\\E3SHE STILL BLAMES&YOU.../"
	            GS.msg[28]= "\\E3FOR THE&DISAPPEARANCE&OF ASGORE./"
	            GS.msg[29]= "\\E3.../"
	            GS.msg[30]= "\\E3SHE TALKS TO ME&A LOT.../"
	            GS.msg[31]= "\\E5ABOUT GETTING&REVENGE ON YOU./"
	            GS.msg[32]= "SHE HAS A&LUDICROUS PLAN.../"
	            GS.msg[33]= "TO CROSS THE&BARRIER AND&BEAT YOU UP./"
	            GS.msg[34]= "\\E3TO BE HONEST^1,&I THINK IT\'S&IMPOSSIBLE./"
	            GS.msg[35]= "\\E0BUT I\'D LIKE TO&BELIEVE IT\'S&NOT!!!/"
	            GS.msg[36]= "CAUSE I WANT TO&GO WITH HER!/"
	            GS.msg[37]= "THEN I\'D GET TO&SEE YOU AGAIN!/"
	            GS.msg[38]= "\\E3EVEN IF I\'D HAVE&TO FIGHT YOU./"
	            GS.msg[39]= "\\E0WELL^1, KEEP YOUR&FINGERS CROSSED!/"
	            GS.msg[40]= "AND KEEP IN&TOUCH.../"
	            GS.msg[41]= "IT\'LL MAKE OUR&PLANS EASIER./"
	            GS.msg[42]= "BYE!/%%"
	            if(GS.flag[425] == 1) {
	                GS.msg[29]= "\\E5AND ALPHYS\'&DISAPPEARANCE^1, TOO./"
	                GS.msg[30]= "\\E3SHE\'S NOT VERY&HAPPY./"
	                GS.msg[31]= "\\E6SHE SAYS THINGS&LIKE.../"
	                GS.msg[32]= "" + chr(ord('"')) + "I COULDN\'T PROTECT&HER.../" + chr(ord('"')) + ""
	                GS.msg[33]= "IT\'S HARD TO GET&HER TO DO ANYTHING&NOW./"
	                GS.msg[34]= "\\E5I EVEN SUGGESTED&WE TRY TO GET&REVENGE ON YOU./"
	                GS.msg[35]= "\\E0YOU KNOW^1, SO I&COULD SEE YOU&AGAIN./"
	                GS.msg[36]= "\\E3BUT SHE JUST&LOOKED AT ME AND&SAID.../"
	                GS.msg[37]= "\\E6REVENGE WON\'T BRING&ANYBODY BACK./"
	                GS.msg[38]= "I HAVE NO IDEA&WHAT YOU DID^1,&BUT.../"
	                GS.msg[39]= "\\E5CAN YOU PLEASE&BRING BACK HER&FRIENDS?/"
	                GS.msg[40]= "IF YOU MADE THEM&DISAPPEAR?/"
	                GS.msg[41]= "\\E6PLEASE.../"
	                GS.msg[42]= "UNDYNE\'S NOT&DOING VERY WELL./"
	                GS.msg[43]= "BYE./%%"
	            }
	        }
	        con= 8
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 6 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.flag[430]= 0
	    con= 8
	    GS.typer= 37
	    GS.facechoice= 5
	    GS.faceemotion= 2
	    GS.msg[0]= "* Hey^1!&* What are you up&  to^1, punk!?/"
	    GS.msg[1]= "\\E1* Ngahhhh!/"
	    scr_papface(2, 5)
	    GS.msg[3]= "PLEASE DON\'T NOOGIE&THE PHONE./"
	    scr_undface(4, 3)
	    GS.msg[5]= "\\E2* Hey^1!&* Who\'s in charge&  here!?/"
	    scr_papface(6, 5)
	    GS.msg[7]= "ME./"
	    scr_undface(8, 6)
	    GS.msg[9]= "* Oh..^1. yeah^1, that\'s&  right!/"
	    GS.msg[10]= "\\E0* I quit my job as&  leader of the Royal&  Guard./"
	    GS.msg[11]= "\\E4* Actually^1, since we&  won\'t be fighting&  anymore.../"
	    GS.msg[12]= "\\E1* The Royal Guard&  totally disbanded./"
	    GS.msg[13]= "\\E9* There\'s^1, uh^1, only&  one member now./"
	    scr_papface(14, 0)
	    GS.msg[15]= "BUT HE\'S EXTREMELY&GOOD./"
	    scr_undface(16, 6)
	    GS.msg[17]= "* Yeah!^1! He is!!^1!&* C\'mere!!/"
	    scr_papface(18, 5)
	    GS.msg[19]= "PLEASE DON\'T NOOGIE&THE SKELETON./"
	    scr_undface(20, 9)
	    GS.msg[21]= "* Anyways^1, now I\'m&  working as Alphy\'s&  lab assistant.../"
	    GS.msg[22]= "\\E2* We\'re gonna find a&  way out of this dump&  once and for all!!/"
	    GS.msg[23]= "\\E9* Oh^1, yeah^1, and I\'m a&  gym teacher at the&  queen\'s new school./"
	    GS.msg[24]= "\\E6* Did you know I can&  bench-press seven&  children!?/"
	    GS.msg[25]= "\\E9* Awesome^1, right?/"
	    GS.msg[26]= "* .../"
	    GS.msg[27]= "\\E0* Hey./"
	    GS.msg[28]= "\\E4* I\'m sorry about what&  happened with ASGORE./"
	    GS.msg[29]= "\\E4* You were just doing&  what you had to./"
	    GS.msg[30]= "* It\'s not your fault&  he.../"
	    GS.msg[31]= "* .../"
	    GS.msg[32]= "\\E7* Ah^1, darn it./"
	    GS.msg[33]= "* I miss the big guy./"
	    GS.msg[34]= "\\E7* .../"
	    GS.msg[35]= "\\E1* Come on^1, Undyne^1!&* Snap out of it!/"
	    GS.msg[36]= "\\E4* Uh^1, I guess I\'ll&  tell you how Alphys&  is doing./"
	    GS.msg[37]= "\\E0* Well^1, she\'s the&  same as ever./"
	    GS.msg[38]= "\\E4* Maybe a little more&  reclusive than&  normal./"
	    GS.msg[39]= "\\E7* Seems like something\'s&  really bothering&  her.../"
	    GS.msg[40]= "\\E1* But she can get&  through it!/"
	    GS.msg[41]= "\\E2* I\'m there supporting&  her!!/"
	    GS.msg[42]= "\\E9* That\'s what friends&  are for^1, right?/"
	    GS.msg[43]= "\\E9* .../"
	    GS.msg[44]= "\\E0* Hey^1, where-ever you&  are.../"
	    GS.msg[45]= "\\E4* I hope it\'s better&  than here./"
	    GS.msg[46]= "\\E7* It took a lot of&  sacrifice for you&  to get there.../"
	    GS.msg[47]= "* So^1, where-ever you&  are.../"
	    GS.msg[48]= "\\E6* You have to try to&  be happy^1, okay!?/"
	    GS.msg[49]= "\\E2* For our sakes!/"
	    GS.msg[50]= "\\E0* We\'ll feel better&  knowing our trouble&  was worth it./"
	    GS.msg[51]= "\\E9* We\'re all with you^1!&* Everyone is^1!&* Even the queen!/"
	    GS.msg[52]= "\\E1* .../"
	    GS.msg[53]= "\\E2* HEYYY^1!&* WAIT a second!/"
	    GS.msg[54]= "\\E6* TORIEL^1!&* TORIEL^1!&* Do you wanna...?/"
	    GS.msg[55]= "\\E1* .../"
	    GS.msg[56]= "\\E9* Heh^1, she says&  she\'s busy./"
	    scr_papface(57, 0)
	    GS.msg[58]= "BUT IF SHE KNEW&WHO WE WERE&TALKING TO.../"
	    scr_sansface(59, 2)
	    GS.msg[60]= "* we wouldn\'t get the&  phone back for at&  least a few hours./"
	    scr_papface(61, 0)
	    GS.msg[62]= "WE HAVE THE&MERCY TO SPARE&YOU FROM HER!!/"
	    scr_undface(63, 9)
	    GS.msg[64]= "* But call back any&  time^1, ok?!&* She\'d love to talk!/"
	    scr_sansface(65, 2)
	    GS.msg[66]= "* oh^1, whoops./"
	    GS.msg[67]= "\\E0* this thing\'s almost&  outta batteries./"
	    GS.msg[68]= "\\E1* so^1, hate to cut this&  short^1, but.../"
	    GS.msg[69]= "\\E2* be seeing you^1, ok^1,&  buddy?/"
	    scr_papface(70, 0)
	    GS.msg[71]= "BYE BYE FOR NOW!/"
	    scr_undface(72, 2)
	    GS.msg[73]= "* See ya^1, punk!/%%"
	    if(GS.flag[493] >= 10) {
	        scr_alface(34, 3)
	        GS.msg[35]= "* H-hey^1, Undyne^1, are&  you okay...?/"
	        scr_undface(36, 9)
	        GS.msg[37]= "* I\'m fine^1.&* Why don\'t you talk&  for a while?/"
	        scr_alface(38, 3)
	        GS.msg[39]= "* U..^1. uh^1, okay!/%%"
	        con= 7
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.flag[430]= 0
	    con= 8
	    GS.typer= 47
	    GS.facechoice= 6
	    GS.faceemotion= 0
	    GS.msg[0]= "* Man^1, she\'s tsundere.../"
	    GS.msg[1]= "\\E1* .../"
	    GS.msg[2]= "\\E2* .../"
	    GS.msg[3]= "\\E7* Um^1, hi.../"
	    GS.msg[4]= "\\E4* S-sorry^1, I hate&  talking on the&  phone./"
	    GS.msg[5]= "\\E3* I don\'t really know&  what to say./"
	    GS.msg[6]= "\\E1* .../"
	    GS.msg[7]= "\\E7* Hey^1, why didn\'t you&  tell me the queen&  was so cute?/"
	    GS.msg[8]= "\\E3* Uh^1, I mean^1, uh.../"
	    GS.msg[9]= "\\E6* Mettaton\'s doing OK!/"
	    GS.msg[10]= "* And^1! Um!/"
	    GS.msg[11]= "\\E6* I\'m trying to figure&  a way for us to&  get out of here!/"
	    GS.msg[12]= "\\E4* B-but I kinda have&  no idea what I\'m&  doing./"
	    GS.msg[13]= "\\E0* I\'ll figure it out&  eventually^1, though./"
	    GS.msg[14]= "\\E3* The queen is a lot&  different from&  ASGORE.../"
	    GS.msg[15]= "\\E7* She actually checks to&  see if I\'m doing&  anything./"
	    GS.msg[16]= "\\E0* She\'s really turned&  this whole place&  around!/"
	    GS.msg[17]= "\\E2* .../"
	    GS.msg[18]= "\\E3* Oh^1!&* Hey^1!&* Wait a second!/"
	    GS.msg[19]= "\\E0* Hey^1! TORIEL^1!&* Do you wanna talk&  to...?/"
	    GS.msg[20]= "\\E1* .../"
	    GS.msg[21]= "\\E0* Well^1, she says she\'s&  busy./"
	    scr_undface(22, 6)
	    GS.msg[23]= "* Oh^1, she SAYS she\'s&  busy./"
	    scr_papface(24, 0)
	    GS.msg[25]= "IF SHE KNEW WHO&WE WERE TALKING&TO.../"
	    scr_sansface(26, 2)
	    GS.msg[27]= "* we wouldn\'t get the&  phone back for at&  least a few hours./"
	    scr_papface(28, 0)
	    GS.msg[29]= "WE HAVE THE&MERCY TO SPARE&YOU FROM HER!!/"
	    scr_alface(30, 3)
	    GS.msg[31]= "* B-but^1, if you want&  to^1, call and talk&  to her any time./"
	    scr_undface(32, 9)
	    GS.msg[33]= "* Yeah^1!&* She\'d be happy to&  hear from ya!/"
	    scr_sansface(34, 2)
	    GS.msg[35]= "* oh^1, whoops./"
	    GS.msg[36]= "\\E0* this thing\'s almost&  outta batteries./"
	    GS.msg[37]= "\\E1* so^1, hate to cut this&  short^1, but.../"
	    GS.msg[38]= "\\E2* be seeing you^1, ok^1,&  buddy?/"
	    scr_papface(39, 0)
	    GS.msg[40]= "BYE BYE FOR NOW!/"
	    scr_undface(41, 9)
	    GS.msg[42]= "* See ya^1, punk!/"
	    scr_alface(43, 3)
	    GS.msg[44]= "* G-good..^1.&* Good.../"
	    GS.msg[45]= "\\E4* Hey^1, why do I&  have to be the one&  to hang up?/"
	    GS.msg[46]= "\\E7* Eheheh..^1.&* I hate goodbyes.../"
	    GS.msg[47]= "\\E3* Um^1, we\'ll see you&  again someday!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 8 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 9
	    mf= instance_create(0, 0, 92/* obj_musfadeout */)
	    mf.fadespeed= 0.02
	    GS.typer= 5
	    GS.faceemotion= 0
	    GS.facechoice= 0
	    GS.msg[0]= "* (Click...)/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 9 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 10
	    $Alarm4.start((150) / 30.0)
	}
	if(con == 11) {
	    ini_open("undertale.ini")
	    K= ini_read_real("Flowey", "K", 0)
	    SPECIALK= ini_read_real("Flowey", "SPECIALK", 0)
	    ini_close()
	    if(K > 0 or SPECIALK > 0) GS.flag[475]= 1
	    if(GS.flag[475] == 0) {
	        instance_create(0, 0, 135/* obj_endflowey */)
	        con= 14
	        instance_destroy()
	    } else  game_restart()
	}
	if(con == 21 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.facechoice= 3
	    GS.faceemotion= 3
	    GS.msg[0]= "* so..^1.&* it\'s been a while./"
	    GS.msg[1]= "\\E0* the queen returned^1, and&  attempted to resume&  ruling the underground./"
	    GS.msg[2]= "* she enstated a new&  policy.../"
	    GS.msg[3]= "\\E3* all the humans who fall&  here would be treated&  not as enemies.../"
	    GS.msg[4]= "\\E0* but as friends./"
	    GS.msg[5]= "\\E3* .../"
	    GS.msg[6]= "\\E1* but people REALLY&  didn\'t like that&  policy./"
	    GS.msg[7]= "\\E0* because of you^1, not&  only was the king&  gone.../"
	    GS.msg[8]= "\\E3* but the human souls&  had gone missing as&  well.../"
	    GS.msg[9]= "* along with the lives&  of countless citizens./"
	    if(GS.flag[67] == 1) GS.msg[9]= "* along with the life&  of.../"
	    if(GS.flag[350] == 1)
	        GS.msg[9]= "* along with the life&  of undyne^1, their&  greatest hero./"
	    if(GS.kills >= 10)
	        GS.msg[9]= "* along with the lives&  of countless citizens./"
	    GS.msg[10]= "* nobody wanted to see&  that happen ever again./"
	    GS.msg[11]= "\\E0* so the people started&  a rebellion to&  overthrow the queen./"
	    GS.msg[12]= "\\E2* but^1, she^1, uh^1, pretty&  much gave up peacefully&  when she realized./"
	    GS.msg[13]= "\\E1* so she went back&  to the ruins./"
	    GS.msg[14]= "\\E0* the underground\'s&  basically an uneasy&  anarchy now./"
	    GS.msg[15]= "\\E0* everyone\'s trying to&  live life like they&  always have.../"
	    GS.msg[16]= "\\E3* but it\'s not really&  easy^1, you know?/"
	    GS.msg[17]= "* when all of your&  hope has pretty much&  been thrown away.../%%"
	    GS.msg[18]= "* .../%%"
	    if(GS.flag[350] != 1) {
	        GS.msg[12]= "\\E1* undyne spearheaded&  the revolution^1, of&  course./"
	        if(GS.flag[425] == 0)
	            GS.msg[13]= "\\E3* she was pretty mad&  after what happened&  to asgore./"
	        else 
	            GS.msg[13]= "\\E3* she was pretty mad&  after what happened&  to asgore and alphys./"
	        GS.msg[14]= "\\E1* she threw the queen&  out of the castle&  with her strength./"
	        GS.msg[15]= "\\E0* then she became the&  empress of the&  underground.../"
	        GS.msg[16]= "* and banished the&  queen back to the&  ruins./"
	        GS.msg[17]= "\\E1* seems like undyne\'s..^1.&* hmmm.../"
	        GS.msg[18]= "\\E3* even more vehement&  about destroying&  humanity than ASGORE./"
	        GS.msg[19]= "\\E1* .../%%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 22
	}
	if(con == 22 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(GS.flag[67] != 1) {
	        con= 8
	        GS.msg[0]= "\\E2* but hey^1!&* it\'s not all bad!/"
	        GS.msg[1]= "\\E0* she\'s not so lonely&  anymore./"
	        GS.msg[2]= "\\E1* me and papyrus go&  and visit her.../"
	        GS.msg[3]= "\\E0* we bring her books&  from the library^1,&  or play games.../"
	        GS.msg[4]= "\\E2* we\'ve even convinced&  her to leave&  sometimes./"
	        GS.msg[5]= "\\E1* as long as me or&  papyrus stay behind&  to watch for humans./"
	        GS.msg[6]= "\\E2* but papyrus loves&  doing that./"
	        scr_papface(7, 0)
	        GS.msg[8]= "YEAH!!^1!&I LOVE STANDING IN&FOR THE QUEEN!!!/"
	        GS.msg[9]= "I\'VE BEEN PRACTICING&FOR WHEN A HUMAN&COMES./"
	        GS.msg[10]= "I\'M GOING TO BE&A GREAT MOM!!!/"
	        GS.msg[11]= "\\E3BY THE WAY^1,&WHO ARE YOU&TALKING TO?/"
	        scr_sansface(12, 2)
	        GS.msg[13]= "* oh^1, nobody./"
	        scr_papface(14, 0)
	        GS.msg[15]= "OH, COOL^1.&TELL THEM I SAY&HI!!!/"
	        scr_sansface(16, 1)
	        GS.msg[17]= "* papyrus says hi./"
	        GS.msg[18]= "\\E0* well^1, i hope things&  are better where&  you are./"
	        GS.msg[19]= "\\E2* later./%%"
	    } else  {
	        con= 23
	        GS.msg[0]= "\\E2* but hey^1!&* it\'s not all bad!/"
	        GS.msg[1]= "\\E1* when the queen went&  back to the ruins.../"
	        GS.msg[2]= "\\E2* i decided to go&  with her./"
	        GS.msg[3]= "\\E1* and i took out some&  books from the&  library^1, too./"
	        GS.msg[4]= "\\E1* so she won\'t have&  to read the same&  ones./"
	        GS.msg[5]= "\\E0* she\'s a good roomie^1.&* we have a lot of&  fun./"
	        GS.msg[6]= "\\E1* .../"
	        GS.msg[7]= "\\E1* you know./"
	        GS.msg[8]= "\\E1* sometimes the queen&  talks about.../"
	        GS.msg[9]= "\\E0* how she\'d like to&  see you again./"
	        GS.msg[10]= "\\E1* isn\'t that nice?/"
	        GS.msg[11]= "\\E3* .../"
	        GS.msg[12]= "\\E3* i don\'t have the&  heart to tell her&  what you did./"
	        GS.msg[13]= "\\E0* do you know how she\'d&  react?/"
	        GS.msg[14]= "\\E3* if i told her that&  \'cause she protected&  you.../"
	        GS.msg[15]= "\\E4* ... you went on to&  kill my brother...?/"
	        GS.msg[16]= "\\E3* .../"
	        GS.msg[17]= "\\E1* anyway^1, never come&  back here./"
	        GS.msg[18]= "\\E0* you are not welcome./"
	        GS.msg[19]= "\\E2* later./%%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 23 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 14)
	    caster_stop(GS.currentsong)
	if(con == 23 and not instance_exists(782/* OBJ_WRITER */)) con= 8
	if(con == 31 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.facechoice= 3
	    GS.faceemotion= 1
	    con= 8
	    GS.msg[0]= "* since you left^1,&  things down here.../"
	    GS.msg[1]= "\\E3* are different./"
	    GS.msg[2]= "* with ASGORE gone.../"
	    GS.msg[3]= "\\E0* undyne became the&  ruler of the&  underground./"
	    GS.msg[4]= "\\E3* she\'s decided to&  destroy every human&  that comes here./"
	    GS.msg[5]= "\\E3* and since the human&  souls disappeared.../"
	    GS.msg[6]= "\\E0* she\'s also looking&  for a new way to&  break the barrier.../"
	    GS.msg[7]= "* and when she does^1,&  she\'s going to wage&  war on humanity./"
	    GS.msg[8]= "\\E1* i mean^1, that was&  asgore\'s plan^1, too./"
	    GS.msg[9]= "\\E2* but he was really^1,&  uh^1, bad at it./"
	    GS.msg[10]= "\\E0* undyne has also&  expanded the royal&  guard massively./"
	    GS.msg[11]= "* she says the first&  thing she\'ll do after&  we get out of here.../"
	    GS.msg[12]= "* is take her army.../"
	    GS.msg[13]= "\\E3* and personally hunt&  you down and destroy&  you./"
	    if(GS.flag[67] == 1) {
	        GS.msg[14]= "\\E1* meanwhile.../"
	        GS.msg[15]= "* i\'ve been knocking&  on the door to&  the RUINs.../"
	        GS.msg[16]= "\\E3* but the woman that\'s&  there hasn\'t been&  answering me./"
	        GS.msg[17]= "\\E1* maybe she\'s not&  feeling well?/"
	        GS.msg[18]= "\\E3* heh./"
	        GS.msg[19]= "\\E4* or maybe she\'s not&  feeling anything at&  all...?/"
	        GS.msg[20]= "\\E4* you\'d better watch&  yourself^1, kid./"
	        GS.msg[21]= "\\E4* things are lookin&  real bad for you./%%"
	        con= 32
	    } else  {
	        GS.msg[14]= "\\E1* meanwhile.../"
	        GS.msg[15]= "\\E3* i\'ve been knocking on&  the door to the&  RUINS.../"
	        GS.msg[16]= "\\E3* but that woman hasn\'t&  been answering me.../"
	        GS.msg[17]= "\\E1* maybe she\'s not&  feeling well?/"
	        scr_papface(18, 3)
	        GS.msg[19]= "HEY^1, SANS^1, WHO ARE&YOU TALKING TO?/"
	        scr_sansface(20, 2)
	        GS.msg[21]= "* oh^1, just the human./"
	        scr_papface(22, 2)
	        GS.msg[23]= "OH^1, COOL./"
	        GS.msg[24]= "\\E3.../"
	        GS.msg[25]= "\\E5WAIT, DID YOU&SAY THE HUMAN!?/"
	        GS.msg[26]= "\\E0CAN I TALK TO&THEM???/"
	        scr_sansface(27, 1)
	        GS.msg[28]= "* sure^1, knock yourself&  out./"
	        scr_papface(29, 0)
	        GS.msg[30]= "HEY!!^1!&UNDYNE\'S THE&EMPRESS NOW!!/"
	        GS.msg[31]= "IT\'S AMAZING!!!/"
	        GS.msg[32]= "AND SHE APPOINTED&ME TO BE.../"
	        GS.msg[33]= "THE MOST IMPORTANT&ROYAL POSITION!!!/"
	        GS.msg[34]= "\\E3.../"
	        GS.msg[35]= "\\E3THAT\'S IT^1.&THAT\'S LITERALLY&THE TITLE./"
	        GS.msg[36]= "\\E0WHAT DO I DO?/"
	        GS.msg[37]= "\\E3SHE TOLD ME TO^1,&UM.../"
	        GS.msg[38]= "\\E3STAND AROUND AND&LOOK CUTE./"
	        GS.msg[39]= "\\E0WELL!!^1!&THAT\'S THE PERFECT&JOB FOR ME!!!/"
	        GS.msg[40]= "I DO THAT ALL THE&TIME^1, WITHOUT&TRYING!!/"
	        GS.msg[41]= "FINALLY!^1!&I\'M IMPORTANT./"
	        GS.msg[42]= "AND IT\'S ALL&THANKS TO YOU,/"
	        GS.msg[43]= "AND THE HORRIBLE&THINGS YOU DID./"
	        GS.msg[44]= "THANK YOU^1, HUMAN!/"
	        GS.msg[45]= "COME BACK AND&VISIT SOMETIME!!/"
	        GS.msg[46]= "\\E3WAIT..^1.&UNDYNE WOULD&PROBABLY KILL YOU./"
	        GS.msg[47]= "\\E0BUT..^1.&YOU\'D GET TO&SEE ME./"
	        GS.msg[48]= "SO YOU GOTTA&RISK IT!!!/"
	        GS.msg[49]= "YOU GOTTA!!!/"
	        GS.msg[50]= "SEE YOU SOON./%%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 32 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.stringno == 18)
	    caster_stop(GS.currentsong)
	if(con == 32 and not instance_exists(782/* OBJ_WRITER */)) con= 8
	if(con == 41) {
	    GS.facechoice= 3
	    GS.faceemotion= 3
	    GS.msg[0]= "* so^1, it\'s been a&  while./"
	    GS.msg[1]= "\\E1* since you left^1, things&  have..^1.&* gotten interesting./"
	    GS.msg[2]= "\\E0* with ASGORE gone^1, the&  people looked to&  undyne to rule.../"
	    GS.msg[3]= "\\E3* but she was nowhere&  to be found./"
	    GS.msg[4]= "\\E2* so mettaton just&  kind of..^1.&* took over?/"
	    GS.msg[5]= "\\E1* he\'s brainwashed&  everyone with his&  stupid TV show./"
	    GS.msg[6]= "* and made the&  underground into his&  personal paradise./"
	    GS.msg[7]= "\\E3* it\'s honestly..^1.&* kinda disturbing./"
	    GS.msg[8]= "\\E1* as for me^1?&* oh^1, yeah.../"
	    GS.msg[9]= "\\E2* i\'m his agent./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 42
	}
	if(con == 42 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_play(GS.currentsong, 0.7, 0.95)
	    GS.typer= 27
	    GS.facechoice= 8
	    GS.faceemotion= 0
	    GS.msg[0]= "\\E0* HEY THERE^1, DARLING!/"
	    GS.msg[1]= "* THANK YOU SO MUCH FOR&  YOUR HARD WORK.../"
	    GS.msg[2]= "* THANKS TO YOU, THE&  UNDERGROUND IS MORE&  EXCITING THAN EVER!/"
	    GS.msg[3]= "\\E7* OOH LA LA...&* STATUES... MONUMENTS&  TO MY BEAUTY.../"
	    GS.msg[4]= "\\E6* FLOWERS IN THE&  ARRANGEMENT OF MY&  NAME.../"
	    GS.msg[5]= "\\E5* HEDGES IN THE SHAPE&  OF MY SMILE.../"
	    GS.msg[6]= "\\E8* UNDER MY RULE, THE&  UNDERGROUND\'S PROBLEMS&  ARE OVER, BABY!/"
	    GS.msg[7]= "\\E7* CROWDING?&* DREARINESS???/"
	    GS.msg[8]= "\\E9* WHO NEEDS THE SUN&  WHEN YOU\'VE GOT&  THE SPOTLIGHT!!?/"
	    GS.msg[9]= "\\E1* ECONOMIC COLLAPSE?&* EDUCATION PROBLEMS?&* WHAT!?/"
	    GS.msg[10]= "\\E8* EVERYTHING\'S COVERED&  IN GOLDEN GLITTER!/"
	    GS.msg[11]= "\\E6* THERE ARE NO&  PROBLEMS, BEAUTIFUL!/"
	    GS.msg[12]= "\\E0* AND, I\'VE ENSTATED&  A NEW POLICY ON&  HUMANITY./"
	    GS.msg[13]= "\\E1* IF A HUMAN FALLS DOWN&  HERE.../"
	    GS.msg[14]= "\\E6* THEY CAN JOIN MY&  FAN CLUB FOR FREE!/"
	    GS.msg[15]= "\\E1* OH, YOU MIGHT BE&  WONDERING ABOUT&  ALPHYS./"
	    GS.msg[16]= "\\E0* DON\'T WORRY!/"
	    GS.msg[17]= "\\E9* I BUILT A STATUE&  OF HER, TOO./"
	    GS.msg[18]= "\\E1* .../"
	    GS.msg[19]= "\\E3* REALLY THOUGH.&* I REALIZED I WAS.../"
	    GS.msg[20]= "\\E4* NOT THE GREATEST&  TO HER./"
	    GS.msg[21]= "\\E1* SO I WENT TO&  APOLOGIZE./"
	    GS.msg[22]= "\\E9* AND, TO ASK HER&  TO HELP ME RULE./"
	    GS.msg[23]= "\\E1* .../"
	    GS.msg[24]= "\\E3* BUT I COULDN\'T FIND&  HER./"
	    GS.msg[25]= "\\E4* TRUST ME.&* I LOOKED./"
	    GS.msg[26]= "\\E3* .../"
	    GS.msg[27]= "\\E1* ANYWAY./"
	    GS.msg[28]= "\\E2* I HOPE YOUR LIFE&  AFTER MEETING ME.../"
	    GS.msg[29]= "\\E7* HAS BEEN WORTH LIVING./"
	    GS.msg[30]= "\\E6* IT MUST BE A STRUGGLE./"
	    GS.msg[31]= "\\E0* PLEASE, THINK OF ME&  ALWAYS./"
	    GS.msg[32]= "\\E5* JUST CONSTANTLY.&* THINK OF ME POSING.&* BEAUTIFULLY.../"
	    GS.msg[33]= "\\E6* OH YESSSS!!!/"
	    if(GS.flag[67] == 1) GS.msg[33]= "\\E6* OH YESSSS!!!/%%"
	    else  {
	        GS.msg[34]= "\\E2* OH^1, MY OTHER AGENT&  WANTS TO TALK./"
	        scr_papface(35, 0)
	        GS.msg[36]= "HEY!!^1!&IT\'S ME^1, PAPYRUS!!/"
	        GS.msg[37]= "\\E2IMAGINE ME WEARING&COOL GLASSES^1, AND&A SUIT./"
	        GS.msg[38]= "\\E0AND IMAGINE SANS&WEARING SUNGLASSES&BEING A BOUNCER./"
	        GS.msg[39]= "THAT\'S OUR LIFE..^1.&IT\'S SO COOL!!!/"
	        GS.msg[40]= "THINGS HAVE GOTTEN&WAY BETTER SINCE&YOU CAME HERE!!!/"
	        GS.msg[41]= "\\E3WELL^1, MINUS THE&FACT THAT&EVERYTHING SUCKS.../"
	        GS.msg[42]= "\\E5FOR ANYONE THAT&DOESNT WORSHIP&METTATON./"
	        GS.msg[43]= "\\E3AND MINUS THE FACT&THAT MY FRIEND&UNDYNE IS MISSING./"
	        GS.msg[44]= "WHO KNOWS WHERE&SHE WENT./"
	        GS.msg[45]= "SHE NEVER LIKED&METTATON\'S SHOW./"
	        GS.msg[46]= "\\E3PEOPLE WHO DON\'T&TEND TO KIND OF.../"
	        GS.msg[47]= "\\E5DISAPPEAR./"
	        GS.msg[48]= "\\E6I MISS HER A&LOT SOMETIMES./"
	        GS.msg[49]= "\\E0IF YOU SEE HER^1,&CAN YOU TELL HER&I SAID HI?/"
	        GS.msg[50]= "THANKS^1!&SEE YOU LATER!/%%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 43
	}
	if(con == 43 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 20) caster_pause(GS.currentsong)
	    if(OBJ_WRITER.stringno == 27) caster_resume(GS.currentsong)
	}
	if(con == 43 and not instance_exists(782/* OBJ_WRITER */)) con= 8
	if(con == 51) {
	    GS.facechoice= 3
	    GS.faceemotion= 3
	    GS.msg[0]= "\\E3* so.^1.&* it\'s been a while./"
	    GS.msg[1]= "* since you left.../"
	    GS.msg[2]= "\\E1* things have gotten&  really strange./"
	    GS.msg[3]= "\\E0* overnight^1, a bunch of&  people mysteriously&  disappeared./"
	    GS.msg[4]= "\\E3* as well as the&  human souls./"
	    GS.msg[5]= "\\E3* people were heart-&  broken. everyone they&  looked up to.../"
	    GS.msg[6]= "* everything they were&  relying on^1, in one&  night, disappeared./"
	    GS.msg[7]= "* everyone clamored to&  elect a new ruler as&  fast as possible./"
	    GS.msg[8]= "\\E1* so^1, uh..^1.&* by process of&  elimination.../"
	    GS.msg[9]= "\\E2* papyrus became the&  ruler?/"
	    GS.msg[10]= "\\E1* why doesn\'t he talk&  to you about this.../"
	    scr_papface(11, 0)
	    GS.msg[12]= "\\E0HELLO!!^1!&HUMAN!!!/"
	    GS.msg[13]= "\\E3IT\'S STRANGE./"
	    GS.msg[14]= "\\E3ASGORE^1, ALPHYS^1,&METTATON^1, AND&UNDYNE WENT AWAY./"
	    GS.msg[15]= "\\E0SANS SAYS THEY&WENT ON VACATION./"
	    GS.msg[16]= "I HOPE THEY\'RE&HAVING FUN!!!/"
	    GS.msg[17]= "\\E3OH YEAH./"
	    GS.msg[18]= "\\E0I\'M THE RULER OF&THE UNDERGROUND&NOW!!!/"
	    GS.msg[19]= "EVERYTHING IS&IMPROVING A LOT&HERE./"
	    GS.msg[20]= "PRODUCTIVITY IS UP!/"
	    GS.msg[21]= "BECAUSE I TELL&EVERYONE TO KEEP&WORKING./"
	    GS.msg[22]= "AND^1, NO ONE GOES&HUNGRY!!!/"
	    GS.msg[23]= "BECAUSE I COOK&EVERYONE&SPAGHETTI./"
	    GS.msg[24]= "\\E3MEANWHILE^1, MY&BROTHER HANDLES&THE PAPERWORK./"
	    GS.msg[25]= "\\E3STRANGELY..^1.&HE SEEMS TO BE&WORKING HARD?/"
	    GS.msg[26]= "\\E3THIS SOUNDS MESSED&UP..^1. BUT.../"
	    GS.msg[27]= "\\E5I\'M PROUD..^1.&OF HIM???/"
	    GS.msg[28]= "OH NO!!!!/"
	    GS.msg[29]= "\\E0AS FOR OUR HUMAN&POLICY.../"
	    GS.msg[30]= "\\E3WE\'VE DECIDED^1, UM./"
	    GS.msg[31]= "SANS^1, WHAT WAS IT?/"
	    scr_sansface(32, 2)
	    GS.msg[33]= "\\E2* we can\'t judge&  humans to be all&  good or all bad./"
	    scr_papface(34, 0)
	    GS.msg[35]= "\\E0RIGHT^1!&SO IT\'S CASE-BY-&CASE!/"
	    GS.msg[36]= "IF THEY\'RE EVIL..^1.&WE GIVE THEM&PUZZLES!/"
	    GS.msg[37]= "IF THEY\'RE GOOD..^1.&WE ALSO GIVE&THEM PUZZLES!/"
	    GS.msg[38]= "THAT SEEMS TO BE&THE BEST WAY!/"
	    GS.msg[39]= "\\E0.../"
	    GS.msg[40]= "\\E3.../"
	    GS.msg[41]= "IS SANS GONE?/"
	    GS.msg[42]= "\\E6YOU KNOW.../"
	    GS.msg[43]= "DON\'T TELL MY&BROTHER, BUT.../"
	    GS.msg[44]= "DESPITE THE&IMPROVEMENTS&WE\'VE MADE.../"
	    GS.msg[45]= "SOMETIMES THIS JOB&IS KIND OF HARD./"
	    GS.msg[46]= "SINCE THE KING&WENT AWAY.../"
	    GS.msg[47]= "LOTS OF PEOPLE&JUST WANT TO&GIVE UP./"
	    GS.msg[48]= "SOMETIMES, EVEN MY&BEST&ENCOURAGEMENT.../"
	    GS.msg[49]= "DOESN\'T WORK./"
	    GS.msg[50]= "AND^1, AND^1, I MISS&UNDYNE^1, TOO./"
	    GS.msg[51]= "SHE NEVER ANSWERS&MY PHONE CALLS.../"
	    GS.msg[52]= "\\E5SHE MUST BE& HAVING A LOT OF&FUN ON VACATION./"
	    GS.msg[53]= "\\E6I JUST WISH SHE\'D&SEND A POSTCARD./"
	    GS.msg[54]= ".../"
	    GS.msg[55]= "\\E5BUT HEY!!!/"
	    GS.msg[56]= "\\E4I WON\'T GIVE UP!/"
	    GS.msg[57]= "I CAN\'T GIVE UP!/"
	    GS.msg[58]= "I HAVE TO MAKE&EVERYONE GIVE UP&GIVING UP!/"
	    GS.msg[59]= "\\E0WE\'LL GET OUT&OF HERE^1, SLOWLY!!!/"
	    GS.msg[60]= "THEN WE CAN ALL&HANG OUT AGAIN!!!/"
	    GS.msg[61]= "\\E0NYEH HEH HEH!!!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 8
	}
	if(con == 61) {
	    GS.facechoice= 3
	    GS.faceemotion= 3
	    GS.msg[0]= "\\E3* it\'s been a while^1,&  huh?/"
	    GS.msg[1]= "* .../"
	    GS.msg[2]= "* things have gotten&  pretty bad here./"
	    GS.msg[3]= "\\E0* everyone considered a&  leader disappeared&  overnight./"
	    GS.msg[4]= "\\E1* it\'s gotten so quiet./"
	    GS.msg[5]= "\\E3* there\'s a bad feeling&  hanging over&  everyone./"
	    GS.msg[6]= "* like everyone\'s just&  going to die here^1,&  trapped in the dark.../"
	    GS.msg[7]= "\\E2* ... i bet you\'re&  wondering why i\'m&  not the ruler./"
	    GS.msg[8]= "\\E1* eh./"
	    GS.msg[9]= "\\E1* i\'m not cut out&  for something like&  that./"
	    GS.msg[10]= "\\E2* i like to take it&  easy^1, you know?/"
	    GS.msg[11]= "\\E2* .../"
	    GS.msg[12]= "\\E3* ... that\'s a joke./"
	    GS.msg[13]= "\\E3* this is what happens&  when people like me&  take it easy./"
	    GS.msg[14]= "* .../"
	    GS.msg[15]= "\\E4* see ya./%%"
	    if(GS.kills >= 20) {
	        GS.msg[15]= "\\E0* hey^1, at least things&  are less crowded./"
	        GS.msg[16]= "\\E1* \'cause of all the&  people you killed./"
	        GS.msg[17]= "\\E2* hope that was a good&  experience for you./"
	        GS.msg[18]= "\\E3* .../"
	        GS.msg[19]= "\\E2* just kidding^1.&* i don\'t really hope&  that./"
	        GS.msg[20]= "\\E4* go to hell./%%"
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 8
	}
	if(con == 71) {
	    GS.facechoice= 3
	    GS.faceemotion= 3
	    GS.msg[0]= "\\E3* it\'s been a while^1,&  huh?/"
	    GS.msg[1]= "* .../"
	    GS.msg[2]= "\\E1* it seems a number of&  important people&  disappeared overnight./"
	    GS.msg[3]= "* but no one else was&  harmed./"
	    GS.msg[4]= "\\E0* the people were&  confused^1.&* it was complete bedlam./"
	    GS.msg[5]= "\\E3* somehow^1, at the end of&  the day.../"
	    GS.msg[6]= "\\E1* a small^1, white dog&  became president of&  the underground./"
	    GS.msg[7]= "\\E0* it sleeps on the&  throne and does&  absolutely nothing./"
	    GS.msg[8]= "\\E1* strangely^1, it seems&  this is the best&  life for everyone./"
	    GS.msg[9]= "\\E2* thanks./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 8
	}
	if(con == 81) {
	    GS.facechoice= 3
	    GS.faceemotion= 3
	    GS.msg[0]= "\\E3* it\'s been a while^1,&  huh?/"
	    GS.msg[1]= "* .../"
	    GS.msg[2]= "\\E1* i\'ll be honest./"
	    GS.msg[3]= "\\E2* i have no idea what&  happened for you&  to get here./"
	    GS.msg[4]= "\\E1* this is actually some&  sort of error-&  handling message./"
	    GS.msg[5]= "\\E3* so^1, if you\'re getting&  this ending.../"
	    GS.msg[6]= "\\E1* tell whoever made the&  game^1, okay?/"
	    GS.msg[7]= "\\E2* they\'ll fix it^1, or&  if it\'s a novel&  situation.../"
	    GS.msg[8]= "\\E1* they might even add&  another ending to&  the game./"
	    GS.msg[9]= "\\E3* chances are^1, though.../"
	    GS.msg[10]= "\\E4* you\'re just a dirty&  hacker^1, aren\'t you?/"
	    GS.msg[11]= "\\E1* yeah^1, get outta here./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 8
	}
	if(con == 91) {
	    GS.typer= 47
	    GS.flag[430]= 4
	    GS.facechoice= 6
	    GS.faceemotion= 0
	    GS.msg[0]= "\\E1* H..^1. hey./"
	    GS.msg[1]= "\\E0* So..^1. you\'re the one&  who killed all my&  friends./"
	    GS.msg[2]= "\\E1* I just called to tell&  you./"
	    GS.msg[3]= "\\E0* I hate you./"
	    GS.msg[4]= "\\E1* Yet..^1. strangely..^1.&* It\'s because of you^1,&  that.../"
	    GS.msg[5]= "\\E2* That I was forced to&  become a better&  person./"
	    GS.msg[6]= "\\E0* When I first saw you&  hurting people.../"
	    GS.msg[7]= "* I just sat there^1.&* Watching you./"
	    GS.msg[8]= "\\E1* I felt so guilty knowing&  I hadn\'t do anything&  to stop you./"
	    GS.msg[9]= "\\E3* I felt like all I&  do was.../"
	    GS.msg[10]= "\\E4* Was hope you would&  destroy me^1, too./"
	    GS.msg[11]= "\\E1* But when Undyne called^1,&  with crazed desperation&  in her voice.../"
	    GS.msg[12]= "\\E0* I..^1.&* I realized I had to do&  something./"
	    GS.msg[13]= "\\E1* Even if it meant&  everybody would.../"
	    GS.msg[14]= "* Have to learn the&  truth about me./"
	    GS.msg[15]= "\\E2* It\'s strange^1.&* You know?/"
	    GS.msg[16]= "\\E5* Even after all the&  bad things I did./"
	    GS.msg[17]= "* People treated me like&  a hero./"
	    GS.msg[18]= "\\E2* And then they..^1.&* Asked me to run&  everything./"
	    GS.msg[19]= "\\E5* So I\'m trying my&  best^1, here./"
	    GS.msg[20]= "\\E2* I think I have some&  good policies^1, but^1,&  y-you know.../"
	    GS.msg[21]= "\\E1* Talking to people&  still makes me&  nervous./"
	    GS.msg[22]= "\\E0* I\'m no ASGORE^1,&  you know?/"
	    GS.msg[23]= "\\E2* .../"
	    GS.msg[24]= "\\E4* God..^1.&* I miss everyone./"
	    GS.msg[25]= "\\E3* Now that they\'re&  gone^1, it.../"
	    GS.msg[26]= "* It feels so clear what&  I should have done./"
	    GS.msg[27]= "\\E3* What I should have&  said./"
	    GS.msg[28]= "\\E6* Undyne..^1.&* Asgore.../"
	    GS.msg[29]= "* Mettaton.../"
	    GS.msg[30]= "\\E5* At least Sans is&  still here./"
	    GS.msg[31]= "\\E4* He\'s..^1.&* He\'s a good guy^1.&* And with him around.../"
	    GS.msg[32]= "\\E4* I.../"
	    GS.msg[33]= "\\E2* Sigh./"
	    GS.msg[34]= "\\E1* You know^1.&* Just daydreaming here^1.&* But.../"
	    GS.msg[35]= "\\E5* I really should have&  killed you when I&  had the chance./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 8
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
