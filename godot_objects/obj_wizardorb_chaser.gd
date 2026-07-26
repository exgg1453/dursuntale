# Auto-converted from GameMaker: obj_wizardorb_chaser
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	speed= 0
	direction= 0
	first= 30
	col= 0
	zap= 1
	$Alarm0.start((20) / 30.0)
	x= obj_heart.x
	y= obj_heart.y
	dirr= random(360)
	$Alarm1.start((1) / 30.0)
	visible= 0
	dmg= 8
	active= 0
	king= 0
	time= 0
	heal= 0
	star= 0
	GS.flag[393]= 0

func _gm_event_2_1():
	x+= lengthdir_x(140, dirr)
	y+= lengthdir_y(70, dirr)
	visible= 1
	active= 1

func _on_destroy():
	$Alarm0.start((12) / 30.0)
	if(zap == 1 and scr_insideborder() == 1) {
	    cross= instance_create(x + 12, y + 12, 364/* obj_crosszap */)
	    cross.dmg= dmg
	    pop= 155
	    if(pop > 1) {
	        cross.speed= 1
	        $Alarm0.start((20) / 30.0)
	    }
	}

func _process(delta: float):
	col--
	pop= scr_monstersum()
	first--
	if(first < 0) {
	    turnamt= 0.3
	    if(zap == 1) turnamt= 0.6
	    if(zap == 1 and pop > 1) turnamt= 0.5
	} else  turnamt= 0.2
	newdir= point_direction(x, y, obj_heart.x, obj_heart.y)
	velocity.x+= lengthdir_x(turnamt, newdir)
	velocity.y+= lengthdir_y(turnamt, newdir)
	if(zap == 0 and speed > 6) speed= 6
	if(zap == 1) {
	    if(speed > 7) speed= 7
	    if(pop > 1 and speed > 6) speed= 6
	}
	if(zap == 2 and speed > 7) speed= 7
	if(x > GS.idealborder[1] + 6) x= GS.idealborder[0] - 15
	if(x < GS.idealborder[0] - 20) x= GS.idealborder[1] + 2
	if(y > GS.idealborder[3] + 6) y= GS.idealborder[2] - 15
	if(y < GS.idealborder[2] - 20) y= GS.idealborder[3] + 2
	if(king == 1 and zap == 0) {
	    if(obj_heart.x == obj_heart.xprevious and obj_heart.y == obj_heart.yprevious) {
	        GS.turntimer++
	        time++
	        if(time > 450 and heal == 0) {
	            obj_monsterparent.mercymod= 400
	            snd_play(111/* snd_select */)
	            object_index.sprite_index= 436/* spr_wizard_orb3 */
	            object_index.heal= 1
	            caster_pause(-3)
	        }
	    } else  {
	        if(heal == 1) {
	            snd_play(109/* snd_power */)
	            if(GS.hp < GS.maxhp) {
	                GS.hp++
	                if(GS.hp > GS.maxhp) GS.hp= GS.maxhp
	            }
	            if(GS.flag[393] != 0) caster_free(GS.flag[393])
	            caster_resume(-3)
	            GS.turntimer= -1
	            GS.mnfight= 3
	            GS.myfight= -1
	            with(object_index) instance_destroy()
	        }
	    }
	}

func _on_alarm_0_timeout():
	if(active == 1 and heal == 0) scr_damagestandard(0, 3, 0, 0, 0)
	if(heal == 1) {
	    snd_play(109/* snd_power */)
	    if(GS.hp < GS.maxhp) {
	        GS.hp+= 6
	        if(GS.hp > GS.maxhp) GS.hp= GS.maxhp
	    }
	    if(GS.flag[393] != 0) {
	        caster_free(GS.flag[393])
	        GS.flag[393]= 0
	    }
	    caster_resume(-3)
	    GS.turntimer= -1
	    GS.mnfight= 3
	    GS.myfight= -1
	    with(object_index) instance_destroy()
	}

func _on_outside_room():
	draw_self_border()

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
