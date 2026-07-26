# Auto-converted from GameMaker: obj_tilehud
extends Node2D

func _ready():
	x= view_xview[0] + 210
	y= view_yview[0] - 40
	velocity.y= 8
	friction= 0.3
	con= 0
	if(instance_exists(1210/* obj_multitileevent */))
	    time= obj_multitileevent.cooltimer
	else  time= 900
	finished= 0
	orange= -1

func _process_end(delta: float):
	x= view_xview[0] + 210
	if(x < 210) x= 210

func _on_outside_room():
	if(con == 0 and y >= view_yview[0]) {
	    y= view_yview[0]
	    velocity.y= 0
	    friction= 0
	    con= 1
	}
	if(instance_exists(1210/* obj_multitileevent */))
	    time= obj_multitileevent.cooltimer
	else  time--
	draw_sprite(1744/* spr_timehud_vert */, 0, x, y + 20)
	if(instance_exists(1212/* obj_tileguy */))
	    orange= obj_tileguy.orange
	draw_sprite(1741/* spr_orangeindicator */, orange + 1, x + 28, y + 24)
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
	    draw_sprite(1683/* spr_digitalnumber */, numnum[i], x + 92 - i * 9, y + 25)
	    i--
	}
	if(finished == 1) {
	    velocity.y-= 0.5
	    if(y < -50) instance_destroy()
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
