# Auto-converted from GameMaker: obj_nicesnowman
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	myinteract= 0
	scale.x= 1
	scale.y= 1
	dt= 0
	if(GS.flag[253] == 1) {
	    sprite_index= 1297/* spr_sadsnowman_d1 */
	    frame= 0
	}
	if(GS.flag[253] == 2) {
	    sprite_index= 1297/* spr_sadsnowman_d1 */
	    frame= 1
	}
	if(GS.flag[253] >= 3) {
	    sprite_index= 1297/* spr_sadsnowman_d1 */
	    frame= 2
	}

func _on_destroy():
	myinteract= 3
	GS.msc= 226
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(GS.flag[7] == 1) {
	    GS.msc= 0
	    GS.msg[0]= "* Oh^1?&* About that piece I gave you?/"
	    GS.msg[1]= "* .../"
	    GS.msg[2]= "* ... I never gave you anything./%%"
	    scr_itemcheck(16)
	    scr_storagecheck(16)
	    if(GS.flag[56] == 1 or GS.flag[56] == 2) {
	        GS.msg[0]= "* Ah..^1. I can feel that piece&  of me has been well taken&  care of./"
	        GS.msg[1]= "* Thank you./"
	        GS.msg[1]= "* Hmmm...^1?&* The barrier\'s opened up?/"
	        GS.msg[2]= "* Hmmm..^1.&* Then^1, if it\'s not too much&  to ask.../"
	        GS.msg[3]= "* ... could you take that&  piece of me to the surface?/"
	        GS.msg[4]= "* I would really appreciate&  it./%%"
	    }
	    if((GS.flag[56] == 1 or GS.flag[56] == 2) and haveit == 0 and haveit2 == 0) {
	        GS.msg[0]= "* So^1, did you take that&  piece of me very far&  away...?/"
	        GS.msg[1]= "* .../"
	        GS.msg[2]= "* Where\'s the piece!?/%%"
	    }
	    if(GS.flag[56] == 4 or GS.flag[56] == 5) {
	        GS.msg[0]= "* Ah^1, the barrier\'s open...?/"
	        GS.msg[1]= "* You know I cannot move^1.&* Why are you telling me^1?&* To mock me?/"
	        GS.msg[2]= "* Everyone may think you are a&  good person^1, but this snowman&  knows the truth./"
	        GS.msg[3]= "* Someday^1, your friends will&  realize your heart is as&  cold as my butt./%%"
	    }
	}
	if(scr_murderlv() >= 2) {
	    GS.msc= 0
	    noroom= 0
	    if(GS.flag[253] <= 2) scr_itemget(16)
	    if(noroom == 1)
	        GS.msg[0]= "* (You\'re carrying too many&  items.)/%%"
	    else  {
	        if(GS.flag[253] == 0) {
	            GS.msg[0]= "* Hello^1.&* I am a snowman^1.&* I cannot move./"
	            GS.msg[1]= "* Traveller^1, if you could.../"
	            GS.msg[2]= "* (You got the Snowman Piece.)/%%"
	        }
	        if(GS.flag[253] == 1) {
	            GS.msg[0]= "* Oh me^1, oh my^1.&* What are you doing?/"
	            GS.msg[1]= "* Soon there won\'t be any&  of me left.../"
	            GS.msg[2]= "* (You got the Snowman Piece.)/%%"
	        }
	        if(GS.flag[253] == 2) {
	            GS.msg[0]= "* Stop..^1.&* Please.../"
	            GS.msg[1]= "* (You got the Snowman Piece.)/%%"
	        }
	        if(GS.flag[253] >= 3)
	            GS.msg[0]= "* (A useless pile of snow.)/%%"
	        dt= 1
	    }
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _process_end(delta: float):
	if(dt == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    dt= 0
	    GS.flag[253]++
	}
	if(GS.flag[253] == 1) {
	    sprite_index= 1297/* spr_sadsnowman_d1 */
	    frame= 0
	}
	if(GS.flag[253] == 2) {
	    sprite_index= 1297/* spr_sadsnowman_d1 */
	    frame= 1
	}
	if(GS.flag[253] >= 3) {
	    sprite_index= 1297/* spr_sadsnowman_d1 */
	    frame= 2
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
