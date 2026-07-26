# Auto-converted from GameMaker: obj_snowfloor
extends Node2D

func _ready():
	x+= 2.2
	y++
	yy= 0
	xx= 0
	while(yy < 5) {
	    snowx[yy,xx]= x + xx * 4
	    if(xx == 4)
	        snowx[yy,xx]-= 0.2
	    snowy[yy,xx]= y + yy * 4
	    dodraw[yy,xx]= 1
	    moveme[yy,xx]= 1
	    if(xx == 4) {
	        xx= -1
	        yy++
	    }
	    xx++
	}

func _on_outside_room():
	draw_set_color(16777215)
	yy= 0
	xx= 0
	while(yy < 5) {
	    if(dodraw[yy,xx] == 1)
	        draw_circle(snowx[yy,xx], snowy[yy,xx], 2.8, 0)
	    if(collision_circle(snowx[yy,xx], snowy[yy,xx], 2, 1570, 0, 1) != -4)
	        moveme[yy,xx]= floor(random(4)) + 2
	    if(moveme[yy,xx] > 1) {
	        if(obj_mainchara.moving == 1) {
	            if(room == 57 and GS.flag[64] == 0) GS.flag[64]= -1
	            if(obj_mainchara.bbox_left > snowx[yy,xx])
	                snowx[yy,xx]-= moveme[yy,xx]
	            if(obj_mainchara.bbox_right < snowx[yy,xx])
	                snowx[yy,xx]+= moveme[yy,xx]
	            if(obj_mainchara.bbox_top > snowy[yy,xx])
	                snowy[yy,xx]-= moveme[yy,xx]
	            if(obj_mainchara.bbox_bottom < snowy[yy,xx])
	                snowy[yy,xx]+= moveme[yy,xx]
	            snowx[yy,xx]+= (random(moveme[yy,xx]) - moveme[yy,xx] / 2) / 2
	            snowy[yy,xx]+= (random(moveme[yy,xx]) - moveme[yy,xx] / 2) / 2
	        }
	        moveme[yy,xx]--
	    }
	    if(xx == 4) {
	        xx= -1
	        yy++
	    }
	    xx++
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
