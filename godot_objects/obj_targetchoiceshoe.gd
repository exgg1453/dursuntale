# Auto-converted from GameMaker: obj_targetchoiceshoe
extends Node2D

func _ready():
	image_speed= 0
	xxx= 0
	if(x <= obj_target.x)
	    velocity.x= GS.attackspeed + random(GS.attackspeedr)
	if(x > obj_target.x + obj_target.sprite_width)
	    velocity.x= -(GS.attackspeed + random(GS.attackspeedr))
	if(GS.weapon == 13) velocity.x*= 1.25

func _gm_event_1_0():
	// obj_target
	with(738) fade= 1

func _process(delta: float):
	if(velocity.x > 0 and x > obj_target.x + obj_target.sprite_width)
	    xxx= 1
	if(velocity.x < 0 and x < obj_target.x) xxx= 1
	if(xxx == 1) {
	    GS.damage= 0
	    GS.hurtanim[GS.mytarget]= 5
	    instance_destroy()
	    exit
	} else  {
	    if(image_speed == 0 and keyboard_multicheck_pressed(13/* ENTER */)) {
	        mons= GS.monsterinstance[GS.mytarget]
	        velocity.x= 0
	        script_execute(162/* scr_attackcalc */)
	        GS.damage= damage
	        GS.damage+= random(2)
	        myx= x + sprite_width / 2
	        myperfectx= obj_target.x + obj_target.sprite_width / 2
	        bonusfactor= abs(myx - myperfectx)
	        if(bonusfactor == 0) bonusfactor= 1
	        GS.stretch= (obj_target.sprite_width - bonusfactor) / obj_target.sprite_width
	        if(bonusfactor <= 12) GS.damage= round(GS.damage * 2.2)
	        if(bonusfactor > 12)
	            GS.damage= round(GS.damage * GS.stretch * 2)
	        with(mons) takedamage= GS.damage
	        instance_create(mons.x + mons.sprite_width / 2 - 5, mons.y - 5, 733/* obj_slice */)
	        GS.hurtanim[GS.mytarget]= 1
	        image_speed= 0.4
	    }
	    if(GS.myfight != 1) instance_destroy()
	    exit
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
