# Auto-converted from GameMaker: obj_asgore_prebarrier_event
extends Node2D

func _ready():
	con= 0
	if(GS.plot > 207 or GS.flag[7] == 1) instance_destroy()
	else  {
	    if(GS.plot == 207) {
	        y= -100
	        con= 50
	        asg= instance_create(580, 120, 1322/* obj_asgore_actor */)
	    } else  {
	        asg= instance_create(180, 120, 1322/* obj_asgore_actor */)
	        asg.sprite_index= asg.dtsprite
	    }
	}
	scale.x= 3

func _process(delta: float):
	if(con == 1) {
	    GS.msc= 0
	    GS.typer= 60
	    GS.facechoice= 7
	    GS.faceemotion= 3
	    GS.msg[0]= "* How tense.../"
	    GS.msg[1]= "\\E2* Just think of it like.../"
	    GS.msg[2]= "\\E0* A visit to the dentist./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 2
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.plot= 207
	    con= 50
	    GS.interact= 0
	    asg.velocity.x= 3
	    asg.sprite_index= asg.rsprite
	    asg.image_speed= 0.2
	}
	if((con == 50 or con == 51 or con == 52) and asg.x > 580) {
	    asg.x= 580
	    asg.sprite_index= asg.utsprite
	    asg.frame= 0
	}
	if(con == 50 and obj_mainchara.x > 480 and GS.interact == 0) {
	    GS.interact= 1
	    GS.msc= 0
	    GS.typer= 60
	    GS.facechoice= 7
	    GS.faceemotion= 3
	    GS.msg[0]= "* Are you ready?/"
	    GS.msg[1]= "\\E3* If you are not^1, I&  understand./"
	    GS.msg[2]= "\\E2* I am not ready either./%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 51
	}
	if(con == 51 and asg.x == 580) {
	    GS.plot= 208
	    con= 52
	}
	if(con == 52 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 0
	    asg.sprite_index= asg.usprite
	    asg.image_speed= 0.25
	    asg.velocity.y= -2
	    asg.modulate.a-= 0.05
	    if(asg.modulate.a < 0.1) {
	        with(asg) instance_destroy()
	        instance_destroy()
	    }
	}

func _on_alarm_0_timeout():
	if(con == 0 and GS.interact == 0) {
	    GS.interact= 1
	    con= 1
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
