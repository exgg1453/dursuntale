# Auto-converted from GameMaker: blt_bluesword
# GM parent: blt_parent
extends Node2D

func _ready():
	dmg= 0
	speartype= 2
	y= GS.idealborder[2] + 40
	x= GS.idealborder[1] + 20
	velocity.x= -0.1
	friction= -0.1
	$Alarm0.start((20 + random(10)) / 30.0)
	g= 0
	hurted= 0
	blconnum= 0

func _gm_event_1_0():
	GS.turntimer= -1
	GS.mnfight= 3
	if(hurted == 0 and instance_exists(247/* obj_movedoge */))
	    obj_movedoge.excited= 0

func _on_destroy():
	if(speartype == 0) {
	    instance_create(xstart, ystart, 649/* blt_whitespear */)
	    blt_whitespear.dmg= dmg
	}

func _process_end(delta: float):
	if(GS.turntimer < 1) {
	    GS.turntimer= -1
	    GS.mnfight= 3
	    instance_destroy()
	}
	if(instance_exists(743/* obj_heart */)) {
	    if(abs(obj_heart.x - x) < 12) {
	        g= 1
	        friction= 0.1
	        velocity.x= -2
	    } else  {
	        if(g == 1) friction= -0.3
	    }
	    if(obj_heart.y - y > sprite_height / 2) y+= 4
	    else  {
	        if(obj_heart.y - y < sprite_height / 4) y-= 4
	    }
	}

func _on_alarm_0_timeout():
	if((abs(obj_heart.xprevious - obj_heart.x) > 0.01 or abs(obj_heart.yprevious - obj_heart.y) > 0.01) and GS.invc < 1) {
	    hurted= 1
	    dmgamt= round(dmg - (GS.df + GS.adef) / 5)
	    if(dmgamt < 1) dmgamt= 1
	    GS.hp-= dmgamt
	    snd_play(53/* snd_hurt1 */)
	    GS.hshake= 2
	    GS.shakespeed= 2
	    GS.vshake= 2
	    instance_create(0, 0, 184/* obj_shaker */)
	    GS.invc= GS.inv
	    if(instance_exists(219/* obj_dogeparent */)) {
	        obj_dogeparent.excited= 1
	        obj_dogeparent.mercymod= -50
	        if(instance_exists(248/* obj_movedogehead */)) {
	            obj_movedogehead.excited= 1
	            obj_movedogehead.$Alarm0.start((90) / 30.0)
	            obj_movedogehead.$Alarm1.start((2) / 30.0)
	        }
	    }
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
