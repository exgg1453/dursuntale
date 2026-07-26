# Auto-converted from GameMaker: obj_8smallgen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	dmg= 8
	$Alarm0.start((2) / 30.0)
	i= 0
	rate= GS.firingrate

func _gm_event_2_4():
	ii= a4i
	event_user(1)

func _gm_event_2_3():
	ii= a3i
	event_user(1)

func _gm_event_2_2():
	ii= a2i
	event_user(1)

func _on_destroy():
	i++
	cx[i]= GS.idealborder[0] + 20 + random(116)
	cy[i]= GS.idealborder[2] + 20 + random(117)
	hdist= abs(GS.idealborder[0] - cx[i]) - abs(GS.idealborder[1] - cx[i])
	vdist= abs(GS.idealborder[2] - cy[i]) - abs(GS.idealborder[3] - cy[i])
	if(abs(vdist) > abs(hdist)) {
	    if(vdist >= 0) hd2= cy[i] - GS.idealborder[2]
	    else  hd2= GS.idealborder[3] - cy[i]
	} else  {
	    if(hdist >= 0) hd2= cx[i] - GS.idealborder[0]
	    else  hd2= GS.idealborder[1] - cx[i]
	}
	sum= scr_monstersum()
	hd2*= 1.5
	hd1= hd2 * 2 / 3
	cs= 2.4 + random(0.2)
	if(sum > 1) {
	    hd2*= 1.6
	    hd1*= 1.6
	    cs*= 1.6
	}
	if(sum == 1) {
	    hd1*= 1.8
	    hd2*= 1.8
	    cs*= 2.2
	}
	b= instance_create(cx[i] - hd2, cy[i], 623/* blt_splinter */)
	b.direction= 0
	b.iteration= i
	b= instance_create(cx[i] - hd1, cy[i] - hd1, 623/* blt_splinter */)
	b.direction= 315
	b.iteration= i
	b= instance_create(cx[i], cy[i] - hd2, 623/* blt_splinter */)
	b.direction= 270
	b.iteration= i
	b= instance_create(cx[i] + hd1, cy[i] - hd1, 623/* blt_splinter */)
	b.direction= 225
	b.iteration= i
	b= instance_create(cx[i] + hd2, cy[i], 623/* blt_splinter */)
	b.direction= 180
	b.iteration= i
	b= instance_create(cx[i] + hd1, cy[i] + hd1, 623/* blt_splinter */)
	b.direction= 135
	b.iteration= i
	b= instance_create(cx[i], cy[i] + hd2, 623/* blt_splinter */)
	b.direction= 90
	b.iteration= i
	b= instance_create(cx[i] - hd1, cy[i] + hd1, 623/* blt_splinter */)
	b.direction= 45
	b.iteration= i
	blt_splinter.dmg= 8
	blt_splinter.speed= cs
	if(sum > 1) blt_splinter.sprite_index= 63/* spr_bulletmd */
	if(sum == 1) {
	    blt_splinter.scale.x= 2
	    blt_splinter.scale.y= 2
	}
	if(alarm[2] < 1) {
	    a2i= i
	    $Alarm2.start((hd2 / cs) / 30.0)
	} else  {
	    if(alarm[3] < 1) {
	        a3i= i
	        $Alarm3.start((hd2 / cs) / 30.0)
	    } else  {
	        if(alarm[4] < 1) {
	            a4i= i
	            $Alarm4.start((hd2 / cs) / 30.0)
	        }
	    }
	}
	if(i < 3) $Alarm0.start((rate) / 30.0)
	if(sum == 1 and i < 4) $Alarm0.start((rate) / 30.0)

func _gm_event_7_11():
	blt_splinter.iend= ii
	k= instance_create(cx[ii], cy[ii], 623/* blt_splinter */)
	k.sprite_index= 63/* spr_bulletmd */
	k.speed= 1.5
	k.direction= 90
	k.friction= -0.2

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
