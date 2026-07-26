# Auto-converted from GameMaker: obj_asgore_spearswipegen
extends Node2D

func _ready():
	scale.x= 2
	scale.y= 2
	frame= 0
	image_speed= 0
	typeno= 0
	typeamt= 2
	type[0]= 1
	type[1]= choose(1, 2)
	type[2]= choose(1, 2)
	type[3]= choose(1, 2)
	type[4]= choose(1, 2)
	type[5]= choose(1, 2)
	type[6]= choose(1, 2)
	flashtimer= 7
	on= 0
	con= 0
	diff= 3
	$Alarm3.start((30) / 30.0)
	snd_play(106/* snd_noise */)
	instance_create(0, 0, 118/* obj_flasher */)
	flash= caster_load("music/sfx_eyeflash.ogg")
	obj_asgoreb_body.visible= 0
	obj_asgorespear.color= 0
	obj_asgorespear.armtest= 0
	obj_asgorespear.visible= 0
	x= obj_asgoreb_body.x - 50
	y= obj_asgoreb_body.y

func _gm_event_1_0():
	caster_free(flash)

func _gm_event_2_3():
	type[0]= choose(1, 2)
	type[1]= choose(1, 2)
	type[2]= choose(1, 2)
	type[3]= choose(1, 2)
	type[4]= choose(1, 2)
	type[5]= choose(1, 2)
	if(diff == 0) {
	    flashtimer= 12
	    typeamt= 1
	}
	if(diff == 1) {
	    flashtimer= 9
	    typeamt= 2
	}
	if(diff == 2) {
	    flashtimer= 7
	    typeamt= 2
	}
	if(diff == 3) {
	    flashtimer= 7
	    typeamt= 3
	}
	$Alarm1.start((1) / 30.0)
	typeno= 0

func _gm_event_2_2():
	sw= instance_create(x, y, 475/* obj_asgore_spearswipe */)
	i= 0
	while(i < typeamt + 1) {
	    sw.type[i]= type[i]
	    i++
	}
	if(diff == 0) {
	    with(sw) {
	        amt= 1
	        quick= 0
	        cutspeed= 0.5
	        flashtimer= 12
	        swipewait= 2
	        initswipewait= 5
	    }
	}
	if(diff == 1) {
	    with(sw) {
	        amt= 2
	        quick= 0
	        cutspeed= 0.5
	        flashtimer= 12
	        swipewait= 0
	        initswipewait= 8
	    }
	}
	if(diff == 2) {
	    with(sw) {
	        amt= 2
	        quick= 0
	        cutspeed= 1
	        flashtimer= 7
	        swipewait= 3
	        initswipewait= 4
	    }
	}
	if(diff == 3) {
	    with(sw) {
	        amt= 3
	        quick= 0
	        cutspeed= 1
	        flashtimer= 7
	        swipewait= 3
	        initswipewait= 3
	    }
	}
	instance_destroy()

func _gm_event_2_1():
	if(on == 0) {
	    event_user(1)
	    on= 1
	} else  {
	    event_user(2)
	    on= 0
	}
	if(typeno < typeamt) {
	    $Alarm1.start((flashtimer) / 30.0)
	    caster_stop(flash)
	    caster_play(flash, 0.5, 1.05)
	} else  {
	    caster_stop(flash)
	    caster_play(flash, 0.6, 0.8)
	    $Alarm2.start((flashtimer + 15) / 30.0)
	}
	typeno++

func _gm_event_7_12():
	kk= instance_create(x + 172, y + 56, 477/* obj_eyeflash */)
	if(type[typeno] == 1) kk.image_blend= 16754964
	if(type[typeno] == 2) kk.image_blend= 4235519
	if(typeno >= typeamt) {
	    kk.sprite_index= 632/* spr_asgore_eyeflash_serious */
	    kk.image_speed= 0.5
	}

func _gm_event_7_11():
	jj= instance_create(x + 146, y + 56, 477/* obj_eyeflash */)
	if(type[typeno] == 1) jj.image_blend= 16754964
	if(type[typeno] == 2) jj.image_blend= 4235519
	if(typeno >= typeamt) {
	    jj.sprite_index= 632/* spr_asgore_eyeflash_serious */
	    jj.image_speed= 0.5
	}

func _gm_event_7_7():
	if(sprite_index == sprite0) sprite_index= 633/* spr_asgore_flashsilhouette */

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
