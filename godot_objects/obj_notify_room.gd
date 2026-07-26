# Auto-converted from GameMaker: obj_notify_room
extends CharacterBody2D

func _ready():
	t= 0
	donotcall= 0
	ax= 0

func _process(delta: float):
	if(t == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    instance_destroy()
	    GS.interact= 0
	    if(donotcall == 0 and is_instance_valid(mb)) {
	        with(mb) instance_destroy()
	    }
	}

func _on_alarm_0_timeout():
	if(t == 0 and GS.interact == 0) {
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msc= 0
	    t= 1
	    if(GS.flag[368] == 1) donotcall= 1
	    if(room == 161) {
	        GS.msc= 754
	        if(GS.flag[409] == 1) donotcall= 1
	        GS.flag[409]= 1
	    }
	    if(room == 165 and ax == 0) {
	        if(GS.flag[369] < 25) {
	            if(GS.flag[369] < 24 and ax == 0) {
	                ax= 1
	                GS.msg[0]= "\\YALPHYS updated status.\\W &* oopswait how\'s the humnan&  doing/%%"
	                GS.flag[369]= 24
	            }
	            if(GS.flag[369] < 25 and ax == 0) {
	                if(GS.flag[67] == 1) donotcall= 1
	                ax= 1
	                GS.msg[0]= "\\YALPHYS updated status.\\W &* Top 10 Shows That Make You&  Forget To Do Your Frickin Job/%%"
	                GS.flag[369]= 25
	            }
	        } else  donotcall= 1
	    }
	    if(room == 164 and ax == 0) {
	        if(GS.flag[369] < 23) {
	            if(GS.flag[369] < 21 and ax == 0) {
	                ax= 1
	                GS.msg[0]= "\\YALPHYS updated status.\\W &* OMG? ppl think Mew Mew 2&  is better than Mew Mew 1?/"
	                GS.msg[1]= "* LOLLLLL that\'s a joke&  right.../%%"
	                GS.flag[369]= 21
	            }
	            if(GS.flag[369] < 22 and ax == 0) {
	                if(GS.flag[67] == 1) donotcall= 1
	                ax= 1
	                GS.msg[0]= "\\YALPHYS updated status.\\W &* omg... DONT THEY GET IT RUINS&  Mew Mew\'s ENTIRE CHARACTER ARC/%%"
	                GS.flag[369]= 22
	            }
	            if(GS.flag[369] < 23 and ax == 0) {
	                if(GS.flag[67] == 1) donotcall= 1
	                ax= 1
	                GS.msg[0]= "\\YALPHYS updated status.\\W &* My Mew Mew 2 Review:/"
	                GS.msg[1]= "* Mew Mew Kissy Cutie 2 Is&  Neither Kissy Nor Cutie.&* Its Trash. 0 stars/%%"
	                GS.flag[369]= 23
	            }
	        } else  donotcall= 1
	    }
	    if(room == 163 and ax == 0) {
	        if(GS.flag[369] < 20) {
	            GS.msg[0]= "\\YALPHYS updated status.\\W &* that\'s the last time i try&  to help with a puzzle lmao/%%"
	            GS.flag[369]= 20
	        } else  donotcall= 1
	    }
	    if(room == 159 and ax == 0) {
	        if(GS.flag[369] < 19) {
	            if(GS.flag[369] < 16 and ax == 0) {
	                ax= 1
	                GS.msg[0]= "\\YALPHYS posted a picture.\\W &* dinner with the girlfriend ;)/"
	                GS.msg[1]= "* (It\'s a picture of a catgirl&  figurine next to a bowl of&  instant noodles.)/%%"
	                GS.flag[369]= 16
	            }
	            if(GS.flag[369] < 17 and ax == 0) {
	                if(GS.flag[67] == 1) donotcall= 1
	                ax= 1
	                GS.msg[0]= "\\YCoolSkeleton95 posted a picture.\\W &* ARE WE POSTING HOT " + chr(ord('"')) + "PICS???" + chr(ord('"')) + "&* HERE IS ME AND MY COOL FRIEND/"
	                GS.msg[1]= "* (It\'s a picture of Papyrus&  flexing in front of a mirror.)&* (He is wearing sunglasses.)/"
	                GS.msg[2]= "* (Giant muscular biceps are&  pasted onto his arms.)/"
	                GS.msg[3]= "* (The biceps are also wearing&  sunglasses.)/%%"
	                GS.flag[369]= 17
	            }
	            if(GS.flag[369] < 18 and ax == 0) {
	                if(GS.flag[67] == 1) donotcall= 1
	                ax= 1
	                GS.msg[0]= "\\YALPHYS updated status.\\W &* LOL, CoolSkeleton95!&* ... that\'s a joke^1, right?/%%"
	                GS.flag[369]= 18
	            }
	            if(GS.flag[369] < 19 and ax == 0) {
	                if(GS.flag[67] == 1) donotcall= 1
	                ax= 1
	                GS.msg[0]= "\\YCoolSkeleton95 updated status.\\W &* THE ONLY JOKE HERE^1, IS&  HOW STRONG MY MUSCLES ARE./%%"
	                GS.flag[369]= 19
	            }
	        } else  donotcall= 1
	    }
	    if(room == 153) {
	        if(GS.flag[369] < 13) {
	            GS.msg[0]= "\\YALPHYS updated status.\\W &* whatever!!! i\'ll just explain&  it!!!/%%"
	            GS.flag[369]= 13
	        } else  donotcall= 1
	    }
	    if(room == 151 and ax == 0) {
	        if(GS.flag[369] < 12) {
	            ax= 1
	            GS.msg[0]= "\\YALPHYS updated status.\\W &* wonder if it would be unfun&  if i explained the puzzle.../%%"
	            GS.flag[369]= 12
	        } else  donotcall= 1
	    }
	    if(room == 148 and ax == 0) {
	        if(GS.flag[369] < 11) {
	            if(GS.flag[369] < 10) {
	                ax= 1
	                GS.msg[0]= "\\YALPHYS updated status.\\W &* Oh My God i Forgot to Tell&  THem Where To Go/%%"
	                GS.flag[369]= 10
	            } else  {
	                GS.msg[0]= "\\YALPHYS posted a picture.\\W &* CUte PIC OF ME RIGHT NOW ^0.^0 /"
	                GS.msg[1]= "* (It\'s a photo of a garbage can&  with several pink^1, glittery&  filters over it.)/%%"
	                GS.flag[369]= 11
	                ax= 1
	            }
	        } else  donotcall= 1
	    }
	    if(room == 147 and ax == 0) {
	        if(GS.flag[369] < 9) {
	            if(GS.flag[369] < 8) {
	                ax= 1
	                GS.msg[0]= "\\YALPHYS updated status.\\W &* OMG I DID IT!!!/"
	                GS.msg[1]= "* claws haven\'t shook like that&  since undyne called me to ask&  about the weather... v.v/%%"
	                GS.flag[369]= 8
	            } else  {
	                ax= 1
	                GS.msg[0]= "\\YALPHYS updated status.\\W &* WAIT THERE\'S NO WEATHER DOWN&  HERE WHY DID SHE CALL ME/%%"
	                GS.flag[369]= 9
	            }
	        } else  donotcall= 1
	    }
	    if(room == 145 and ax == 0) {
	        if(GS.flag[369] < 7) {
	            if(GS.flag[369] < 6) {
	                ax= 1
	                GS.msg[0]= "\\YALPHYS updated status.\\W &* I HATE USING THE PHONE I DON\'T&  WANT TO DO THIS LMAO ^0.^0 /%%"
	                GS.flag[369]= 6
	            } else  {
	                ax= 1
	                GS.msg[0]= "\\YALPHYS updated status.\\W &* omg ive had my claw over&  the last digit for 5 minutes/"
	                GS.msg[1]= "* omg i\'m just gonna do it&* i\'m just gonna call!!!!/%%"
	                GS.flag[369]= 7
	            }
	        } else  donotcall= 1
	    }
	    if(room == 143 and GS.flag[369] > 3) donotcall= 1
	    if(room == 144 and GS.flag[369] > 4) donotcall= 1
	    if(room == 144 and GS.flag[369] == 4) {
	        GS.msg[0]= "\\YALPHYS updated status.\\W &* gonna call them in a&  minute!!! =^0.^0=/%%"
	        GS.flag[369]= 5
	    }
	    if(room == 143 and GS.flag[369] == 3) {
	        GS.msg[0]= "\\YALPHYS updated status.\\W &* for now i gotta call up the&  human and guide them =^0.^0=/%%"
	        GS.flag[369]= 4
	    }
	    if(room == 143 and GS.flag[369] == 2) {
	        GS.msg[0]= "\\YALPHYS updated status.\\W &* well i know she\'s unbeatable&  i\'ll ask her abt it later ^0.^0 /%%"
	        GS.flag[369]= 3
	    }
	    if(room == 143 and GS.flag[369] < 2) {
	        GS.msg[0]= "\\YALPHYS updated status.\\W &* just realized i didn\'t watch&  undyne fight the human v.v/%%"
	        GS.flag[369]= 2
	    }
	    if(room == 97 and GS.flag[354] < 1) {
	        GS.msg[0]= " "
	        GS.flag[354]= 1
	        instance_create(380, 40, 1339/* obj_stalkerflowey */)
	        GS.msc= 632
	        if(GS.flag[368] == 1) donotcall= 1
	    }
	    if(room == 162 and GS.plot < 141) {
	        if(GS.flag[404] == 0)
	            GS.msg[0]= "\\YALPHYS updated status.\\W &* (PIC OF ME GIVING A THUMBS UP&  AS I BACKFLIP INTO THE SUN)/%%"
	        if(GS.flag[404] == 1)
	            GS.msg[0]= "\\YALPHYS updated status.\\W &* OH MY GOD HOW DID THAT EVEN&  END UP WORKING LMAO/%%"
	        GS.plot= 141
	        if(GS.flag[368] == 1) donotcall= 1
	    }
	    if(donotcall == 0) snd_play(103/* snd_textnoise */)
	    if(donotcall == 0) {
	        mb= instance_create(obj_mainchara.x, obj_mainchara.y - 10, 1338/* obj_musblcon */)
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
