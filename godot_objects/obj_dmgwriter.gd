# Auto-converted from GameMaker: obj_dmgwriter
extends Node2D

func _ready():
	stretchwidth= GS.monsterinstance[GS.mytarget].wd
	stretchfactor= stretchwidth / GS.monstermaxhp[GS.mytarget]
	apparenthp= GS.monsterhp[GS.mytarget]
	actualhp= GS.monsterhp[GS.mytarget]
	maxhp= GS.monstermaxhp[GS.mytarget]
	negative= 0
	special= 0
	dmg= GS.damage
	$Alarm0.start((1) / 30.0)
	i= 1
	if(dmg != 0) {
	    velocity.y= -4
	    gravity= 0.5
	    gravity_direction= 270
	}
	drawbar= 1

func _gm_event_2_2():
	instance_destroy()

func _on_destroy():
	if(i == 0) i= 1
	else  i= 0
	if(apparenthp > actualhp - dmg)
	    apparenthp-= dmg / 15
	else  apparenthp= actualhp - dmg
	if(negative == 0 and apparenthp < 0) apparenthp= 0
	$Alarm0.start((2) / 30.0)

func _on_outside_room():
	thisnum= dmg
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
	if(thisnum > 0) {
	    if(drawbar == 1) {
	        draw_set_color(0)
	        draw_rectangle(x - 1, ystart + 7, x + round(GS.monstermaxhp[GS.mytarget] * stretchfactor + 1), ystart + 21, 0)
	        draw_set_color(4210752)
	        draw_rectangle(x, ystart + 8, x + round(GS.monstermaxhp[GS.mytarget] * stretchfactor), ystart + 20, 0)
	        draw_set_color(65280)
	        if(apparenthp > 0)
	            draw_rectangle(x, ystart + 8, round(x + apparenthp * stretchfactor), ystart + 20, 0)
	    }
	    i= place
	    while(i >= 0) {
	        draw_set_color(255)
	        if(stretchwidth <= 120)
	            draw_sprite_ext(33/* spr_dmgnum_o */, numnum[i], x + 30 - i * 32 + place * 16, y - 28, 1, 1, 0, 255, 1)
	        else 
	            draw_sprite_ext(33/* spr_dmgnum_o */, numnum[i], x - 30 + stretchwidth / 2 - i * 32 + place * 16, y - 28, 1, 1, 0, 255, 1)
	        i--
	    }
	}
	if(thisnum == 0) {
	    draw_set_color(16777215)
	    if(special == 0)
	        draw_sprite_ext(32/* spr_dmgmiss_o */, 0, x - 10, y - 16, 1, 1, 0, 12632256, 1)
	    if(special == 1) {
	        draw_set_color(255)
	        draw_set_font(1)
	        ex= choose(0, 1, 2, 3, 4, 5)
	        if(ex == 0)
	            draw_text(x - 10, y - 10, "Don\'t worry about it.")
	        if(ex == 1) draw_text(x - 10, y - 10, "Absorbed")
	        if(ex == 2) draw_text(x - 10, y - 10, "I\'m lovin\' it.")
	        if(ex == 3)
	            draw_text(x - 10, y - 10, "But it didn\'t work.")
	        if(ex == 4) draw_text(x - 10, y - 10, "nope")
	        if(ex == 5) draw_text(x - 10, y - 10, "FAILURE")
	    }
	}
	if(y > ystart) {
	    y= ystart
	    velocity.y= 0
	    gravity= 0
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
