# Auto-converted from GameMaker: obj_showercurtain
# GM parent: obj_interactable
extends Node2D

func _ready():
	anim= 0
	animspeed= 0.1664
	drawkey= 0
	con= 0
	myinteract= 0
	mode= 0
	if(GS.flag[483] == 1) {
	    mode= 2
	    drawkey= 1
	    size= 0.3
	}
	if(GS.flag[483] >= 2) {
	    mode= 2
	    drawkey= 0
	    size= 0.3
	    con= 10
	}
	size= 1
	remy= obj_mainchara.y
	onoff= 0

func _gm_event_2_4():
	con++

func _gm_event_7_5():
	if(mode == 0) caster_free(dist)
	caster_resume(GS.currentsong)

func _gm_event_7_4():
	if(GS.flag[483] == 1) mode= 2
	if(GS.flag[483] >= 2) mode= 2
	if(mode == 0) {
	    dist= caster_load("music/sfx_disturbing.ogg")
	    caster_pause(GS.currentsong)
	    caster_loop(dist, 0.7, 0.7)
	    pit= 1
	}

func _on_outside_room():
	anim+= animspeed
	if(mode == 0) {
	    draw_sprite(2120/* spr_showercurtain_man */, floor(anim), x, y)
	    if(obj_mainchara.y < remy - 2) {
	        if(onoff == 1) obj_mainchara.y= remy - 1
	        else  obj_mainchara.y= remy
	    }
	    remy= obj_mainchara.y
	    if(onoff == 0) onoff= 1
	    else  onoff= 0
	    if(obj_mainchara.y < 180) {
	        animspeed= 0.08 + 0.8 * (180 - obj_mainchara.y) / 180
	        pit= 0.6 + 1 * (180 - obj_mainchara.y) / 180
	        caster_set_pitch(dist, pit)
	    }
	}
	if(drawkey == 1)
	    draw_sprite_ext(2110/* spr_leverkey */, anim, x + 34, y + 30, 1, 1, 0, 65280, 1)
	if(myinteract == 1 and mode == 0) {
	    animspeed= 0.1
	    mode= 1
	    myinteract= 0
	    GS.interact= 1
	    con= 1
	    $Alarm4.start((10) / 30.0)
	    caster_free(dist)
	    snd_play(22/* snd_splash */)
	    GS.flag[483]= 1
	    drawkey= 1
	}
	if(con == 2) {
	    myinteract= 0
	    GS.interact= 0
	    con= 3
	}
	if(myinteract == 1 and GS.flag[483] == 1) {
	    con= 4
	    myinteract= 0
	    GS.interact= 1
	    GS.msc= 0
	    GS.typer= 5
	    drawkey= 0
	    GS.msg[0]= "* (There\'s a green key lying&  in the bathtub.)/"
	    GS.msg[1]= "* (You took it and put it&  on your keychain.)/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    GS.flag[483]= 2
	}
	if(con == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 10
	    GS.interact= 0
	}
	if(myinteract == 1 and GS.flag[483] >= 2) {
	    con= 12
	    myinteract= 0
	    GS.interact= 1
	    GS.msc= 0
	    GS.typer= 5
	    GS.msg[0]= "* (It\'s an empty bathtub.)/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	}
	if(con == 12 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 10
	    GS.interact= 0
	}
	if(mode == 1) {
	    if(size > 0.3) size-= 0.1
	    draw_sprite_ext(2121/* spr_showercurtain_empty */, 0, x, y, size, 1, 0, 16777215, 1)
	}
	if(mode == 2) {
	    size= 0.3
	    draw_sprite_ext(2121/* spr_showercurtain_empty */, 0, x, y, size, 1, 0, 16777215, 1)
	}
	draw_sprite(2122/* spr_showerbar */, 0, x, y)

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
