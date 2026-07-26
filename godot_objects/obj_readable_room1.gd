# Auto-converted from GameMaker: obj_readable_room1
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	read= 0
	specialread= 0
	cantalk= 1
	mydialoguer= 438274832
	scale.x= 1
	scale.y= 1
	if(room < 40 and GS.plot == 0) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "%%"
	if(room == 7)
	    GS.msg[0]= "* Only the fearless may proceed.&* Brave ones, foolish ones.&* Both walk not the middle road./%%"
	if(room == 8) GS.msg[0]= "* Stay on the path./%%"
	if(room == 10)
	    GS.msg[0]= "* The western room is the&  eastern room\'s blueprint./%%"
	if(room == 15)
	    GS.msg[0]= "* Three out of four grey rocks&  recommend you push them./%%"
	if(room == 21)
	    GS.msg[0]= "* (There\'s an ant-sized frog in&  a crack in the wall...^1)&* (It waves at you.)/%%"
	if(room == 22) GS.msg[0]= "* There is just one switch./%%"
	if(room == 23)
	    GS.msg[0]= "* The far door is not an exit^1.&* It simply marks a rotation&  in perspective./%%"
	if(room == 24)
	    GS.msg[0]= "* If you can read this^1,&  press the blue switch./%%"
	if(room == 25)
	    GS.msg[0]= "* If you can read this^1,&  press the red switch./%%"
	if(room == 26)
	    GS.msg[0]= "* If you can read this^1,&  press the green switch./%%"
	if(room == 32)
	    GS.msg[0]= "* These books are worn...&* They must have been read&  many times./%%"
	if(room == 220) {
	    GS.msg[0]= "* (There\'s an old calendar from&  the end of 201X.^1)&* (A date is circled on it.)/%%"
	    if(scr_murderlv() >= 16)
	        GS.msg[0]= "\\R* (The date I came here.)/%%"
	}
	if(room == 33)
	    GS.msg[0]= "* The ends of the tools have&  been filed down to&  make them safer./%%"
	if(room == 221) GS.msg[0]= "* Seems like gardening tools./%%"
	if(room == 36)
	    GS.msg[0]= "* Look at these cool toys^2!&* They don\'t interest you&  at all./%%"
	if(room == 224) GS.msg[0]= "* (Dusty toys.)/%%"
	if(room == 232) GS.msg[0]= "* Throne Room/%%"
	if(room == 234) {
	    GS.msg[0]= "* (It\'s a coffin.^1)&* (There\'s a name engraved on&  it.)/"
	    GS.msg[1]= "* (" + chr(ord('"')) + "" + GS.charname + "." + chr(ord('"')) + ")/"
	    GS.msg[2]= "* (It\'s empty.)/%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* (The coffin is empty...?)/"
	        GS.msg[1]= "* (You didn\'t notice before^1,&  but there\'s something like...)/"
	        GS.msg[2]= "* (... mummy wrappings at the&  bottom of it.)/%%"
	    }
	    if(scr_murderlv() >= 16)
	        GS.msg[0]= "\\R* (It\'s as comfortable as it&  looks.)/%%"
	}
	if(room == 35) {
	    GS.msc= 524
	    if(x > 192) {
	        GS.msc= 0
	        GS.msg[0]= "* You peek inside..^2.&* Scandalous!/"
	        GS.msg[1]= "* It\'s TORIEL\'s sock&  collection./%%"
	        if(read > 0)
	            GS.msg[0]= "* You can\'t stop looking&  at the socks./%%"
	        if(GS.flag[7] == 1) {
	            GS.msg[0]= "* (You came all the way&  back here to look at&  Toriel\'s socks.)/"
	            GS.msg[1]= "* (You have great priorities&  in life.)/%%"
	        }
	    }
	}
	if(room == 223) {
	    GS.msg[0]= "* It\'s a clothes drawer^1.&* There are robes^1, button-up&  shirts.../"
	    GS.msg[1]= "* ... and a pink^1, hand-knit&  sweater that says&  " + chr(ord('"')) + "Mr. Dad Guy." + chr(ord('"')) + "/%%"
	    if(scr_murderlv() >= 16)
	        GS.msg[0]= "\\R* Still has that sweater./%%"
	    if(y > 120) GS.msg[0]= "* (It\'s just a chair.)/%%"
	}
	if(room == 235) GS.msg[0]= "* (It\'s a throne.)/%%"
	if(room == 34) GS.msg[0]= "* " + chr(ord('"')) + "Room under renovations." + chr(ord('"')) + "/%%"
	if(room == 222) GS.msg[0]= "* " + chr(ord('"')) + "Room under renovations." + chr(ord('"')) + "/%%"
	if(room == 37)
	    GS.msg[0]= "* For some reason^1, there&  is a brand-name chocolate&  bar in the fridge./%%"
	if(room == 225) {
	    GS.msg[0]= "* (The fridge is full of&  unopened containers of&  snails.)/%%"
	    if(scr_murderlv() >= 16) GS.msg[0]= "\\R* No chocolate./%%"
	}
	if(room == 44)
	    GS.msg[0]= "* ...!^1?&* There\'s a camera hidden&  in the bushes./%%"
	if(room == 54) GS.msg[0]= "* (His.)/%%"
	if(room == 57) {
	    if(GS.plot <= 48)
	        GS.msg[0]= "* There\'s a switch hidden&  in the snow^1.&* Click!/%%"
	    if(GS.plot > 48) GS.msg[0]= "* The switch is stuck now./%%"
	    if(GS.flag[64] == 0) GS.flag[64]= 1
	    if(GS.plot <= 48) GS.plot= 49
	    if(scr_murderlv() >= 3)
	        GS.msg[0]= "* There\'s a switch here^1.&* It\'s been depressed with&  vines./%%"
	}
	if(room == 61)
	    GS.msg[0]= "* On the floor inside is&  a box of pomeraisins./%%"
	if(room == 9999999) {
	    GS.msg[0]= "* (It\'s a school report about&  monster funerals.)/"
	    GS.msg[1]= "* Monster funerals^1, technically&  speaking^2, are super crap./"
	    GS.msg[2]= "* When monsters die^1, their&  bodies turn into dust./"
	    GS.msg[3]= "* One time this kid at my school&  went missing for a week and&  everyone thought he was dead.../"
	    GS.msg[4]= "* But then he came back!!!/"
	    GS.msg[5]= "* Turns out he was visiting his&  girlfriend in Hotland and&  and didn\'t tell anyone!/"
	    GS.msg[6]= "* To be scientific^1, it sucks&  that no one ever knows&  if anyone\'s dead or alive./"
	    GS.msg[7]= "* So yeah^1, what do we do at&  funerals^1, anyway?/"
	    GS.msg[8]= "* Professionally speaking:/"
	    GS.msg[9]= "* DUH!!!/"
	    GS.msg[10]= "* We pour the dust on whatever&  that person liked./"
	    GS.msg[11]= "* Then they will live on..^1.&  ... in that object...&  ... symbolically.../"
	    GS.msg[12]= "* Uhhh^1, did I reach the page&  minimum yet^1?&* I\'m kinda sick of writing./%%"
	}
	if(room == 74) {
	    GS.msg[0]= "* (It\'s a school report about&  monster funerals.)/"
	    GS.msg[1]= "* Monster funerals^1, technically&  speaking^2, are cool as heck./"
	    GS.msg[2]= "* When monsters get old and&  kick the bucket^1, they turn&  into dust./"
	    GS.msg[3]= "* At funerals^1, we take that&  dust and spread it on that&  person\'s favorite thing./"
	    GS.msg[4]= "* Then their essence will live&  on in that thing.../"
	    GS.msg[5]= "* Uhhh^1, am I at the page&  minimum yet^1?&* I\'m kinda sick of writing this./%%"
	}
	if(room == 71) {
	    GS.msg[0]= "\\W* Mom says that sleeping&  can recover your health&  \\Yabove your maximum HP\\W./"
	    GS.msg[1]= "* ... what\'s maximum HP?/%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* Mom says that we can&  go to the surface world&  now!/"
	        GS.msg[1]= "* ... what\'s so great about&  that^1, anyway^1?&* I don\'t wanna move./%%"
	    }
	    if(scr_murderlv() >= 7) GS.msg[0]= "* (It\'s merely a decoy.)/%%"
	}
	if(room == 97) {
	    GS.msg[0]= "* " + chr(ord('"')) + "The power to take their&  SOULs." + chr(ord('"')) + "/"
	    GS.msg[1]= "* " + chr(ord('"')) + "This is the power that&  the humans feared." + chr(ord('"')) + "/%%"
	}
	if(room == 91) {
	    GS.msg[0]= "* (Ancient writing covers the&  walls..^1. you can just make&  out the words.)/"
	    GS.msg[1]= "* " + chr(ord('"')) + "The War of Humans and&  Monsters." + chr(ord('"')) + "/%%"
	}
	if(room == 101)
	    GS.msg[0]= "* The northern room hides a&  great treasure./%%"
	if(room == 126) {
	    GS.msg[0]= "* Hurt, beaten, and fearful for&  our lives, we surrendered&  to the humans./"
	    GS.msg[1]= "* Seven of their greatest&  magicians sealed us underground&  with a magic spell./"
	    GS.msg[2]= "* Anything can enter through the&  seal, but only beings with a&  powerful SOUL can leave./%%"
	}
	if(room == 131) {
	    GS.msg[0]= "* However...&* There is a prophecy./"
	    GS.msg[1]= "* The Angel...&* The One Who Has Seen The&  Surface.../"
	    GS.msg[2]= "* They will return.&* And the underground will go&  empty./%%"
	}
	if(room == 96)
	    GS.msg[0]= "* The ancient glyphs have been&  painted over with a list of&  21 different flavors./%%"
	if(room == 123)
	    GS.msg[0]= "* Achoo^1!&* Tried to catch a bug^1, but&  I just caught a cold.../%%"
	if(room == 110) {
	    GS.msg[0]= "* The humans, afraid of our&  power^1, declared war on us./"
	    GS.msg[1]= "* They attacked suddenly, and&  without mercy./%%"
	}
	if(room == 129)
	    GS.msg[0]= "* Without candles or magic to&  guide them Home^1, the monsters&  used crystals to navigate./%%"
	if(room == 132) {
	    if(instance_exists(1126/* obj_monsterkidtrigger7 */))
	        obj_monsterkidtrigger7.con= 80
	    cantalk= 0
	}
	if(room == 141) {
	    GS.msg[0]= "* (It\'s a beat-up figurine&  of a female human with&  cat ears.)/%%"
	    if(GS.plot < 126 and scr_murderlv() < 12)
	        GS.msg[0]= "* (It\'s too dark to see&  near the walls.)/%%"
	}
	if(room == 142)
	    GS.msg[0]= "* (Scientific books.^1)&* (They seem very dusty.)/%%"
	if(room == 154) {
	    GS.msg[0]= "* (It\'s a fridge.^1)&* (It\'s strangely warm.)/%%"
	    if(GS.plot < 134)
	        GS.msg[0]= "* (It\'s too dark to see&  near the walls.)/%%"
	    if(instance_exists(1173/* obj_mettaton_npc */)) {
	        GS.typer= 27
	        GS.msg[0]= "* MILK^1? EGGS^1? IN THE FRIDGE?/"
	        GS.msg[1]= "* NO WAY^1, DARLING^1!&* THEY\'D GET COLD!!!/%%"
	    }
	    if(GS.plot == 134) {
	        snd_play(104/* snd_phone */)
	        GS.typer= 5
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	        GS.msg[2]= "* Um^1, is it really&  a good idea to be&  getting a snack?/"
	        GS.msg[3]= "\\E8* Well^1, I guess I&  really shouldn\'t&  judge you.../"
	        GS.msg[4]= "\\E0* After all^1, I\'m the&  one eating potato&  chips in my PJs!/"
	        GS.msg[5]= "\\E5* Uhhh^1, I mean..^1.&* H-hey^1, go over to&  the right!/%%"
	        if(specialread > 0) {
	            GS.msg[0]= "* Ring.../"
	            GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	            GS.msg[2]= "* H-hey^1!&* Head over to the&  right!/%%"
	        }
	        specialread++
	    }
	}
	if(room == 118) {
	    GS.typer= 37
	    GS.facechoice= 5
	    GS.faceemotion= 4
	    GS.msc= 0
	    if(x > 180) {
	        GS.msg[0]= "* I hate cold food./"
	        GS.msg[1]= "\\E0* So Alphys fixed up&  my fridge so it&  heats up food instead!/"
	        GS.msg[2]= "\\E6* Hot Fridge..^1.&* The world\'s greatest&  invention!/%%"
	        if(read > 0)
	            GS.msg[0]= "\\E6* Hot Fridge..^1.&* The world\'s greatest&  invention!/%%"
	    } else  {
	        GS.faceemotion= 0
	        GS.msg[0]= "* This oven is some&  top-of-the-line&  MTT thing./"
	        GS.msg[1]= "\\E4* But^1, y\'know^1, as much&  as technology&  advances.../"
	        GS.msg[2]= "\\E0* Nothing beats food&  home-cooked with&  fire magic./%%"
	    }
	}
	if(room == 170) {
	    GS.msg[0]= "* (It looks like some sort of&  powerful bracelet...)/"
	    GS.msg[1]= "* (Wait.^1)&* (It\'s just a croissant...)/%%"
	}
	if(room == 182) GS.msg[0]= "* (It\'s just a regular wall.)/%%"
	if(room == 196) GS.msg[0]= "* (East...)&* (The End.)/%%"
	if(room == 198)
	    GS.msg[0]= "* (Solve this puzzle,&  and The End will open.)/%%"
	if(room == 200)
	    GS.msg[0]= "* (Traverse the northern&  room^1, and The End will&  open.)/%%"
	if(room == 202) {
	    GS.msg[0]= "* (I cannot fight.)&* (I cannot think.)/"
	    GS.msg[1]= "* (But^1, with patience^1,&  I will make my way&  through.)/%%"
	}
	if(room == 204)
	    GS.msg[0]= "* (Get lost...)&* (And stay that way.)/%%"
	if(room == 206)
	    GS.msg[0]= "* (Why not relax and have&  a nice snack?)/%%"
	if(room == 207)
	    GS.msg[0]= "* (Get lost...)&* (And stay that way.)/%%"
	if(room == 211) {
	    GS.msg[0]= "* (It\'s completely trashed.^1)&* (There\'s no way it could&  ever be repaired.)/%%"
	    if(GS.flag[425] == 0)
	        GS.msg[0]= "* (It\'s out of batteries.)/%%"
	}
	if(room == 245) {
	    GS.msg[0]= "* ENTRY NUMBER 1/"
	    GS.msg[1]= "* This is it..^1.&* Time to do what the King&  has asked me to do./"
	    GS.msg[2]= "* I will create the power to&  free us all./"
	    GS.msg[3]= "* I will unleash the power of&  the SOUL./%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	}
	if(room == 246) {
	    GS.msg[0]= "* POWER ROOM/%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	}
	if(room == 247) {
	    GS.msg[0]= "* ENTRY NUMBER 6/"
	    GS.msg[1]= "* ASGORE asked everyone&  outside the city for monsters&  that had " + chr(ord('"')) + "fallen down." + chr(ord('"')) + "/"
	    GS.msg[2]= "* Their bodies came in today./"
	    GS.msg[3]= "* They\'re still comatose..^1.&* And soon^1, they\'ll all&  turn into dust./"
	    GS.msg[4]= "* But what happens if I&  inject " + chr(ord('"')) + "determination" + chr(ord('"')) + " into&  them?/"
	    GS.msg[5]= "* If their SOULS persist&  after they perish^1, then.../"
	    GS.msg[6]= "* Freedom might be closer&  than we all thought./%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	}
	if(room == 248) {
	    GS.msg[0]= "* ENTRY NUMBER 9/"
	    GS.msg[1]= "* things aren\'t going well./"
	    GS.msg[2]= "* none of the bodies have&  turned into dust^1, so I&  can\'t get the SOULs./"
	    GS.msg[3]= "* i told the families that&  i would give them the&  dust back for the funerals./"
	    GS.msg[4]= "* people are starting to&  ask me what\'s happening./"
	    GS.msg[5]= "* what do i do?/%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	}
	if(room == 250) {
	    GS.msg[0]= "* ENTRY NUMBER 12/"
	    GS.msg[1]= "* nothing is happening^1.&* i don\'t know what to do./"
	    GS.msg[2]= "* i\'ll just keep injecting&  everything with& " + chr(ord('"')) + "determination." + chr(ord('"')) + "/"
	    GS.msg[3]= "* i want this to work./%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	}
	if(room == 251) {
	    GS.msg[0]= "* ENTRY NUMBER 14/"
	    GS.msg[1]= "* Everyone that had fallen&  down.../"
	    GS.msg[2]= "* ... has woken up./"
	    GS.msg[3]= "* They\'re all walking around&  and talking like nothing&  is wrong./"
	    GS.msg[4]= "* I thought they were&  goners...?/%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	}
	if(room == 252) {
	    GS.msg[0]= "* ENTRY NUMBER 7/"
	    GS.msg[1]= "* We\'ll need a vessel to&  wield the monster SOULs&  when the time comes./"
	    GS.msg[2]= "* After all^1, a monster&  cannot absorb the SOULs&  of other monsters./"
	    GS.msg[3]= "* Just as a human cannot&  absorb a human SOUL.../"
	    GS.msg[4]= "* So then.../"
	    GS.msg[5]= "* What about something that\'s&  neither human nor monster?/%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	}
	if(room == 254) {
	    GS.msg[0]= "* ENTRY NUMBER 15/"
	    GS.msg[1]= "* Seems like this research&  was a dead end.../"
	    GS.msg[2]= "* But at least we got a&  happy ending out of it...?/"
	    GS.msg[3]= "* I sent the SOULS back to&  ASGORE^1, returned the&  vessel to his garden..../"
	    GS.msg[4]= "* And I called all of the&  families and told them&  everyone\'s alive./"
	    GS.msg[5]= "* I\'ll send everyone back&  tomorrow. :) /%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	}
	if(room == 256) {
	    GS.msg[0]= "* ENTRY NUMBER 17/"
	    GS.msg[1]= "* monsters\' physical forms&  can\'t handle " + chr(ord('"')) + "determination" + chr(ord('"')) + "&  like humans\' can./"
	    GS.msg[2]= "* with too much determination^1,&  our bodies begin to break&  down./"
	    GS.msg[3]= "* everyone\'s melted together.../%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	}
	if(room == 256) {
	    GS.msg[0]= "* DT EXTRACTION MACHINE&* STATUS: INACTIVE/%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	}
	if(room == 257) {
	    GS.msg[0]= "* ENTRY NUMBER 4/"
	    GS.msg[1]= "* I\'ve been researching humans&  to see if I can find any&  info about their SOULS./"
	    GS.msg[2]= "* I ended up snooping around&  the castle...&* And found these weird tapes./"
	    GS.msg[3]= "* I don\'t feel like ASGORE\'s&  watched them.../"
	    GS.msg[4]= "* I don\'t think he should./%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	}
	if(room == 260) GS.msc= 780
	if(room == 258) {
	    GS.msg[0]= "* ENTRY NUMBER 19/"
	    GS.msg[1]= "* the families keep calling&  me to ask when everyone&  is coming home./"
	    GS.msg[2]= "* what am i supposed to say?/"
	    GS.msg[3]= "* i don\'t even answer the&  phone anymore./%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	    if(GS.flag[490] == 0)
	        GS.msg[0]= "* (It\'s too dark to see near&  the walls.)/%%"
	}
	if(room == 262) {
	    GS.msg[0]= "* (Seems to be turned off.)/%%"
	    if(GS.flag[485] == 1) {
	        GS.msg[0]= "* ENTRY NUMBER 8/"
	        GS.msg[1]= "* I\'ve chosen a candidate./"
	        GS.msg[2]= "* I haven\'t told ASGORE yet^1,&  because I want to surprise&  him with it.../"
	        GS.msg[3]= "* In the center of his&  garden^1, there\'s something&  special./"
	        GS.msg[4]= "* The first golden flower^1,&  that grew before all the&  others./"
	        GS.msg[5]= "* The flower from the outside&  world./"
	        GS.msg[6]= "* It appeared just before&  the queen left./"
	        GS.msg[7]= "* I wonder.../"
	        GS.msg[8]= "* What happens when something&  without a SOUL gains&  the will to live?/%%"
	    }
	}
	if(room == 243)
	    GS.msg[0]= "* (None of the buttons work.^1)&* (It seems to have lost power.)/%%"
	if(room == 216)
	    GS.msg[0]= "* (The door is jammed shut&  with vines.)/%%"
	if(room == 261)
	    GS.msg[0]= "* (Seems like another elevator&  has lost its power.)/%%"
	if(room == 73) GS.msg[0]= "* (The jukebox is broken.)/%%"
	if(room == 119) GS.msg[0]= "* (It\'s locked.)/%%"
	if(room == 78)
	    GS.msg[0]= "* (It\'s a worn mattress.^1)&* (The sheets are bunched up in a&  weird^1, creasy ball.)/%%"
	if(room == 80) {
	    GS.msg[0]= "* (There\'s a photo album inside&  the drawer.)/"
	    GS.msg[1]= "* (There are photos of Sans with&  a lot of people you don\'t&  recognize.)/"
	    GS.msg[2]= "* (He looks happy.)/%%"
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* (There\'s a photo album inside&  the drawer.)/"
	        GS.msg[1]= "* (There are photos of Sans with&  a lot of people you don\'t&  recognize.)/"
	        GS.msg[2]= "* (... and^1, one photo of you&  standing with Sans and all&  your friends.)/"
	        GS.msg[3]= "* (He looks happy.)/%%"
	    }
	    if(GS.flag[279] == 1) {
	        GS.msg[0]= "* (There\'s a photo album inside&  the drawer.)/"
	        GS.msg[1]= "* (There are photos of..^1. Huh?)/"
	        GS.msg[2]= "* (A card is sticking out from&  the back flap of the binder.)/"
	        GS.msg[3]= "* (It\'s a poorly drawn picture&  of three smiling people.^1)&* (Written on it...)/"
	        GS.msg[4]= "* " + chr(ord('"')) + "don\'t forget." + chr(ord('"')) + "/%%"
	    }
	}
	if(room == 178) {
	    GS.msg[0]= "* (It\'s a poster for Mettaton\'s&  latest stage performance.)/"
	    GS.msg[1]= "* (A tragic tale of two star-&  crossed lovers^1, kept apart&  by the tides of fate...)/"
	    GS.msg[2]= "* (Looks like it\'s almost time&  for the performance.)/%%"
	}
	if(room == 185)
	    GS.msg[0]= "* (It\'s locked from the inside.)/%%"
	if(room == 183) {
	    GS.msg[0]= "* (There\'s an inscription on&  this fountain.)/"
	    GS.msg[1]= "* Royal Memorial Fountain&* Built 201X&* (Mettaton Added Last Week)/%%"
	}
	if(room == 184) {
	    GS.msg[0]= "* (It\'s a Wall of Fame full of&  quotes and photos from visiting&  celebrities.)/"
	    GS.msg[1]= "* " + chr(ord('"')) + "The food is to die for!^1" + chr(ord('"')) + "&* " + chr(ord('"')) + "Gorgeous style and fragrance!^1" + chr(ord('"')) + "&* " + chr(ord('"')) + "My face tastes beautiful!" + chr(ord('"')) + "/"
	    GS.msg[2]= "* (... these are all Mettaton.)/%%"
	}
	if(room == 186) {
	    GS.msg[0]= "* (It\'s a lamp.^1)&* (There\'s no lightswitch.)/"
	    GS.msg[1]= "* (It says that stars make&  their own light...)/%%"
	}
	if(room == 128) GS.msg[0]= "* (Rich history of Tem.)/%%"
	read++
	if(cantalk == 1) mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

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
