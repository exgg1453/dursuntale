# Auto-converted from GameMaker: obj_shopkeeper_bratty
extends Node2D

func _ready():
	armexp= 0
	arm= 0
	idealarmx1= x
	idealarmy1= 120
	armx1= x + 40
	armsiner1= 0
	army1= 100
	idealarmx2= x + 22
	idealarmy2= 105
	armsiner2= 0
	army2= 100
	armx2= x + 22
	xadjust= 5
	yadjust= 10
	xx= 0
	yy= 0
	bxx= 0
	byy= 0
	face= 0
	banim= 0

func _on_outside_room():
	// obj_shop3
	with(1411) {
	    if(is_instance_valid(brattywriter) and obj_shopkeeper_bratty.face == 0) {
	        if(brattywriter.halt == 0)
	            obj_shopkeeper_bratty.banim+= 0.25
	        else  obj_shopkeeper_bratty.banim= 0
	    } else  obj_shopkeeper_bratty.banim= 0
	}
	draw_sprite(sprite_index, banim, x + floor(bxx), y + floor(byy))
	if(face > 0)
	    draw_sprite(858/* spr_brattyface */, face, x + 30 + floor(bxx), y + 20 + floor(byy))
	armexp= GS.flag[20]
	if(armexp == 0) {
	    face= 0
	    idealarmx1= x + 35
	    idealarmy1= 100
	    idealarmx2= x + 18
	    idealarmy2= 102
	    yadjust= 8
	    xadjust= 6
	    if(abs(xx) > 0.1) xx/= 1.5
	    if(abs(yy) > 0.1) yy/= 1.5
	    if(abs(xx) < 0.1 and abs(yy) < 0.1) armsiner= 0
	    if(abs(bxx) > 0.1) bxx/= 1.5
	    if(abs(byy) > 0.1) byy/= 1.5
	}
	if(armexp == 1) {
	    face= 4
	    arm= 2
	    idealarmx1= x + 80
	    idealarmy1= y + 50
	    idealarmy2= 130
	    armsiner++
	    yy= cos(armsiner) * 1
	    byy= sin(armsiner) * 2
	}
	if(armexp == 2) {
	    face= 3
	    idealarmx1= x + 35
	    idealarmy1= 100
	    idealarmx2= x + 18
	    idealarmy2= 102
	    yadjust= 8
	    xadjust= 6
	    if(abs(xx) > 0.1) xx/= 1.5
	    if(abs(yy) > 0.1) yy/= 1.5
	    if(abs(xx) < 0.1 and abs(yy) < 0.1) armsiner= 0
	    if(abs(bxx) > 0.1) bxx/= 1.5
	    if(abs(byy) > 0.1) byy/= 1.5
	}
	if(armexp == 3) {
	    face= 0
	    arm= 0
	    yadjust= 5
	    idealarmx1= x + 70
	    idealarmy1= y + 70
	    idealarmx2= x + 47
	    idealarmy2= y + 73
	    armsiner++
	    xx= sin(armsiner / 4) * 1
	    yy= cos(armsiner / 4) * 1
	}
	if(armexp == 4) {
	    face= 5
	    idealarmx1= x + 35
	    idealarmy1= 100
	    idealarmx2= x + 18
	    idealarmy2= 102
	    yadjust= 8
	    xadjust= 6
	    if(abs(xx) > 0.1) xx/= 1.5
	    if(abs(yy) > 0.1) yy/= 1.5
	    if(abs(xx) < 0.1 and abs(yy) < 0.1) armsiner= 0
	    if(abs(bxx) > 0.1) bxx/= 1.5
	    if(abs(byy) > 0.1) byy/= 1.5
	}
	if(armexp == 5) {
	    face= 1
	    idealarmx1= x + 35
	    idealarmy1= 90
	    idealarmx2= x + 18
	    idealarmy2= 92
	    yadjust= 8
	    xadjust= 6
	    if(abs(xx) > 0.1) xx/= 1.5
	    if(abs(yy) > 0.1) yy/= 1.5
	    if(abs(xx) < 0.1 and abs(yy) < 0.1) armsiner= 0
	    if(abs(bxx) > 0.1) bxx/= 1.5
	    if(abs(byy) > 0.1) byy/= 1.5
	}
	if(armexp == 6) {
	    face= 2
	    idealarmx1= x + 35
	    idealarmy1= 80
	    idealarmx2= x + 18
	    idealarmy2= 82
	    yadjust= 8
	    xadjust= 6
	    armsiner++
	    xx= sin(armsiner / 4) * 2
	    yy= cos(armsiner / 4) * 2
	}
	draw_sprite(859/* spr_brattyarm_l */, arm, armx2 + xx, army2 + yy)
	draw_sprite(860/* spr_brattyarm_r */, arm, armx1 + xx, army1 + yy)
	if(armx1 < idealarmx1) armx1+= xadjust
	if(armx1 > idealarmx1) armx1-= xadjust
	if(armx2 < idealarmx2) armx2+= xadjust
	if(armx2 > idealarmx2) armx2-= xadjust
	if(army1 < idealarmy1) army1+= yadjust
	if(army2 < idealarmy2) army2+= yadjust
	if(army1 > idealarmy1) army1-= yadjust
	if(army2 > idealarmy2) army2-= yadjust
	if(abs(armx1 - idealarmx1) < xadjust)
	    armx1= idealarmx1
	if(abs(armx2 - idealarmx2) < xadjust)
	    armx2= idealarmx2
	if(abs(army1 - idealarmy1) < yadjust)
	    army1= idealarmy1
	if(abs(army2 - idealarmy2) < yadjust)
	    army2= idealarmy2
	if(GS.debug == 1 and Input.is_action_pressed("ui_accept")) {
	    armexp++
	    if(armexp == 7) armexp= 0
	}
	if(GS.debug == 1 and Input.is_key_pressed(66))
	    GS.flag[437]++

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
