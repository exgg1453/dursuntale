# Auto-converted from GameMaker: obj_nicecreamguy
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	myinteract= 0
	scale.x= 1
	scale.y= 1
	if(GS.flag[60] > 0 and room == 53) sprite_index= 1289/* spr_icecreamguy_happy */
	if(GS.flag[79] > 0 and room == 96) sprite_index= 1289/* spr_icecreamguy_happy */
	if(GS.plot >= 101 and room == 53) instance_destroy()
	if(GS.plot >= 121 and room == 96) instance_destroy()
	if(room == 181 and GS.flag[402] == 0) sprite_index= 1289/* spr_icecreamguy_happy */
	conversation= 0
	j= 0
	mouth= 0
	murder= 0
	if(scr_murderlv() >= 3) murder= 1
	if(GS.flag[27] == 1) murder= 0
	if(GS.flag[203] >= 16) murder= 1
	if(murder == 1) instance_destroy()

func _on_destroy():
	if(room == 53) {
	    if(GS.flag[60] == 0) {
	        myinteract= 3
	        GS.msc= 0
	        GS.typer= 5
	        GS.facechoice= 0
	        GS.faceemotion= 0
	        mouth= 1
	        GS.msg[0]= "* I don\'t understand why&  these aren\'t selling.../"
	        GS.msg[1]= "* It\'s the perfect weather&  for something cold.../%%"
	        mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	        conversation= 1
	    } else  {
	        instance_create(0, 0, 1525/* obj_golddisplay */)
	        myinteract= 3
	        GS.msc= 230
	        GS.typer= 5
	        GS.facechoice= 0
	        GS.faceemotion= 0
	        GS.msg[0]= "* You must have something better to do than read this message./%%"
	        mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    }
	}
	if(room == 96 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(GS.flag[79] == 0) {
	        myinteract= 3
	        GS.msc= 0
	        GS.typer= 5
	        GS.facechoice= 0
	        GS.faceemotion= 0
	        mouth= 1
	        GS.msg[0]= "* I relocated my store^1, but&  there are still no&  customers.../%%"
	        mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	        conversation= 1
	    } else  {
	        instance_create(0, 0, 1525/* obj_golddisplay */)
	        myinteract= 3
	        GS.msc= 232
	        GS.typer= 5
	        GS.facechoice= 0
	        GS.faceemotion= 0
	        GS.msg[0]= "* You must have something better to do than read this message./%%"
	        mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    }
	}
	if(room == 181) {
	    if(GS.flag[402] == 1) {
	        if(GS.flag[250] == 0) {
	            myinteract= 3
	            GS.msc= 0
	            GS.typer= 5
	            GS.facechoice= 0
	            GS.faceemotion= 0
	            mouth= 1
	            GS.msg[0]= "* I thought for sure if I&  went to Hotland^1, I\'d sell&  some Nice Creams./"
	            GS.msg[1]= "* But nobody wants them^1.&* Everyone\'s just eating&  Starfaits and Glamburgers./"
	            GS.msg[2]= "* So!!!/%%"
	            mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	            conversation= 1
	        } else  {
	            instance_create(0, 0, 1525/* obj_golddisplay */)
	            myinteract= 3
	            GS.msc= 273
	            GS.typer= 5
	            GS.facechoice= 0
	            GS.faceemotion= 0
	            GS.msg[0]= "* You must have something better to do than read this message./%%"
	            mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	        }
	    } else  {
	        GS.msc= 0
	        myinteract= 3
	        GS.typer= 5
	        GS.facechoice= 0
	        GS.faceemotion= 0
	        if(GS.flag[250] >= 1)
	            GS.msg[0]= "* I\'m so happy!^1!&* Nice Cream is really&  changing the world!!/%%"
	        if(GS.flag[250] == 0) {
	            GS.msg[0]= "* Hey^1!&* It\'s you again^1!/"
	            GS.msg[1]= "* Business is excellent here^1!&* These two fellas bought&  ALL my ice cream!/"
	            GS.msg[2]= "* I\'ve actually sold out of&  everything!!!/"
	            GS.msg[3]= "* ... sorry./"
	            GS.msg[4]= "* Wait^1!&* I\'ve still got something&  for you!/"
	            GS.msg[5]= "* ... a big smile^1!&* How about that!/%%"
	            GS.flag[250]= 1
	        }
	        if(GS.flag[7] == 1) {
	            GS.msg[0]= "* I\'m so excited to sell&  Nice Cream on the surface!/"
	            if(GS.flag[60] <= 10) {
	                GS.msg[1]= "* If all humans are like you^1,&  then...!/"
	                GS.msg[2]= "* ... then I\'ll still be&  able to sell to monsters^1,&  I hope./%%"
	            }
	            if(GS.flag[60] > 10)
	                GS.msg[1]= "* If all humans are like you^1,&  I think it\'ll be a modest&  success!/%%"
	            if(GS.flag[60] > 40)
	                GS.msg[1]= "* If all humans are like you^1,&  I think it\'ll be really&  popular!/%%"
	        }
	        mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    }
	}

func _process_begin(delta: float):
	if(conversation == 1 and not instance_exists(779/* obj_dialoguer */)) {
	    GS.interact= 1
	    frame= 0
	    image_speed= 0.1
	    sprite_index= 1288/* spr_icecreamguy_anim */
	    conversation= 2
	}
	if(conversation == 2) {
	    GS.interact= 1
	    j++
	}
	if(conversation == 2 and j > 30) {
	    GS.interact= 1
	    sprite_index= 1289/* spr_icecreamguy_happy */
	    image_speed= 0
	    GS.msc= 0
	    GS.typer= 5
	    myinteract= 3
	    GS.msg[0]= "* OH!!!^1!&* A CUSTOMER!!!/%%"
	    if(room == 96) {
	        GS.msg[0]= "* Fortunately^1, I\'ve thought&  of a solution!!/"
	        GS.msg[1]= "* Punch cards!!/"
	        GS.msg[2]= "* Every time you buy a&  Nice Cream^1, you can take a&  punch card from the box./"
	        GS.msg[3]= "* If you have 3 cards^1, you&  can trade them for a&  free Nice Cream!/"
	        GS.msg[4]= "* They\'re sure to get the&  customers to come back!/%%"
	        GS.msg[5]= "* Anyway.../%%"
	    }
	    if(room == 181) {
	        sprite_index= 1287/* spr_icecreamguy_sad */
	        GS.msg[0]= "* I\'m having a going out of&  business sale./%%"
	    }
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 3
	}
	if(conversation == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    instance_create(0, 0, 1525/* obj_golddisplay */)
	    GS.interact= 1
	    myinteract= 3
	    GS.msc= 230
	    if(room == 96) GS.msc= 232
	    if(room == 181) GS.msc= 273
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.faceemotion= 0
	    GS.msg[0]= "* You must have something better to do than read this message./%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    conversation= 4
	    GS.flag[60]= 1
	    if(room == 96) GS.flag[79]= 8
	    if(room == 181) GS.flag[250]= 1
	}
	if(myinteract == 3 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.halt == 0) image_speed= 0.2
	    else  image_speed= 0
	}
	if(myinteract == 0 or not instance_exists(782/* OBJ_WRITER */)) {
	    image_speed= 0
	    frame= 0
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
