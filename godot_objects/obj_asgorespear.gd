# Auto-converted from GameMaker: obj_asgorespear
extends Node2D

func _ready():
	angle= -25
	siner= 0
	armtest= 1
	color= 255
	debuggo= 0

func _on_outside_room():
	if(Input.is_action_pressed("move_left") and debuggo == 1) {
	    angle-= 8
	    if(Input.is_key_pressed(16)) angle-= 16
	    if(Input.is_action_pressed("ui_accept")) {
	        simg= instance_create(x, y, 486/* obj_spearafterimage */)
	        simg.originx= x
	        simg.originy= y
	        simg.outx= x + lengthdir_x(320, angle + 8)
	        simg.outy= y + lengthdir_y(320, angle + 8)
	        simg.outx2= x + lengthdir_x(320, angle - 40)
	        simg.outy2= y + lengthdir_y(320, angle - 40)
	        simg.color= color
	        simg2= instance_create(x, y, 487/* obj_spearafterimage2 */)
	        simg2.angle= angle - 16
	        simg2.alpha-= 0.017
	        simg2.color= color
	        simg3= instance_create(x, y, 487/* obj_spearafterimage2 */)
	        simg3.angle= angle - 40
	        simg3.color= color
	        simg4= instance_create(x, y, 487/* obj_spearafterimage2 */)
	        simg4.angle= angle + 8
	        simg4.alpha-= 0.034
	        simg4.color= color
	        angle-= 40
	    }
	}
	if(Input.is_action_pressed("move_right") and debuggo == 1) {
	    angle+= 8
	    if(Input.is_key_pressed(16)) angle+= 16
	    if(Input.is_action_pressed("ui_accept")) {
	        simg= instance_create(x, y, 486/* obj_spearafterimage */)
	        simg.originx= x
	        simg.originy= y
	        simg.outx= x + lengthdir_x(320, angle - 8)
	        simg.outy= y + lengthdir_y(320, angle - 8)
	        simg.outx2= x + lengthdir_x(320, angle + 40)
	        simg.outy2= y + lengthdir_y(320, angle + 40)
	        simg.color= color
	        simg2= instance_create(x, y, 487/* obj_spearafterimage2 */)
	        simg2.angle= angle + 16
	        simg2.alpha-= 0.017
	        simg2.color= color
	        simg3= instance_create(x, y, 487/* obj_spearafterimage2 */)
	        simg3.angle= angle + 40
	        simg3.color= color
	        simg4= instance_create(x, y, 487/* obj_spearafterimage2 */)
	        simg4.angle= angle - 8
	        simg4.alpha-= 0.034
	        simg4.color= color
	        angle+= 40
	    }
	}
	siner++
	y+= sin(siner / 15) * 0.3
	angle+= sin(siner / 15) * 0.02
	xhand1= lengthdir_x(55, angle)
	yhand1= lengthdir_y(55, angle)
	rdistx= x + xhand1 * 2
	rdisty= y + yhand1 * 2
	if(armtest == 1 and instance_exists(488/* obj_asgoreb_body */)) {
	    point1y= obj_asgoreb_body.party[5] + 64 + obj_asgoreb_body.y
	    point1x= obj_asgoreb_body.partx[5] + 14 + obj_asgoreb_body.x
	    armlength= point_distance(point1x, point1y, x - xhand1, y - yhand1)
	    armangle= point_direction(point1x, point1y, x - xhand1, y - yhand1)
	    armsize= armlength / 40
	    if(armsize < 0.35) armsize= 0
	    draw_sprite_ext(609/* spr_asgoreb_ballarm */, 0, point1x, point1y, armsize * 2, 2, armangle, 16777215, 1)
	    point1y= obj_asgoreb_body.party[4] + 64 + obj_asgoreb_body.y
	    point1x= obj_asgoreb_body.partx[4] + 34 + obj_asgoreb_body.x
	    armlength= point_distance(point1x, point1y, rdistx, rdisty)
	    if(armlength > 100) {
	        armoff= (armlength - 100) / 2
	        rdistx= x + lengthdir_x(55 - armoff, angle) * 2
	        rdisty= y + lengthdir_y(55 - armoff, angle) * 2
	        armlength= point_distance(point1x, point1y, rdistx, rdisty)
	    }
	    armangle= point_direction(point1x, point1y, rdistx, rdisty)
	    if(armangle > 100) point1y-= 12
	    armsize= armlength / 40
	    if(armsize < 0.6) armsize= 0
	    draw_sprite_ext(609/* spr_asgoreb_ballarm */, 0, point1x, point1y, armsize * 2, 2, armangle, 16777215, 1)
	}
	if(Input.is_key_pressed(49) and debuggo == 1) color= 255
	if(Input.is_key_pressed(50) and debuggo == 1) color= 4235519
	if(Input.is_key_pressed(51) and debuggo == 1)
	    color= make_color_rgb(90, 130, 255)
	draw_sprite_ext(sprite_index, frame, x, y, 2, 2, angle, color, 1)
	draw_sprite_ext(618/* spr_spearhandr */, frame, rdistx, rdisty, 2, 2, angle, 16777215, 1)
	draw_sprite_ext(619/* spr_spearhandl */, frame, x - xhand1, y - yhand1, 2, 2, angle, 16777215, 1)

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
