# Auto-converted from GameMaker: obj_trashnado
extends Node2D

func _ready():
	siner1= 0
	siner2= 120
	siner3= 240
	siner4= 0
	siner5= 120
	sinerx= 0
	i= 0
	while(i < 3) {
	    tspr1[i]= choose(1635, 1636)
	    trash1[i]= instance_create(x, y, 1363/* obj_npc_marker */)
	    if(instance_exists(trash1[i])) {
	        trash1[i].sprite_index= tspr1[i]
	        with(trash1[i]) scr_depth()
	    }
	    i++
	}
	i= 0
	while(i < 3) {
	    tspr2[i]= choose(1635, 1636)
	    trash2[i]= instance_create(x, y, 1363/* obj_npc_marker */)
	    if(instance_exists(trash2[i])) {
	        trash2[i].sprite_index= tspr2[i]
	        with(trash2[i]) scr_depth()
	    }
	    i++
	}
	i= 0
	while(i < 3) {
	    tspr3[i]= choose(1635, 1636, 1635, 1286)
	    trash3[i]= instance_create(x, y, 1363/* obj_npc_marker */)
	    if(instance_exists(trash3[i])) {
	        trash3[i].sprite_index= tspr3[i]
	        with(trash3[i]) scr_depth()
	    }
	    i++
	}
	i= 0
	while(i < 3) {
	    tspr4[0]= choose(1635)
	    tspr4[1]= choose(1615)
	    tspr4[2]= choose(1284)
	    trash4[i]= instance_create(x, y, 1363/* obj_npc_marker */)
	    if(instance_exists(trash4[i])) {
	        trash4[i].sprite_index= tspr4[i]
	        with(trash4[i]) scr_depth()
	    }
	    i++
	}
	i= 0
	while(i < 3) {
	    if(GS.flag[497] < 2) {
	        tspr5[0]= choose(1635)
	        tspr5[1]= choose(1615)
	        tspr5[2]= choose(1637)
	    } else  {
	        tspr5[0]= choose(1635)
	        tspr5[2]= choose(1637)
	        tspr5[1]= choose(1615, 1635, 1615, 1518)
	    }
	    trash5[i]= instance_create(x, y, 1363/* obj_npc_marker */)
	    if(instance_exists(trash5[i])) {
	        trash5[i].sprite_index= tspr5[i]
	        with(trash5[i]) image_speed= 0.2
	        with(trash1[i]) scr_depth()
	    }
	    i++
	}
	obj_npc_marker.visible= 1
	// obj_npc_marker
	with(1363) {
	    if(z_index < 100) z_index= 100
	}

func _process(delta: float):
	siner1+= 20
	siner2-= 20
	siner3+= 20
	siner4-= 20
	siner5+= 20
	sinerx++
	rr= 3
	i= 0
	while(i < 3) {
	    trash1[i].x= x + sin(degtorad(siner1 + 120 * i)) * rr + sin(sinerx / 2)
	    trash1[i].y= y + cos(degtorad(siner1 + 120 * i)) * rr / 3 + cos(sinerx / 2)
	    i++
	}
	rr= 6
	i= 0
	while(i < 3) {
	    trash2[i].x= x + sin(degtorad(siner2 + 120 * i)) * rr - sin(sinerx / 2)
	    trash2[i].y= y + cos(degtorad(siner2 + 120 * i)) * rr / 3 - 12 - cos(sinerx / 2)
	    i++
	}
	rr= 10
	i= 0
	while(i < 3) {
	    trash3[i].x= x + sin(degtorad(siner3 + 120 * i)) * rr + sin(sinerx / 2)
	    trash3[i].y= y + cos(degtorad(siner3 + 120 * i)) * rr / 3 - 24 + cos(sinerx / 2)
	    i++
	}
	rr= 13
	i= 0
	while(i < 3) {
	    trash4[i].x= x + sin(degtorad(siner4 + 120 * i)) * rr - sin(sinerx / 2)
	    trash4[i].y= y + cos(degtorad(siner4 + 120 * i)) * rr / 3 - 36 - cos(sinerx / 2)
	    i++
	}
	rr= 16
	i= 0
	while(i < 3) {
	    trash5[i].x= x + sin(degtorad(siner5 + 120 * i)) * rr + sin(sinerx / 2)
	    trash5[i].y= y + cos(degtorad(siner5 + 120 * i)) * rr / 3 - 48 + cos(sinerx / 2)
	    i++
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
