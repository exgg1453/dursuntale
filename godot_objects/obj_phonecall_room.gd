# Auto-converted from GameMaker: obj_phonecall_room
extends CharacterBody2D

func _ready():
	t= 0
	scale.y= 5
	donotcall= 0
	if(room == 88 and GS.plot > 106) instance_destroy()
	if(room == 97 and GS.flag[354] > 0) instance_destroy()
	if(room == 136 and GS.flag[354] > 1) instance_destroy()
	if(room == 145 and GS.plot > 129) instance_destroy()
	if(room == 147 and GS.plot > 130) instance_destroy()
	if(room == 148 and GS.plot > 131) instance_destroy()
	if(room == 149 and GS.flag[373] == 1) {
	    obj_bluelaser_o.active= 2
	    instance_destroy()
	}
	if(room == 162 and GS.plot > 138) instance_destroy()
	if(room == 153 and GS.plot >= 133.5) instance_destroy()
	if(room == 155 and GS.plot >= 137) instance_destroy()
	if(room == 188 and GS.plot > 175) instance_destroy()
	if(room == 189 and GS.plot > 176) instance_destroy()
	if(room == 190 and GS.flag[415] == 1) instance_destroy()
	if(room == 190 and GS.plot > 180) instance_destroy()
	if(room == 192 and GS.plot >= 180) instance_destroy()
	if(room == 193 and GS.plot > 181) instance_destroy()
	if(room == 195 and GS.plot > 182) instance_destroy()
	if(room == 196 and GS.plot > 184) instance_destroy()
	if(room == 171 and GS.plot >= 163) instance_destroy()
	if(room == 115) {
	    scale.y= 1
	    if(GS.flag[493] != 10) instance_destroy()
	}

func _gm_event_2_1():
	scale.x= 4
	scale.y= 1

func _process(delta: float):
	if(t == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    exception= 0
	    if(exception == 0) instance_destroy()
	    GS.interact= 0
	    if(room == 149) {
	        snd_play(132/* snd_switchpull_n */)
	        obj_bluelaser_o.active= 2
	        instance_destroy()
	    }
	}

func _on_alarm_0_timeout():
	if(t == 0 and GS.interact == 0) {
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msc= 0
	    t= 1
	    if(room == 196 and GS.plot < 185) {
	        GS.plot= 185
	        GS.flag[416]= 1
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E6 \\F6 \\TA %"
	        GS.msg[2]= "* OK^1!&* Y-you should..^1.&* You should.../"
	        GS.msg[3]= "* Head to the..^1.&* Head to the.../"
	        GS.msg[4]= "\\E9* I..^1. I.../"
	        GS.msg[3]= "\\E9* I don\'t know?/"
	        GS.msg[4]= "\\E8* This doesn\'t look&  like my map&  at all.../"
	        GS.msg[5]= "\\E9* I\'m sorry..^1.&* I..^1. I.../"
	        GS.msg[6]= "\\E8* I have to go./"
	        GS.msg[7]= "\\TS \\F0 \\T0 %"
	        GS.msg[8]= "* Click.../%%"
	        if(GS.flag[367] == 1) donotcall= 1
	    }
	    if(room == 195 and GS.plot < 183) {
	        GS.plot= 183
	        obj_powerlaser_event.con= 10
	        if(GS.flag[367] == 1) donotcall= 1
	    }
	    if(room == 193 and GS.flag[416] == 0 and x > 140) {
	        GS.flag[416]= 1
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	        GS.msg[2]= "* W-wait^1!&* No^1, I think you&  should h-head up!/"
	        GS.msg[3]= "\\TS \\F0 \\T0 %"
	        GS.msg[4]= "* Click.../%%"
	        if(GS.flag[367] == 1) donotcall= 1
	    }
	    if(room == 193 and GS.plot < 182 and x < 140) {
	        GS.plot= 182
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	        GS.msg[2]= "* A crossroads..^1.&* Uhh.../"
	        GS.msg[3]= "* Uhhh.../"
	        GS.msg[4]= "\\E6* Tr..^1.&* Try heading to the&  right!/"
	        GS.msg[5]= "\\TS \\F0 \\T0 %"
	        GS.msg[6]= "* Click.../%%"
	        if(GS.flag[367] == 1) donotcall= 1
	    }
	    if(room == 192 and GS.plot < 180) {
	        GS.plot= 180
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	        GS.msg[2]= "* Looks like you can\'t&  proceed until you&  hit the switch./"
	        GS.msg[3]= "* B-but^1, those lasers&  will activate when&  you do./"
	        GS.msg[4]= "\\E6* Ummm..^1.&* Looks like they\'ll&  come in this order:/"
	        GS.msg[5]= "\\W* \\OOrange\\W. \\OOrange\\W. \\LBlue\\W./"
	        GS.msg[6]= "* G-got it^1?&* Move until the&  third one!/"
	        GS.msg[7]= "\\TS \\F0 \\T0 %"
	        GS.msg[8]= "* Click.../%%"
	        if(GS.flag[367] == 1) donotcall= 1
	    }
	    if(room == 190 and GS.flag[415] == 0) {
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E6 \\F6 \\TA %"
	        GS.msg[2]= "* Alright^1, now just&  keep heading&  up!/"
	        GS.msg[3]= "\\E6* .../"
	        GS.msg[4]= "\\E3* ..^1.&* That pit..^1.&* Isn\'t on my map./"
	        GS.msg[5]= "\\E6* Forget it^1!&* Let\'s try the&  left side!/"
	        GS.msg[6]= "\\TS \\F0 \\T0 %"
	        GS.msg[7]= "* Click.../%%"
	        if(GS.flag[414] == 0) {
	            GS.msg[0]= "* Ring.../"
	            GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	            GS.msg[2]= "* H-hey^1, aren\'t&  you gonna use&  the elevator?/"
	            GS.msg[3]= "\\E6* I guess you can&  go this way!/"
	            GS.msg[4]= "\\E3* .../"
	            GS.msg[5]= "* If there wasn\'t&  a huge pit in&  the way...?/"
	            GS.msg[6]= "\\TS \\F0 \\T0 %"
	            GS.msg[7]= "* Click.../%%"
	        }
	        if(GS.plot > 178) {
	            GS.msg[0]= "* Ring.../"
	            GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	            GS.msg[2]= "* Wh..^1. where\'d this&  pit come from?/"
	            GS.msg[3]= "\\E8* You should be able&  to walk across&  here.../"
	            GS.msg[4]= "\\TS \\F0 \\T0 %"
	            GS.msg[5]= "* Click.../%%"
	        }
	        GS.flag[415]= 1
	        if(GS.flag[367] == 1) donotcall= 1
	    }
	    if(room == 189 and GS.plot < 177) {
	        GS.plot= 177
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E6 \\F6 \\TA %"
	        GS.msg[2]= "* Ready^1?&* This is it!/"
	        GS.msg[3]= "* Take the elevator&  up to the top&  of the CORE!/"
	        GS.msg[4]= "\\TS \\F0 \\T0 %"
	        GS.msg[5]= "* Click.../%%"
	        if(GS.flag[367] == 1) donotcall= 1
	    }
	    if(room == 172) {
	        if(GS.flag[369] < 26) {
	            GS.flag[369]= 26
	            GS.msc= 837
	            GS.msg[0]= "* Ring.../%%"
	            if(GS.flag[367] == 1) donotcall= 1
	        } else  donotcall= 1
	    }
	    if(room == 171) {
	        if(GS.plot < 163) {
	            GS.plot= 163
	            GS.msg[0]= "* Ring.../"
	            GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	            GS.msg[2]= "* Hi^1, Alphys here!/"
	            GS.msg[3]= "* This room is like&  the room we saw&  before./"
	            GS.msg[4]= "* There are two puzzles&  to the north and&  south.../"
	            GS.msg[5]= "* You\'ll have to solve&  them both to proceed!/"
	            GS.msg[6]= "\\E2* .../"
	            GS.msg[7]= "\\E0* A-also... I\'d like&  to say!/"
	            GS.msg[8]= "\\E3* I don\'t really...&* Like giving away&  puzzle solutions./"
	            GS.msg[9]= "\\E6* But if you need&  help^1, just call&  me^1, ok?/"
	            GS.msg[10]= "\\E3* Actually^1, wait^1, I&  have an idea!/"
	            GS.msg[11]= "\\E0* Let\'s be friends&  on UnderNet!/"
	            GS.msg[12]= "\\E7* Then you can just&  ping me when you&  need help!/"
	            GS.msg[13]= "\\E0* .../"
	            GS.msg[14]= "\\E4* Wait^1, we\'re already&  friends^1, aren\'t we?/"
	            GS.msg[15]= "\\E5* I signed you up^1,&  didn\'t I?/"
	            GS.msg[16]= "\\E5* You\'ve been reading&  my posts the whole&  time.../"
	            GS.msg[17]= "\\E6* Well^1! I hope^1!&  You agree with me^1!&* About Mew Mew 2!/"
	            GS.msg[18]= "\\TS \\F0 \\T0 %"
	            GS.msg[19]= "* Click.../%%"
	            if(GS.flag[367] == 1) donotcall= 1
	        } else  donotcall= 1
	    }
	    if(room == 167) {
	        if(GS.plot < 162) {
	            GS.plot= 162
	            GS.msc= 684
	            if(GS.flag[367] == 1) donotcall= 1
	        } else  donotcall= 1
	    }
	    if(room == 163) {
	        if(GS.plot < 143) {
	            GS.msc= 0
	            GS.plot= 143
	            GS.msg[0]= "* Ring.../"
	            GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	            GS.msg[2]= "* Uh^1, h-h-hey!/"
	            GS.msg[3]= "\\E0* I\'m going to the&  bathroom^1, so I\'ll&  be MIA for a bit./"
	            GS.msg[4]= "* I\'m..^1. I\'m sure you&  can handle this&  puzzle yourself!/"
	            GS.msg[5]= "\\TS \\F0 \\T0 %"
	            GS.msg[6]= "* Click.../%%"
	            if(GS.flag[367] == 1) donotcall= 1
	        } else  donotcall= 1
	    }
	    if(room == 155 and GS.plot < 137) {
	        if(GS.plot < 137) {
	            GS.msc= 0
	            GS.msg[0]= "* Ring.../"
	            GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	            GS.msg[2]= "* S-see that building in&  the distance?/"
	            GS.msg[3]= "\\E0* That\'s the CORE^1.&* The source of all power&  for the underground./"
	            GS.msg[4]= "\\E6* It converts geothermal&  energy into magical&  electricity^1, by.../"
	            GS.msg[5]= "\\E3* Uhh^1, anyway^1, that\'s&  where we\'re going to&  go./"
	            GS.msg[6]= "\\E0* In the CORE is an&  elevator directly to&  ASGORE\'s castle./"
	            GS.msg[7]= "\\E0* And from there..^1.&* You can go home./"
	            GS.msg[8]= "\\TS \\F0 \\T0 %"
	            GS.msg[9]= "* Click.../%%"
	            GS.plot= 137
	        } else  donotcall= 1
	        if(GS.flag[367] == 1) donotcall= 1
	    }
	    if(room == 153 and GS.plot < 133.5) {
	        GS.plot= 133.5
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	        GS.msg[2]= "* Uuuh^1, I think...&* Umm.../"
	        GS.msg[3]= "\\E6* Hey^1!&* About the puzzles on&  the left and right...!/"
	        GS.msg[4]= "\\E6* They\'re a bit difficult&  to explain^1, but.../"
	        GS.msg[5]= "\\E4* ... uhhh^1, you already&  s-solved them?/"
	        GS.msg[6]= "\\E5* Awesome!/"
	        GS.msg[7]= "\\TS \\F0 \\T0 %"
	        GS.msg[8]= "* Click.../%%"
	        if(GS.flag[367] == 1) donotcall= 1
	    }
	    if(room == 149 and GS.flag[373] == 0) {
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	        GS.msg[2]= "* Alphys^1! Here!/"
	        GS.msg[3]= "\\E6* Th-that blue laser&  seems totally&  impassable!/"
	        GS.msg[4]= "\\E3* B-b-but!/"
	        GS.msg[5]= "\\E6* As the Royal Scientist^1,&  I h-have some tricks&  up my sleeve!/"
	        GS.msg[6]= "* I\'ll h-hack into th-the&  Hotland laser database&  and take it out!/"
	        GS.msg[7]= "\\TS \\F0 \\T0 %"
	        GS.msg[8]= "* Click.../%%"
	        if(GS.flag[372] == 1) {
	            GS.msg[0]= "* Ring.../"
	            GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	            GS.msg[2]= "* A-another laser^1,&  huh?/"
	            GS.msg[3]= "\\E8* I\'m sorry^1, I won\'t&  play around this&  time./"
	            GS.msg[4]= "\\E6* Hold on a second!!/"
	            GS.msg[5]= "\\TS \\F0 \\T0 %"
	            GS.msg[6]= "* Click.../%%"
	        }
	        GS.flag[373]= 1
	        if(GS.flag[367] == 1) donotcall= 1
	    }
	    if(room == 148 and GS.plot < 132) {
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E0 \\F6 \\TA %"
	        GS.msg[2]= "\\E0* Your next location&  is that door up&  north./"
	        GS.msg[3]= "* But^1! It\'s locked by&  two switched to the&  east and west./"
	        GS.msg[4]= "* So!!^1!&* Head to those rooms&  first!!!/"
	        GS.msg[5]= "\\E6* I.M.O!!!!/"
	        GS.msg[6]= "\\E1* .../"
	        GS.msg[7]= "\\E0* Acronyms kind of lose&  their punch out&  loud^1, huh?/"
	        GS.msg[8]= "\\TS \\F0 \\T0 %"
	        GS.msg[9]= "* Click.../%%"
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E6 \\F6 \\TA %"
	        GS.msg[2]= "\\E6* A-A-Alphys here!!!!/"
	        GS.msg[3]= "\\E3* Th..^1. the northern door&  will stay locked until&  you.../"
	        GS.msg[4]= "* S-solve the puzzles on&  the right and left!/"
	        GS.msg[5]= "\\E0* I..^1. I think you&  sh-should g-g-go to the&  right first!/"
	        GS.msg[6]= "\\TS \\F0 \\T0 %"
	        GS.msg[7]= "* Click.../%%"
	        GS.plot= 132
	        if(GS.flag[367] == 1) donotcall= 1
	    }
	    if(room == 147 and GS.plot < 131) {
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E4 \\F6 \\TA %"
	        GS.msg[2]= "\\E4* H..^1. h..^1. hi.../"
	        GS.msg[3]= "\\E0* It\'s me..^1. Dr. Alphys..^1.&* I said I would&  guide you...?/"
	        GS.msg[4]= "\\E4* But^1, um^1, I\'m not&  very good at talking&  on the phone./"
	        GS.msg[5]= "\\E0* Errrr^1, anyway!&* See those lasers?/"
	        GS.msg[6]= "* Try to remember your&  elementary bullet&  pattern class./"
	        GS.msg[7]= "\\W* \\OOrange attacks\\W can\'t&  hurt you if you\'re&  moving./"
	        GS.msg[8]= "\\W* \\LBlue attacks\\W can\'t&  hurt you if you\'re&  standing still./"
	        GS.msg[9]= "* These lasers are the&  same way!/"
	        GS.msg[10]= "\\E3* It\'s^1, it\'s sort of like&  that episode where&  they.../"
	        GS.msg[11]= "\\TS*\\E2 (Crash^1! Bang^1! Boom!)/"
	        GS.msg[12]= "\\TA*\\E4 Uhhhhh^1, gotta go^1!&* Talk to you later!/"
	        GS.msg[13]= "\\TS \\F0 \\T0 %"
	        GS.msg[14]= "* Click.../%%"
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E3 \\F6 \\TA %"
	        GS.msg[2]= "* Uhh^1!&* H-hi^1, so^1, the blue&  lasers.../"
	        GS.msg[3]= "\\E4* Uhh^1!&* I mean^1, Alphys here^1!&* Hi!/"
	        GS.msg[4]= "\\W*\\E6 The \\Lblue lasers\\W won\'t&  hurt you if you don\'t&  move!/"
	        GS.msg[5]= "\\W*\\E3 \\OO-orange\\W ones^1, um..^1.&* Y-you have to be&  moving^1, and they.../"
	        GS.msg[6]= "\\E4* Um^1, they won\'t^1, um.../"
	        GS.msg[7]= "\\E6* Move through those&  ones!/"
	        GS.msg[8]= "\\E1* .../"
	        GS.msg[9]= "\\E5* Uhh^1, bye!/"
	        GS.msg[10]= "\\TS \\F0 \\T0 %"
	        GS.msg[11]= "* Click.../%%"
	        GS.plot= 131
	        GS.flag[462]= 0
	        if(GS.flag[367] == 1) donotcall= 1
	    }
	    if(room == 145 and GS.plot < 130) {
	        GS.msg[0]= "* Ring..^1. Ring.../"
	        GS.msg[1]= "* Click...?/"
	        GS.msg[2]= "* (Whoever was calling hung up&  before you answered it.)/%%"
	        GS.plot= 130
	        if(GS.flag[367] == 1) donotcall= 1
	    }
	    if(room == 88 and GS.plot < 107) {
	        GS.msg[0]= " "
	        GS.plot= 107
	        instance_create(40, 340, 1339/* obj_stalkerflowey */)
	        GS.msc= 553
	        if(GS.flag[67] == 1) donotcall= 1
	    }
	    if(room == 97 and GS.flag[354] < 1) {
	        GS.msg[0]= " "
	        GS.flag[354]= 1
	        instance_create(380, 40, 1339/* obj_stalkerflowey */)
	        GS.msc= 632
	        if(GS.flag[67] == 1) donotcall= 1
	    }
	    if(room == 136 and GS.flag[354] < 2) {
	        GS.msg[0]= " "
	        GS.flag[354]= 2
	        GS.msc= 633
	        if(GS.flag[67] == 1) donotcall= 1
	        if(instance_exists(1118/* obj_undynea_chaser */))
	            obj_undynea_chaser.con= 20
	    }
	    if(room == 115 and GS.flag[493] == 10) {
	        GS.msg[0]= "* Ring.../"
	        scr_papface(1, 0)
	        GS.msg[2]= "HOWDY!/"
	        GS.msg[3]= "IF IT ISN\'T MY&GOOD FRIEND^1,&WHO TRUSTS ME./"
	        GS.msg[4]= "THIS IS PAPYRUS^1.&YOUR ALSO&MUTUAL FRIEND./"
	        GS.msg[5]= "\\E3ALPHYS AND I&FINISHED OUR&TRAINING EARLY./"
	        GS.msg[6]= "\\E5VERY EARLY./"
	        GS.msg[7]= "\\E3SO I SENT HER&HOME./"
	        GS.msg[8]= "\\E5VERY HOME./"
	        GS.msg[9]= "\\E3UH... NOW./"
	        GS.msg[10]= "\\E0I FEEL STRONGLY&AND FOR NO&APPARENT REASON./"
	        GS.msg[11]= "\\E3YOU SHOULD ALSO&GO..^1. THERE./"
	        GS.msg[12]= "\\E0TO HER^1.&LAB..^1. HOUSE./"
	        GS.msg[13]= "I HAVE ONLY&GOOD FEELINGS&ABOUT THIS./"
	        GS.msg[14]= "\\E5GOODBYE./"
	        GS.msg[15]= "\\TS \\F0 \\T0 %"
	        GS.msg[16]= "* Click.../%%"
	        if(GS.flag[67] == 1) donotcall= 1
	        GS.flag[492]= 0
	        GS.flag[493]= 11
	    }
	    if(room == 162 and GS.plot < 139) {
	        GS.msg[0]= "* Ring.../"
	        GS.msg[1]= "\\TS \\E4 \\F6 \\TA %"
	        GS.msg[2]= "\\E3* H..^1. hi...^1!&* It\'s Dr. Alphys./"
	        GS.msg[3]= "\\E0* This p-puzzle is&  kinda..^1. um..^1. timing-&  based./"
	        GS.msg[4]= "\\E3* Y-you see those&  switches over there?/"
	        GS.msg[5]= "\\E0* Y-you\'ll have to press&  all three of them&  within 3 seconds./"
	        GS.msg[6]= "\\E6* I\'ll t-try to help&  you with the&  rhythm!/"
	        GS.msg[7]= "\\TS \\F0 \\T0 %"
	        GS.msg[8]= "* Click.../%%"
	        GS.plot= 139
	        if(GS.flag[367] == 1) donotcall= 1
	    }
	    if(donotcall == 0) snd_play(104/* snd_phone */)
	    if(donotcall == 0) {
	        instance_create(0, 0, 779/* obj_dialoguer */)
	        GS.interact= 1
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
