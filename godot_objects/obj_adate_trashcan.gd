# Auto-converted from GameMaker: obj_adate_trashcan
extends Node2D

func _ready():
	con= 0
	topx= 0
	siner= 0
	rot= 0
	sinerf= 0
	xoff= 0
	alphysy= -154
	image_blend= 8421504
	hoopx= get_viewport_rect().size.x
	alphysheight= 154
	heightdown= 0
	drawa= 0
	aturn= 0
	GS.faceemotion= 0
	acounter= 0
	yoff= 0
	fadein= 0
	fadecounter= 0
	shake= 0
	$Alarm3.start((1) / 30.0)

func _gm_event_2_4():
	con++

func _gm_event_2_3():
	$Alarm3.start((8) / 30.0)
	if(shake > 0) instance_create(x, y - 120, 317/* obj_sweat99 */)

func _on_outside_room():
	if(hoopx < 650)
	    draw_sprite_ext(789/* spr_bball_hoop_back */, 0, hoopx, y - 250, 2, 2, 0, image_blend, modulate.a)
	if(drawa == 1) {
	    alphysy+= 30
	    heightdown= alphysy + 154 - y - 52
	    if(heightdown < 0) heightdown= 0
	    width= 88
	    height= 154 - heightdown
	    if(height > 0)
	        draw_sprite_part(790, 0, 0, 0, 88, height, x - 40, alphysy)
	    else  {
	        drawa= 0
	        snd_play(21/* snd_impact */)
	        snd_stop(12)
	    }
	}
	if(hoopx < 650)
	    draw_sprite_ext(788/* spr_bball_hoop */, 0, hoopx, y - 250, 2, 2, 0, image_blend, modulate.a)
	yoff= floor(acounter) * 2
	draw_sprite_ext(791/* spr_adate_trashcan_bottom */, 0, x + xoff, y - floor(yoff), 2, 2, rot, image_blend, modulate.a)
	if(acounter < 4)
	    draw_sprite_ext(794/* spr_adate_trashcan_top */, 0, x + topx, y - floor(yoff), 2, 2, 0, image_blend, modulate.a)
	if(aturn == 1) {
	    draw_sprite_ext(792/* spr_adate_atrashbottom */, floor(acounter), x + 8, y, 2, 2, 0, image_blend, modulate.a)
	    if(acounter >= 4)
	        draw_sprite_ext(793/* spr_adate_atrashtop */, GS.faceemotion, x + topx + 8, y - yoff, 2, 2, 0, image_blend, modulate.a)
	    if(acounter < 4) acounter+= 0.5
	}
	if(con == 1) {
	    if(hoopx > x - 60) hoopx-= 25
	    else  hoopx= x - 60
	    if(topx < 100) topx+= 10
	    else  {
	        snd_play(12/* snd_fall */)
	        con= 3
	        drawa= 1
	        sinerf= 30
	        siner= 0
	    }
	}
	if(con == 3 and drawa == 0) {
	    siner++
	    sinerf-= 2
	    rot= sin(siner / 1) * sinerf
	    xoff= sin(siner / 1) * sinerf
	    if(sinerf <= 0) {
	        rot= 0
	        xoff= 0
	        con= 4
	        $Alarm4.start((10) / 30.0)
	    }
	}
	if(con == 5) {
	    if(hoopx < 650) hoopx+= 20
	    else  hoopx= 650
	    if(topx > 0) topx-= 10
	    else  con= 6
	}
	if(fadein == 1) {
	    image_blend= merge_color(16777215, image_blend, 0.7)
	    fadecounter++
	    if(fadecounter > 20) {
	        fadein= 0
	        image_blend= 16777215
	    }
	}
	if(shake > 0) {
	    x= xstart + random(shake) - random(shake)
	    y= ystart + random(shake) - random(shake)
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
