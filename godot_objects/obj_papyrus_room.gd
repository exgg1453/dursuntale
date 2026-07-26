# Auto-converted from GameMaker: obj_papyrus_room
# GM parent: obj_papyrusparent
extends CharacterBody2D

func _ready():
	dsprite= 1313
	usprite= 1325
	lsprite= 1330
	rsprite= 1328
	dtsprite= 1316
	utsprite= 1327
	ltsprite= 1334
	rtsprite= 1335
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	fun= 0
	dir= 0
	rid= 0
	if(GS.flag[67] == 1) {
	    instance_destroy()
	    exit
	} else  {
	    if(room == 68) {
	        dir= 1
	        if(GS.flag[88] >= 4 and GS.plot <= 105) {
	            instance_destroy()
	            exit
	        } else  {
	            if(GS.flag[354] == 2 and GS.flag[389] == 0) {
	                instance_destroy()
	                exit
	            } else  {
	                if(GS.flag[7] == 1) {
	                    instance_destroy()
	                    exit
	                } else  {
	                    if(GS.flag[389] >= 3) instance_create(x - 34, y - 14, 1313/* obj_undyne_friendc */)
	                }
	            }
	        }
	    }
	    if(room == 117) {
	        d= 0
	        if(GS.flag[354] < 2) d= 1
	        if(GS.flag[88] < 4) d= 1
	        if(GS.flag[389] > 0) d= 1
	        if(d == 1) {
	            instance_destroy()
	            exit
	        }
	    }
	    exit
	}

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 19
	GS.facechoice= 4
	GS.faceemotion= 0
	if(room == 59) {
	    GS.msg[0]= "MY BROTHER STARTED&A SOCK COLLECTION&RECENTLY./"
	    GS.msg[1]= "\\E3HOW SADDENING.../"
	    GS.msg[2]= "\\E0SOMETIMES I WONDER&WHAT HE WOULD&DO.../"
	    GS.msg[3]= "WITHOUT SUCH A&COOL GUY TAKING&CARE OF HIM???/"
	    GS.msg[4]= "NYEH HEH HEH!/%%"
	    if(instance_exists(1001/* obj_papyrus5 */) and x > obj_papyrus5.x - 100) {
	        sprite_index= dtsprite
	        GS.msg[0]= "SO^1, YOU WANT&A HINT^1, HUH?/"
	        GS.msg[1]= "\\E3WELL..^1.&I\'VE BEEN LOOKING&AT THE PUZZLE.../"
	        GS.msg[2]= "AND I THINK THE&SOLUTION.../"
	        GS.msg[3]= "\\E0IS TO TURN ALL&OF THE X\'S INTO&O\'S!/"
	        GS.msg[4]= "YOU SHOULD TRY&THAT!/"
	        GS.msg[5]= "ASK AGAIN FOR&MORE GREAT HINTS!/%%"
	        if(talkedto == 1) {
	            GS.msg[0]= "\\WMAYBE SOLVING&THE \\YLAST PUZZLE\\W &AGAIN WILL HELP./"
	            GS.msg[1]= "ASK AGAIN FOR&MORE GREAT HINTS!!/%%"
	        }
	        if(talkedto == 2) GS.msc= 692
	        if(talkedto > 2) GS.msc= 694
	    }
	}
	if(room == 117) {
	    dir= 1
	    d= 0
	    if(GS.plot < 122) d= 1
	    if(GS.flag[354] < 2) d= 1
	    if(GS.flag[67] == 1) d= 1
	    if(GS.flag[88] < 3) d= 1
	    if(GS.flag[350] == 1) d= 1
	    if(GS.flag[350] == 2) d= 1
	    if(GS.kills > 0) d= 1
	    if(d == 1) {
	        GS.msg[0]= "Error, Pepibs./%%"
	        if(GS.kills > 0) {
	            GS.msg[0]= "I ASKED UNDYNE&IF WE COULD&ALL HANG.../"
	            GS.msg[1]= "\\E3BUT SHE SAID&SOMETHING WEIRD./"
	            GS.msg[2]= "\\E0SHE SAID SHE&WON\'T HANG OUT&WITH A MURDERER./"
	            GS.msg[3]= "\\E3BUT..^1. HMM.../"
	            GS.msg[4]= "\\E5I DON\'T REMEMBER&MURDERERING&ANYONE.../"
	            GS.msg[5]= "\\E3THOUGH I AM A&PRETTY BRUTAL&KIND OF GUY./"
	            GS.msg[6]= "\\E3THEN SHE SAID&SOMETHING ABOUT&WANTING TO.../"
	            GS.msg[7]= "\\E1FIGHT SOME KIND&OF BAD GUY./"
	            GS.msg[8]= "\\E3BUT SHE SEEMS&VERY..^1. WEAK&FROM SOMETHING./"
	            GS.msg[9]= "\\E5SHE STEPPED OUT&AND COLLAPSED IN&THE DOORWAY./"
	            GS.msg[10]= "\\E0SO I\'M JUST&WAITING HERE IN&CASE SHE NEEDS ME./"
	            GS.msg[11]= "\\E3SINCE SHE HATES&BEING WAITED ON&HAND AND FOOT./"
	            GS.msg[12]= "\\E5I THINK WE\'LL&HAVE TO HANG&OUT LATER.../%%"
	            if(talkedto > 0) {
	                GS.msg[0]= "HEY^1, I.../"
	                GS.msg[1]= "\\E5REALLY DOUBT&WE\'RE GOING TO&BE ABLE TO HANG./"
	                GS.msg[2]= "\\E3IT\'S HARD TO&IMAGINE^1, BUT.../"
	                GS.msg[3]= "\\E0YOU\'LL HAVE TO&SPEND TIME WITH&NOT ME./%%"
	            }
	        }
	        if(GS.flag[350] == 1) {
	            GS.msg[0]= "HEY^1! READY TO&HANG OUT WITH&UNDYNE???/"
	            GS.msg[1]= "GREAT!!^1!&ME TOO!!!/"
	            GS.msg[2]= "\\E3HOWEVER^1, SHE\'S&NOT HERE./"
	            GS.msg[3]= "\\E0NORMALLY SHE&RETURNS AT ABOUT&THIS TIME./"
	            GS.msg[4]= "\\E3SHE\'S LATE&THOUGH.../"
	            GS.msg[5]= "\\E3AND SHE\'S NOT&ANSWERING HER&PHONE./"
	            GS.msg[6]= "\\E0HOW STRANGE./"
	            GS.msg[7]= "I\'LL JUST WAIT&HERE UNTIL SHE&GETS HOME./"
	            GS.msg[8]= "I\'LL CALL YOU&WHEN SHE GETS&HERE^1, OKAY!?/%%"
	            if(talkedto > 0)
	                GS.msg[0]= "NOPE!^1!&SHE ISN\'T HERE&YET!!!/%%"
	        }
	        if(GS.flag[350] == 2) {
	            GS.msg[0]= "UNDYNE\'S HOME^1,&BUT SHE ISN\'T&FEELING WELL./"
	            GS.msg[1]= "\\E5I DON\'T THINK WE&CAN HANG OUT./"
	            GS.msg[2]= "\\E3IT SEEMS LIKE SHE&CAUGHT HEAT-STROKE&OR SOMETHING./"
	            GS.msg[3]= "SOMEONE MUST HAVE&BROUGHT HER&BACK HOME.../"
	            GS.msg[4]= "\\E5BECAUSE SHE CAN&BARELY MOVE./"
	            GS.msg[5]= "\\E0BUT SHE IS&MUTTERING ABOUT&DESTROYING YOU./"
	            GS.msg[6]= "SO THAT\'S A GOOD&VITAL SIGN./"
	            GS.msg[7]= "\\E3IN ANY CASE^1, I&DON\'T THINK WE&CAN HANG OUT./"
	            GS.msg[8]= "\\E0I\'M JUST WAITING&HERE IN CASE&SHE NEEDS ME./"
	            GS.msg[9]= "SO^1, I GUESS YOU&CAN RUN ALONG./%%"
	            if(talkedto > 0)
	                GS.msg[0]= "UNDYNE IS SICK^1,&SO SHE CAN\'T&PLAY TODAY./%%"
	        }
	        if(GS.plot < 122) {
	            GS.msg[0]= "HEY^1! READY TO&HANG OUT WITH&UNDYNE???/"
	            GS.msg[1]= "GREAT!!^1!&BECAUSE SHE\'S NOT&EVEN HERE./"
	            GS.msg[2]= "BEING READY EARLY^1!&IT SHOWS HOW MUCH&YOU CARE!!/"
	            GS.msg[3]= "\\E3EVEN IF SHE\'S&NOT HERE TO SEE&THAT./%%"
	            if(talkedto > 0)
	                GS.msg[0]= "NOPE!^1!&SHE ISN\'T HERE&YET!!!/%%"
	        }
	    }
	    if(d == 0) {
	        GS.msc= 698
	        if(talkedto > 0) GS.msc= 700
	    }
	}
	if(room == 68) {
	    GS.msg[0]= "HELLO^1, MY FRIEND./"
	    GS.msg[1]= "WHAT BRINGS YOU&TO PAPYRUS TOWN?/%%"
	    if(GS.flag[354] == 0) {
	        GS.msg[0]= "HELLO..^1.&H-HOW ARE YOU^1,&MY F-FRIEND?/"
	        GS.msg[1]= "\\E5I\'M FEELING VERY&NOT SUSPICIOUS&TODAY./%%"
	    }
	    if(GS.flag[354] == 1) {
	        GS.msg[0]= "HEY^1, I HAVE A&GREAT IDEA./"
	        GS.msg[1]= "LET\'S HANG OUT&WITH UNDYNE&LATER./"
	        GS.msg[2]= "I\'LL CALL YOU&WHEN I\'M READY!/%%"
	    }
	    if(instance_exists(1313/* obj_undyne_friendc */)) {
	        GS.msg[0]= "I\'M SO GLAD YOU&AND UNDYNE ARE&FRIENDS NOW./"
	        GS.msg[1]= "YOU TWO GO&TOGETHER LIKE&PASTA AND BURNING!/%%"
	        if(GS.plot > 175) {
	            GS.msg[0]= "OH^1, HEY.../"
	            GS.msg[1]= "\\E3YOU\'RE LEAVING&SOON^1, RIGHT!?/"
	            GS.msg[2]= "\\E1DON\'T COME HERE&TO SAY GOODBYE!!/"
	            GS.msg[3]= "\\E3GOODBYES AREN\'T&ALLOWED IN MY&TOWN./"
	            GS.msg[4]= "\\E0JUST SEE-YOU-&LATERS./%%"
	        }
	        if(GS.flag[493] == 8) {
	            GS.msg[0]= "IT SEEMS UNDYNE&HAS SOMETHING&FOR YOU./"
	            GS.msg[1]= "SHE\'S THE PERSON&THAT\'S NOT ME./%%"
	        }
	        if(GS.flag[493] == 9) {
	            GS.msg[0]= "UNDYNE WRITES A&LOT OF LETTERS./"
	            GS.msg[1]= "\\E3BUT^1, SHE CAN NEVER&SEEM TO FIND THE&RIGHT WORDS./"
	            GS.msg[2]= "SO WHEN SHE GOES&TO DELIVER THEM&HERSELF.../"
	            GS.msg[3]= "SHE ALWAYS QUITS&SO SHE CAN GO&BACK AND REWRITE./"
	            GS.msg[4]= "\\E0THAT\'S WHY SHE&ASKED YOU!!/"
	            GS.msg[5]= "BECAUSE YOU HAVE&NO STANDARDS!!!/%%"
	        }
	        if(GS.flag[493] == 10) {
	            GS.msg[0]= "ALPHYS SEEMS TO&HAVE DISAPPEARED./"
	            GS.msg[1]= "DON\'T WORRY^1, THAT\'S&NORMAL./"
	            GS.msg[2]= "YOU SHOULD GO&TO HER LAB./"
	            GS.msg[3]= "I\'M SUPPOSED TO&PUT THESE&NUMBERS TOGETHER./%%"
	        }
	    }
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(fun == 0) {
	    if(instance_exists(775/* obj_face_papyrus */))
	        frame= obj_face_papyrus.frame
	    else  {
	        if(speed == 0 and path_speed == 0) frame= 0
	    }
	}
	if(dir == 1) scr_npcdir(1)

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
