# Auto-converted from GameMaker: obj_blueattackgen
extends Node2D

func _ready():
	$Alarm0.start((20) / 30.0)
	t= 0
	vol= 1

func _gm_event_2_6():
	if(not instance_exists(782/* OBJ_WRITER */)) {
	    obj_papyrusboss.truefight= 1
	    with(blcon) instance_destroy()
	    caster_loop(GS.batmusic, 0.8, 1)
	    GS.turntimer= 2
	    instance_destroy()
	    GS.msg[0]= "* You\'re blue now."
	    obj_papyrusboss.dontcancel= 0
	    exit
	} else  {
	    $Alarm6.start((2) / 30.0)
	    exit
	}

func _gm_event_2_5():
	if(not instance_exists(651/* blt_sizebone */) and GS.invc < 1) {
	    GS.msg[0]= " YOU\'RE BLUE NOW./"
	    GS.msg[1]= " THAT\'S MY ATTACK!/"
	    GS.msg[2]= " NYEH HEH HEH& HEH HEH HEH& HEH HEH HEH!!!/%%"
	    GS.typer= 22
	    blcon= instance_create(x + 145, y + 52, 187/* obj_blconwdflowey */)
	    blconwd= instance_create(blcon.x + 15, blcon.y + 10, 784/* OBJ_NOMSCWRITER */)
	    GS.batmusic= GS.batmusic2
	    $Alarm6.start((2) / 30.0)
	    obj_papyrusboss.dontcancel= 1
	} else  $Alarm5.start((2) / 30.0)

func _gm_event_2_4():
	if(obj_heart.y > GS.idealborder[3] - 60) {
	    if(obj_heart.x > (GS.idealborder[0] + GS.idealborder[1]) / 2) {
	        bon= instance_create(GS.idealborder[1] + 10, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	        bon.velocity.x= -6
	    } else  {
	        bon= instance_create(GS.idealborder[0] - 10, GS.idealborder[3] - 20, 651/* blt_sizebone */)
	        bon.velocity.x= 6
	    }
	    $Alarm5.start((2) / 30.0)
	} else  $Alarm4.start((2) / 30.0)

func _gm_event_2_3():
	vol-= 0.05
	caster_set_volume(GS.batmusic, vol)
	if(vol < 0.06) caster_free(GS.batmusic)
	else  $Alarm3.start((2) / 30.0)

func _gm_event_2_2():
	obj_heart.movement= 2
	obj_heart.jumpstage= 2
	snd_play(28/* snd_bell */)
	obj_heart.sprite_index= 40/* spr_heartblue */
	obj_heart.velocity.y= -2
	$Alarm4.start((2) / 30.0)

func _gm_event_2_1():
	$Alarm3.start((2) / 30.0)
	$Alarm2.start((100) / 30.0)

func _on_destroy():
	if(GS.turntimer < 600) {
	    rsize= random(70)
	    rr= floor(random(2))
	    if(rr == 0) {
	        bb= instance_create(GS.idealborder[1] + 20, GS.idealborder[3] - 40 + rsize, 651/* blt_sizebone */)
	        bb.velocity.x= -3 - random(3)
	        bb.blue= 1
	        bb.dmg= 1
	    }
	    if(rr == 1) {
	        bb= instance_create(GS.idealborder[1] + 20, GS.idealborder[2] + 40 + rsize, 652/* blt_topbone */)
	        bb.velocity.x= -3 - random(3)
	        bb.blue= 1
	        bb.dmg= 1
	    }
	    $Alarm0.start((5 + random(20)) / 30.0)
	} else  $Alarm1.start((20) / 30.0)
	GS.turntimer+= 37

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
