# Auto-converted from GameMaker: obj_trueflymett
extends Node2D

func _ready():
	x= view_xview[0] + 350
	mode= 0
	velocity.x= 0
	siner= 0
	terror= 0
	eggtimer= 0
	sugartimer= 0
	currentideal= 7
	milktimer= 0
	velocity.x= 0
	con= 0
	setmode= 0
	modetime= 0
	insanity= -1

func _gm_event_2_4():
	con++

func _gm_event_7_10():
	i= 0
	while(i < 16) {
	    if(i != currentideal and i != currentideal + 1) {
	        sb= instance_create(x + 13, y + 20, 1180/* obj_sugarbullet */)
	        sb.idealspot= i
	    }
	    i++
	}
	currentideal+= choose(1, 2) * choose(-1, 1)
	if(currentideal < 1) currentideal+= 2
	if(currentideal > 14) currentideal-= 2

func _on_outside_room():
	if(mode == 0) {
	    siner++
	    y+= cos(siner / 3)
	    draw_sprite(1696/* spr_mett_plain */, 0, x, y)
	    draw_sprite(1717/* spr_chefhat */, 0, x + 11, y - 12)
	    if(con == 0) {
	        x= view_xview[0] + 350
	        velocity.x= -6
	        con= 1
	    }
	    if(con == 1 and x < view_xview[0] + 280) {
	        velocity.x= 0
	        con= 2
	        $Alarm4.start((40) / 30.0)
	    }
	    if(con == 3) {
	        con= 4
	        velocity.x= 10
	    }
	    if(con == 4 and x > view_xview[0] + 360) {
	        velocity.x= 0
	        con= 5
	        setmode= 1
	    }
	}
	if(mode == 1) {
	    modetime+= 1 + insanity / 2.7
	    if(modetime > 20 and modetime < 170) {
	        if(x > view_xview[0] + 300) velocity.x= -5 - insanity * 2
	        if(x < view_xview[0]) velocity.x= 5 + insanity * 2
	    }
	    if(modetime >= 170) {
	        if(x <= view_xview[0] + 150) velocity.x= -6
	        if(x >= view_xview[0] + 150) velocity.x= 6
	        if(x > view_xview[0] + 350) setmode= 2
	        if(x < view_xview[0] - 40) setmode= 2
	    }
	    y+= cos(siner / 3)
	    sx= sin(siner / 1.5) * 2
	    sy= cos(siner / 1.2) * 3
	    siner++
	    draw_sprite(1699/* spr_mett_eggcartonarm */, 0, x - 30 + sx, y + sy + 5)
	    draw_sprite(1717/* spr_chefhat */, 0, x + 11, y - 12)
	    draw_sprite(1698/* spr_mett_eggcarton */, 0, x, y)
	    eggtimer++
	    if(eggtimer >= 4 - insanity and obj_jetpackchara.eligible == 1) {
	        egg= instance_create(x - 30 + sx + 5 + random(13), y + sy + 5 + 22, 1181/* obj_mett_eggbullet */)
	        eggtimer= 0
	    }
	}
	if(mode == 2) {
	    modetime+= 1 + insanity / 2.7
	    if(modetime > 20 and modetime < 170) {
	        if(x > view_xview[0] + 300) velocity.x= -3
	        if(x < view_xview[0]) velocity.x= 3
	    }
	    if(modetime >= 170) {
	        if(x <= view_xview[0] + 150) velocity.x= -8
	        if(x >= view_xview[0] + 150) velocity.x= 8
	        if(x > view_xview[0] + 350) setmode= 3
	        if(x < view_xview[0] - 40) setmode= 3
	    }
	    y+= cos(siner / 3)
	    siner++
	    sugartimer++
	    draw_sprite(1696/* spr_mett_plain */, 0, x, y)
	    draw_sprite(1697/* spr_mett_sugararm */, sugartimer / 4, x - 11, y)
	    draw_sprite(1717/* spr_chefhat */, 0, x + 11, y - 12)
	    if(sugartimer >= 20 - insanity * 3 and obj_jetpackchara.eligible == 1) {
	        event_user(0)
	        sugartimer= 0
	    }
	}
	if(mode == 3) {
	    modetime+= 1 + insanity / 2.7
	    if(modetime > 20 and modetime < 170) {
	        if(x > view_xview[0] + 300) velocity.x= -6 - insanity
	        if(x < view_xview[0]) velocity.x= 6 + insanity
	    }
	    if(modetime >= 170) {
	        if(x <= view_xview[0] + 150) velocity.x= -8
	        if(x >= view_xview[0] + 150) velocity.x= 8
	        if(x > view_xview[0] + 350) setmode= 1
	        if(x < view_xview[0] - 40) setmode= 1
	    }
	    siner++
	    draw_sprite_ext(1692/* spr_milk_of_hell */, 0, x, y + 31, 1, 1, 100 - sin(siner / 2) * 10, 16777215, 1)
	    draw_sprite(1693/* spr_mett_milkpour */, 0, x, y)
	    draw_sprite(1717/* spr_chefhat */, 0, x + 2, y - 13)
	    milktimer++
	    if(milktimer >= 10 - insanity * 2 and obj_jetpackchara.eligible == 1) {
	        instance_create(x - 16, y + 37, 1179/* obj_milkofhell_shot */)
	        milktimer= 0
	    }
	}
	if(mode == 4) {
	    speed= 0
	    siner++
	    draw_sprite(1696/* spr_mett_plain */, 0, x, y + cos(siner / 3))
	    draw_sprite(1717/* spr_chefhat */, 0, x + 11, y - 12 + cos(siner / 3))
	}
	if(setmode == 1) {
	    x= view_xview[0] + 350
	    y= view_yview[0] + 20
	    siner= 0
	    mode= 1
	    modetime= 0
	    modecon= 0
	    velocity.x= -5
	    setmode= 0
	    if(insanity <= 3) insanity++
	    eggtimer= 0
	}
	if(setmode == 2) {
	    x= view_xview[0] + 350
	    y= view_yview[0] + 20
	    siner= 0
	    mode= 2
	    modetime= 0
	    modecon= 0
	    velocity.x= -5
	    setmode= 0
	    sugartimer= 0
	}
	if(setmode == 3) {
	    x= view_xview[0] + 420
	    y= view_yview[0] + 20
	    siner= 0
	    mode= 3
	    modetime= 0
	    modecon= 0
	    velocity.x= -5
	    setmode= 0
	    milktimer= 0
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
