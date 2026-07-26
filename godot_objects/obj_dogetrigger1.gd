# Auto-converted from GameMaker: obj_dogetrigger1
extends Node2D

func _ready():
	if(GS.plot >= 42) instance_destroy()
	else  {
	    scale.y= 9999
	    conversation= 0
	    x-= 2
	}

func _on_destroy():
	if(conversation == 3) conversation= 4
	if(conversation == 5.6) conversation= 6
	if(conversation == 8) conversation= 9

func _process(delta: float):
	if(GS.flag[52] == 1) visible= 0
	if(conversation == 1) {
	    caster_pause(GS.currentsong)
	    GS.interact= 1
	    scale.y= 1
	    visible= 1
	    sprite_index= 1295/* spr_movedoge_o */
	    image_speed= 0.1
	    y= 140
	    velocity.y= -0.5
	    conversation= 2
	}
	if(conversation == 2 and y <= 120) {
	    y= 120
	    $Alarm0.start((20) / 30.0)
	    conversation= 3
	    velocity.y= 0
	}
	if(conversation == 4) {
	    GS.msg[0]= "* Did something move^1?&* Was it my imagination?/"
	    GS.msg[1]= "* I can only see moving&  things./"
	    GS.msg[2]= "* If something WAS moving..^1.&* For example^1, a human.../"
	    GS.msg[3]= "* I\'ll make sure it NEVER&  moves again!/%%"
	    if(scr_murderlv() >= 2) {
	        GS.msg[0]= "* Did something move^1?&* Was it my imagination?/"
	        GS.msg[1]= "* I can only see moving&  things./"
	        GS.msg[2]= "* H..^1. hey!&* I can\'t stop shivering&  all of a sudden./"
	        GS.msg[3]= "* Who..^1. who\'s there!?/%%"
	    }
	    scr_regulartext()
	    conversation= 5
	}
	if(conversation == 5 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.battlegroup= 23
	    GS.flag[200]= 0
	    GS.mercy= 1
	    instance_create(0, 0, 142/* obj_battler */)
	    conversation= 5.5
	}
	if(GS.plot == 41 and conversation == 5.5) {
	    GS.interact= 1
	    $Alarm0.start((11) / 30.0)
	    conversation= 5.6
	}
	if(conversation == 5.6) GS.interact= 1
	if(GS.plot == 41 and conversation == 6) {
	    caster_resume(GS.currentsong)
	    GS.mercy= 0
	    GS.interact= 1
	    if(GS.flag[52] == 1) {
	        GS.plot= 42
	        GS.interact= 0
	        instance_destroy()
	        exit
	    } else  {
	        if(GS.flag[52] == 0 or GS.flag[52] == 2) {
	            GS.msg[0]= "* S-S-S-Something pet me...&* Something that isn\'t&  m-m-moving.../"
	            GS.msg[1]= "* I\'m gonna need some dog&  treats for this!!!/%%"
	            if(GS.flag[52] == 2) {
	                GS.msg[0]= "* A stick appeared out of&  nowhere^1, then disappeared./"
	                GS.msg[1]= "* Was it a ghost stick?/"
	                GS.msg[2]= "* Did I just return it to&  the afterlife?/"
	                GS.msg[3]= "* I need some dog treats&  to think about this./%%"
	            }
	            conversation= 7
	            scr_regulartext()
	        }
	    }
	}
	if(conversation == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	    velocity.y= 1
	    $Alarm0.start((20) / 30.0)
	    conversation= 8
	}
	if(conversation == 9) {
	    velocity.y= 0
	    GS.plot= 42
	    GS.interact= 0
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(conversation == 0 and GS.interact == 0) {
	    conversation= 1
	    GS.interact= 1
	    y= 140
	}

func _on_outside_room():
	draw_self_custom(0, get_viewport_rect().size.x, 0, obj_dogehouse.y + 62)

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
