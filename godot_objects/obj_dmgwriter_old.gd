# Auto-converted from GameMaker: obj_dmgwriter_old
extends Node2D

func _ready():
	stretchwidth= GS.monsterinstance[GS.mytarget].sprite_width
	stretchfactor= stretchwidth / GS.monstermaxhp[GS.mytarget]
	apparenthp= GS.monsterhp[GS.mytarget]
	actualhp= GS.monsterhp[GS.mytarget]
	maxhp= GS.monstermaxhp[GS.mytarget]
	negative= 0
	dmg= GS.damage
	draw_set_color(255)
	$Alarm0.start((2) / 30.0)
	i= 1
	if(dmg != 0) {
	    velocity.y= -4
	    gravity= 0.5
	    gravity_direction= 270
	}

func _gm_event_2_2():
	queue_free()

func _on_destroy():
	if(i == 0) i= 1
	else  i= 0
	if(apparenthp > actualhp - dmg)
	    apparenthp-= round(dmg / 20) + 2
	if(negative == 0 and apparenthp < 0) apparenthp= 0
	$Alarm0.start((2) / 30.0)

func _on_outside_room():
	draw_set_color(0)
	if(dmg < 20 or dmg == 11 or dmg == 21 or dmg == 31 or dmg == 41 or dmg == 51 or dmg == 61 or dmg == 71 or dmg == 81 or dmg == 91)
	    draw_rectangle(x, y - 24, x + 48, y, 0)
	else  draw_rectangle(x, y - 24, x + 64, y, 0)
	draw_set_font(6)
	if(i == 0 or i == 1) draw_set_color(255)
	if(dmg > 0) {
	    draw_text(x, y - 24, dmg)
	    draw_set_color(4210752)
	    draw_rectangle(x, ystart + 8, x + GS.monstermaxhp[GS.mytarget] * stretchfactor, ystart + 20, 0)
	    draw_set_color(65280)
	    draw_rectangle(x, ystart + 8, x + apparenthp * stretchfactor, ystart + 20, 0)
	} else  {
	    draw_set_color(16777215)
	    draw_text(x, y - 24, "MISS")
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
