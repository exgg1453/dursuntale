# Auto-converted from GameMaker: obj_floweydmgwriter
extends Node2D

func _ready():
	stretchwidth= 450
	stretchfactor= 450 / GS.floweymaxhp
	apparenthp= GS.floweyhp
	actualhp= GS.floweyhp
	maxhp= GS.floweymaxhp
	negative= 0
	dmg= GS.damage
	$Alarm0.start((2) / 30.0)
	i= 1
	if(dmg != 0) {
	    velocity.y= -4
	    gravity= 0.5
	    gravity_direction= 270
	}

func _gm_event_2_2():
	instance_destroy()

func _on_destroy():
	if(i == 0) i= 1
	else  i= 0
	if(apparenthp > actualhp - dmg)
	    apparenthp-= dmg / 18
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
	draw_set_color(0)
	draw_rectangle(x - 1, ystart + 7, x + GS.floweymaxhp * stretchfactor + 1, ystart + 28, 0)
	draw_set_color(4210752)
	draw_rectangle(x, ystart + 8, x + GS.floweymaxhp * stretchfactor, ystart + 28, 0)
	draw_set_color(65280)
	if(apparenthp > 0)
	    draw_rectangle(x, ystart + 8, x + apparenthp * stretchfactor, ystart + 28, 0)
	i= place
	while(i >= 0) {
	    draw_set_color(255)
	    draw_sprite_ext(33/* spr_dmgnum_o */, numnum[i], x - 20 + stretchwidth / 2 - i * 32 + place * 16, y - 28, 1, 1, 0, 255, 1)
	    i--
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
