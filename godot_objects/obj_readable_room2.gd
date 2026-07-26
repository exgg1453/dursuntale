# Auto-converted from GameMaker: obj_readable_room2
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	specialread= 0
	scale.x= 1
	scale.y= 1
	read= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "%%"
	if(room == 36) {
	    GS.msg[0]= "* (An empty photo frame.)&* (It\'s really dusty...)/%%"
	    if(GS.flag[7] == 1)
	        GS.msg[0]= "* (An empty photo frame.)&* (Someone\'s dusted it off.)/%%"
	}
	if(room == 224) {
	    GS.msg[0]= "* (It\'s a family photograph.^1)&* (Everyone is smiling.)/%%"
	    if(scr_murderlv() >= 16) GS.msg[0]= "\\R* .../%%"
	}
	if(room == 33) {
	    GS.msg[0]= "* It\'s a history book^1.&* Here\'s a random page.../"
	    GS.msg[1]= "* Trapped behind the barrier&  and fearful of further&  human attacks^1, we retreated./"
	    GS.msg[2]= "* Far^1, far into the earth&  we walked^1, until we reached&  the cavern\'s end./"
	    GS.msg[3]= "* This was our new home^1,&  which we named.../"
	    GS.msg[4]= "* " + chr(ord('"')) + "Home." + chr(ord('"')) + "/"
	    GS.msg[5]= "* As great as our king is^1,&  he is pretty lousy at&  names./%%"
	}
	if(room == 223) {
	    GS.msg[0]= "* It\'s a bureau./"
	    GS.msg[1]= "* There\'s a Santa Claus outfit&  inside./%%"
	    if(scr_murderlv() >= 16) GS.msg[0]= "\\R* Nothing useful./%%"
	}
	if(room == 221) {
	    GS.msg[0]= "* (There are photo albums...^1)&* (Scrapbooks...^1)&* (Books on how to make tea...)/%%"
	    GS.msg[1]= "* (They all seem very worn.)/%%"
	    if(scr_murderlv() >= 16) GS.msg[0]= "\\R* Nothing useful./%%"
	}
	if(room == 222) GS.msg[0]= "* It\'s a golden flower./%%"
	if(room == 32)
	    GS.msg[0]= "* Inside is an old calendar&  from the beginning of&  201X./%%"
	if(room == 220) GS.msg[0]= "* (It\'s a golden flower.)/%%"
	if(room == 235)
	    GS.msg[0]= "* (It\'s another throne covered&  by a white sheet.)/%%"
	if(room == 35) {
	    GS.msg[0]= "* Just a regular old bucket^3 & &  of snails./%%"
	    if(x > 90) {
	        GS.msg[0]= "* It\'s an encyclopedia of&  subterranean plants. You&  open to the middle.../"
	        GS.msg[1]= "* " + chr(ord('"')) + "Typha" + chr(ord('"')) + " - A group of wetland&  flowering plants with&  brown^1, oblong seedpods./"
	        GS.msg[2]= "* Known more commonly as& " + chr(ord('"')) + "water sausages." + chr(ord('"')) + "/%%"
	        GS.flag[50]= 1
	    }
	}
	if(room == 34) {
	    GS.msg[0]= "* You have seen this type&  of plant before but&  do not know its name./%%"
	    if(GS.flag[50] == 1)
	        GS.msg[0]= "* Oh^2!&* It is a " + chr(ord('"')) + "water sausage." + chr(ord('"')) + "/%%"
	}
	if(room == 37) {
	    GS.msg[0]= "* What a nice smell...&* Too hot to eat^1, though./%%"
	    if(GS.flag[103] > 0)
	        GS.msg[0]= "* The size of the pie&  intimidates you too much&  for you to eat it./%%"
	    if(GS.flag[7] == 1)
	        GS.msg[0]= "* (Most of the pie is gone.^1)&* (There are dog prints in&  it...)/%%"
	}
	if(room == 74) {
	    GS.msg[0]= "* While monsters are mostly made&  of magic^1, human beings are&  mostly made of water./"
	    GS.msg[1]= "* Humans^1, with their physical&  forms^1, are far stronger&  than us./"
	    GS.msg[2]= "* But they will never know&  the joy of expressing&  themselves through magic./"
	    GS.msg[3]= "* They\'ll never get a bullet-&   pattern birthday card.../%%"
	}
	if(room == 265) GS.msg[0]= "* It\'s a door./%%"
	if(room == 44)
	    GS.msg[0]= "* ...!^1?&* There\'s a camera hidden&  in the bushes./%%"
	if(room == 53) {
	    if(instance_exists(1018/* obj_iceflag */)) {
	        if(read == 0) {
	            if(obj_iceflag.frame == 0) {
	                if(GS.flag[387] == 0) {
	                    GS.msg[0]= "\\W* \\OBravery^1. \\YJustice.\\W  &*\\B Integrity^1. \\GKindness^1.\\W &*\\P Perseverance^1. \\LPatience. \\W /"
	                    GS.msg[1]= "\\W* Using these^1, you were&  able to win at " + chr(ord('"')) + "\\RBall Game\\W." + chr(ord('"')) + "/"
	                    GS.msg[2]= "* (You are awarded 50G.)/%%"
	                    GS.gold+= 50
	                    GS.flag[387]= 1
	                } else  {
	                    GS.msg[0]= "\\W* \\RRED\\W - Try as you might^1,&  you continue to be your/"
	                    GS.msg[1]= "* (You are awarded 10G.)/%%"
	                    GS.gold+= 10
	                }
	            }
	            if(obj_iceflag.frame == 1) {
	                GS.msg[0]= "\\W* \\OORANGE\\W - You are the kind of&  person who rushes fists-first&  through all obstacles./"
	                GS.msg[1]= "* (You are awarded 5G.)/%%"
	                GS.gold+= 5
	            }
	            if(obj_iceflag.frame == 2) {
	                GS.msg[0]= "\\W* \\YYELLOW\\W - Your sure-fire&  accuracy put an end to&  the mayhem of " + chr(ord('"')) + "Ball." + chr(ord('"')) + "/"
	                GS.msg[1]= "* (You are awarded 3G.)/%%"
	                GS.gold+= 3
	            }
	            if(obj_iceflag.frame == 3) {
	                GS.msg[0]= "\\W* \\BBLUE\\W - Hopping and twirling^1,&  your original style&  pulled you through./"
	                GS.msg[1]= "* (You are awarded 2G.)/%%"
	                GS.gold+= 2
	            }
	            if(obj_iceflag.frame == 4) {
	                GS.msg[0]= "\\W* \\GGREEN\\W - Your concern and care&  for " + chr(ord('"')) + "Ball" + chr(ord('"')) + " led you to a&  delicious victory./"
	                GS.msg[1]= "* (You are awarded 1G.)/%%"
	                GS.gold++
	            }
	            if(obj_iceflag.frame == 5) {
	                GS.msg[0]= "\\W* \\PPURPLE\\W - Even when you felt&  trapped^1, you took notes and&  achieved the end of " + chr(ord('"')) + "Ball." + chr(ord('"')) + "/"
	                GS.msg[1]= "* (You are awarded 2G.)/%%"
	                GS.gold+= 2
	            }
	            if(obj_iceflag.frame == 6) {
	                GS.msg[0]= "\\W* \\LLIGHT BLUE\\W - " + chr(ord('"')) + "Ball" + chr(ord('"')) + " is " + chr(ord('"')) + "Small.^1" + chr(ord('"')) + "&* You waited^1, still^1, for&  this opportunity.../"
	                GS.msg[1]= "* ... then dethroned " + chr(ord('"')) + "Ball" + chr(ord('"')) + " with&  a sharp attack./"
	                GS.msg[2]= "* (You are awarded 4G.)/%%"
	                GS.gold+= 4
	            }
	        } else  GS.msg[0]= "* (This flag has nothing else&  to offer.)/%%"
	    } else  {
	        GS.msg[0]= "\\W* Ah^1! Wow^1! Woah^1!&* It\'s a " + chr(ord('"')) + "\\RHole\\W" + chr(ord('"')) + "./%%"
	        if(GS.flag[203] >= 16) GS.msg[0]= "* There\'s a hole here./%%"
	    }
	}
	if(room == 54) GS.msg[0]= "* (Hers.)/%%"
	if(room == 76) {
	    if(instance_exists(1025/* obj_papyrusparent */)) {
	        scr_papface(0, 0)
	        GS.msg[1]= "THIS IS MY BROTHER\'S&PET ROCK./"
	        GS.msg[2]= "\\E1HE ALWAYS FORGETS&TO FEED IT./"
	        GS.msg[3]= "\\E3AS USUAL^1, I HAVE&TO TAKE&RESPONSIBILITY./"
	        GS.msg[4]= "\\TS \\F0 \\T0 %"
	        GS.msg[5]= "* (The rock is covered in&  sprinkles.)/%%"
	    } else  GS.msg[0]= "* (This rock is covered in&  sprinkles.)/%%"
	    if(read > 0)
	        GS.msg[0]= "* (This rock is covered in&  sprinkles.)/%%"
	}
	if(room == 77) {
	    if(instance_exists(1025/* obj_papyrusparent */)) {
	        scr_papface(0, 0)
	        GS.msg[1]= "ISN\'T THAT FLAG&NEATO?/"
	        GS.msg[2]= "UNDYNE FOUND IT&AT THE BAY.../"
	        GS.msg[3]= "\\E3I THINK IT\'S FROM&THE HUMAN WORLD?/"
	        GS.msg[4]= "\\E0NOW^1, I KNOW&WHAT YOU\'RE&THINKING./"
	        GS.msg[5]= "\\E3WHY WOULD A&HUMAN FLAG.../"
	        GS.msg[6]= "HAVE A COOL&SKELETON ON IT?/"
	        GS.msg[7]= "WELL..^1.&I HAVE A THEORY./"
	        GS.msg[8]= "\\E3I THINK HUMANS.../"
	        GS.msg[9]= "\\E0MUST HAVE&DESCENDED FROM&SKELETONS!!!/"
	        GS.msg[10]= "NYEH HEH HEH!!!/%%"
	    } else  GS.msg[0]= "* (It\'s a beat-up pirate&  flag.)/%%"
	    if(read > 0) GS.msg[0]= "* (It\'s a beat-up pirate&  flag.)/%%"
	}
	if(room == 91) {
	    GS.msg[0]= "* Why did the humans attack^1?&* Indeed^1, it seemed that they&  had nothing to fear./"
	    GS.msg[1]= "* Humans are unbelievably strong.&* It would take the SOUL of&  nearly every monster.../"
	    GS.msg[2]= "* ... just to equal the power&  of a single human SOUL./%%"
	}
	if(room == 101) {
	    GS.msg[0]= "* This power has no counter.&* Indeed, a human cannot&  take a monster\'s SOUL./"
	    GS.msg[1]= "* When a monster dies, its&  SOUL disappears./"
	    GS.msg[2]= "* And an incredible power&  would be needed to take the&  SOUL of a living monster./%%"
	}
	if(room == 126) {
	    GS.msg[0]= "* There is only one way to&  reverse this spell./"
	    GS.msg[1]= "* If a huge power, equivalent&  to seven human SOULs, attacks&  the barrier.../"
	    GS.msg[2]= "* It will be destroyed./%%"
	}
	if(room == 110) {
	    GS.msg[0]= "* In the end, it could&  hardly be called a war./"
	    GS.msg[1]= "* United, the humans were too&  powerful, and us monsters,&  too weak./"
	    GS.msg[2]= "* Not a single SOUL was taken,&  and countless monsters were&  turned to dust.../%%"
	}
	if(room == 123) {
	    GS.msg[0]= "* I\'m catching bugs^1.&* But the underground doesn\'t&  have many.../"
	    GS.msg[1]= "* I keep catching the same&  one./%%"
	}
	if(room == 141) {
	    GS.msg[0]= "* (It\'s a computer.^1)&* (It\'s accessing some kind of&  puzzle in Snowdin.)/%%"
	    if(GS.plot < 126 and scr_murderlv() < 12)
	        GS.msg[0]= "* (It\'s too dark to see&  near the walls.)/%%"
	}
	if(room == 142) GS.msc= 643
	if(room == 154) {
	    GS.msg[0]= "* (It\'s an oven.^1)&* (It looks pretty modern.)/%%"
	    if(GS.plot < 134)
	        GS.msg[0]= "* (It\'s too dark to see&  near the walls.)/%%"
	    if(instance_exists(1173/* obj_mettaton_npc */)) {
	        GS.typer= 27
	        GS.msg[0]= "* OH YES^1! MTT-BRAND OVENS CAN &  REACH TEMPERATURES UP TO&  NINE-THOUSAND DEGREES!/"
	        GS.msg[1]= "* ROASTING^1! TOASTING^1! BURNING^1!&* CHARRING^1! YOU\'RE EXCITED^1,&  AREN\'T YOU^1, DARLING? (TM)/%%"
	    }
	    if(GS.plot == 134) {
	        GS.typer= 5
	        GS.msg[0]= "* (It\'s the oven.^1)&* (Looks like someone forgot&  to preheat it.)/%%"
	    }
	}
	if(room == 118) {
	    GS.typer= 37
	    GS.facechoice= 5
	    GS.faceemotion= 0
	    GS.msc= 0
	    if(x < 100) {
	        GS.msg[0]= "* You wanna see my&  room?/"
	        GS.msg[1]= "\\E3* TOO BAD^1!&* No nerds allowed!/"
	        GS.msg[2]= "\\E9* ... well^1, maybe some&  nerds.../%%"
	        if(read > 0) GS.msg[0]= "* You\'re being kind&  of creepy./%%"
	    }
	    if(x > 100) {
	        GS.msg[0]= "* I love how^1, um^1,&  thoughtful Papyrus&  is.../"
	        GS.msg[1]= "\\E2* But what the hell&  am I supposed to do&  with all these bones?/%%"
	    }
	}
	if(room == 170)
	    GS.msg[0]= "* (It\'s a spider donut.^1)&* (It looks more...^1)&* (Rubbery than usual.)/%%"
	if(room == 196)
	    GS.msg[0]= "* (North^1, the warrior\'s path.)&* (West^1, the sage\'s path.)&* (Any path leads to The End.)/%%"
	if(room == 202)
	    GS.msg[0]= "* (To the East^1!)&* (This is The End.)/%%"
	if(room == 245) {
	    GS.msg[0]= "* ENTRY NUMBER 2/"
	    GS.msg[1]= "* The barrier is locked by&  SOUL power../"
	    GS.msg[2]= "* Unfortunately^1, this power&  cannot be recreated&  artificially./"
	    GS.msg[3]= "* SOUL power can only be&  derived from what was&  once living./"
	    GS.msg[4]= "* So^1, to create more^1, we&  will have to use what we&  have now.../"
	    GS.msg[5]= "* The SOULs of monsters./%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	}
	if(room == 250) {
	    GS.msg[0]= "* ENTRY NUMBER 13/"
	    GS.msg[1]= "* one of the bodies opened&  its eyes./%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	}
	if(room == 251) GS.msg[0]= "* (The clock is broken.)/%%"
	if(room == 252) {
	    GS.msg[0]= "* ENTRY NUMBER 10/"
	    GS.msg[1]= "* experiments on the&  vessel are a failure./"
	    GS.msg[2]= "* it doesn\'t seem to be&  any different from the&  control cases./"
	    GS.msg[3]= "* whatever^1.&* they\'re a hassle to work&  with anyway./"
	    GS.msg[4]= "* the seeds just stick to&  you^1, and won\'t let go.../%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	}
	if(room == 254) {
	    GS.msg[0]= "* ENTRY NUMBER 16/"
	    GS.msg[1]= "* no No NO NO NO NO NO/%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	}
	if(room == 257) {
	    GS.msg[0]= "* (There are a bunch of VHSes.^1)&* (Seems like it\'s mostly&  cartoons of some kind.)/"
	    GS.msg[1]= "* (They seem to be alphabetized^1,&  save for a few stray...^1)&* (... sticky ones?)/%%"
	}
	if(room == 260) {
	    GS.msg[0]= "* ENTRY NUMBER 11/"
	    GS.msg[1]= "* now that mettaton\'s made it&  big^1, he never talks to&  me anymore./"
	    GS.msg[2]= "* ... except to ask when i\'m&  going to finish his body./"
	    GS.msg[3]= "* but i\'m afraid if i finish&  his body^1, he won\'t need me&  anymore.../"
	    GS.msg[4]= "* then we\'ll never be friends&  ever again./"
	    GS.msg[5]= "* ... not to mention^1, every time&  i try to work on it^1, i&  just get really sweaty.../%%"
	}
	if(room == 258) {
	    GS.msg[0]= "* ENTRY NUMBER 20/"
	    GS.msg[1]= "* ASGORE left me five&  messages today./"
	    GS.msg[2]= "* four about everyone being&  angry/"
	    GS.msg[3]= "* one about this cute teacup&  he found that looks like&  me/"
	    GS.msg[4]= "* thanks asgore./%%"
	    if(GS.flag[485] == 1)
	        GS.msg[0]= "* (It seems to be turned off.)/%%"
	    if(GS.flag[490] == 0)
	        GS.msg[0]= "* (It\'s too dark to see near&  the walls.)/%%"
	}
	if(room == 262) {
	    GS.msg[0]= "* (Seems to be turned off.)/%%"
	    if(GS.flag[485] == 1) {
	        GS.msg[0]= "* ENTRY NUMBER 18/"
	        GS.msg[1]= "* the flower\'s gone./%%"
	    }
	}
	if(room == 68) {
	    GS.msg[0]= "* (It\'s locked from the&  inside.)/%%"
	    if(instance_exists(1029/* obj_papyrus_houseoutside */) or instance_exists(1026/* obj_papyrus_room */)) {
	        scr_papface(0, 0)
	        GS.msg[1]= "PLEASE DON\'T ENTER&THE MYSTERIOUS&SHACK./%%"
	        if(instance_exists(1313/* obj_undyne_friendc */)) {
	            GS.msg[1]= "HELLO^1.&THAT\'S NOT&MY HOUSE./"
	            GS.msg[2]= "THAT\'S JUST MY&COOL TOOLSHED./"
	            scr_undface(3, 6)
	            GS.msg[4]= "* Do you call it&  your COOLSHED!?/"
	            scr_papface(5, 0)
	            GS.msg[6]= "NO!!^1!&I\'VE NEVER THOUGHT&OF THAT!!!/"
	            GS.msg[7]= "THAT\'S WHY WE\'RE&FRIENDS^1,&UNDYNE./"
	            GS.msg[8]= "YOU ENRICH MY&LIFE WITH SHED-&BASED PUNS./"
	            scr_undface(9, 9)
	            GS.msg[10]= "* That\'s the only&  one I\'ve ever&  made^1, dude./%%"
	        }
	        if(GS.flag[67] < 0) {
	            GS.msg[1]= "READY FOR ANOTHER&NIGHT IN THE&PUNISHMENT SHACK?/%%"
	            if(instance_exists(1313/* obj_undyne_friendc */)) {
	                GS.msg[1]= "READY FOR ANOTHER&NIGHT IN THE&PUNISHMENT SHACK?/"
	                scr_undface(2, 1)
	                GS.msg[3]= "* Oh my GOD^1, I don\'t&  even wanna KNOW./"
	                scr_papface(4, 0)
	                GS.msg[5]= "DON\'T BE SO&JUDGMENTAL^1,&UNDYNE./"
	                GS.msg[6]= "MY SHACK IS A&FOUR STAR&ESTABLISHMENT./"
	                scr_undface(7, 0)
	                GS.msg[8]= "* What^1, lemme guess./"
	                GS.msg[9]= "\\E6* Sometimes you cut a&  hot dog into the&  dog food^1, right?/"
	                scr_papface(10, 1)
	                GS.msg[11]= "WHAT!?!?/"
	                GS.msg[12]= "\\E0HOW\'D YOU KNOW?/"
	                scr_undface(13, 1)
	                GS.msg[14]= "* OH MY GOD^1! NO^1!&* I WAS JOKING!!^1!&* DON\'T DO THIS!!!/%%"
	            }
	        }
	        if(read > 0) GS.msg[1]= "YOU SHOULD LEARN&A PRIVACY./%%"
	    }
	}
	if(room == 73)
	    GS.msg[0]= "* (You can\'t go through the&  fire exit because you\'re&  not made of fire.)/%%"
	if(room == 78) GS.msg[0]= "* (It\'s an uncovered pillow.)/%%"
	if(room == 80)
	    GS.msg[0]= "* (You look in the drawer.^1)&* (There\'s some kind of badge.)/%%"
	if(room == 184)
	    GS.msg[0]= "* (It\'s a performance schedule.^1)&* (Comedians^1, dancers^1, Sans...^1)&* (Seems there\'s a break now.)/%%"
	if(room == 186) {
	    GS.msg[0]= "* (It\'s some sort of giant bottle&  of perfume.^1)&* (Eau de Rectangle.)/"
	    GS.msg[1]= "* (The cap is so comically large^1,&  you can\'t open it.)/%%"
	}
	if(room == 128) {
	    GS.msg[0]= "* (Feeling of being watched.)/%%"
	    if(GS.flag[7] == 1)
	        GS.msg[0]= "* (She\'s waiting for someone to&  let her out.)/%%"
	}
	if(room == 95) {
	    GS.msg[0]= "* (The gems on the southern&  wall shine in a&  spectacular pattern.)/"
	    GS.msg[1]= "* (It\'s a nice thing you can&  see the southern wall from&  this angle.)/%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	read++

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
