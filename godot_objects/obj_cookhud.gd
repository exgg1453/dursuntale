# Auto-converted from GameMaker: obj_cookhud
extends Node2D

func _ready():
	x= view_xview[0] - 103
	y= view_yview[0] + 40
	velocity.x= 8
	friction= 0.3
	con= 0
	if(instance_exists(1185/* obj_jetpackchara */)) {
	    dist= obj_jetpackchara.dist
	    maxdist= obj_jetpackchara.maxdist
	    time= obj_jetpackchara.timertime
	    inittime= obj_jetpackchara.timertime
	} else  {
	    dist= 0
	    maxdist= 400
	    time= 600
	    inittime= 600
	}
	finished= 0

func _on_outside_room():
	y= view_yview[0] + 40
	if(con == 0 and x >= view_xview[0]) {
	    x= view_xview[0]
	    velocity.x= 0
	    friction= 0
	    con= 1
	}
	if(instance_exists(1185/* obj_jetpackchara */)) {
	    time= obj_jetpackchara.timertime
	    dist= obj_jetpackchara.dist
	} else  {
	    dist++
	    time--
	}
	draw_sprite(1685/* spr_goalhud */, 0, x, y)
	ballx= (maxdist - dist) / maxdist * 27
	draw_sprite(1686/* spr_goalhud_ball */, 0, x + 62 + ballx, y + 5)
	pizzax= (inittime - time) / inittime * 9
	draw_sprite(1687/* spr_timehud */, 0, x, y + 30)
	draw_sprite(1684/* spr_pizzaclock */, pizzax, x + 62, y + 33)
	thisnum= ceil(time / 30)
	if(thisnum >= 0) {
	    place= 0
	    numadd= 10
	    if(thisnum >= numadd) {
	        while(thisnum >= numadd) {
	            place++
	            numadd*= 10
	        }
	    }
	} else  {
	    thisnum= 0
	    place= 0
	}
	thisnum2= thisnum
	i= place
	while(i >= 0) {
	    numnum[i]= floor(thisnum2 / power(10, i))
	    thisnum2-= numnum[i] * power(10, i)
	    i--
	}
	i= place
	while(i >= 0) {
	    draw_set_color(255)
	    draw_sprite(1683/* spr_digitalnumber */, numnum[i], x + 92 - i * 9, y + 34)
	    i--
	}
	if(finished == 1) {
	    velocity.x-= 0.5
	    if(x < -110) instance_destroy()
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
