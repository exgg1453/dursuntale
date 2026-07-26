# Auto-converted from GameMaker: obj_loopdog
# GM parent: blt_parent
extends Node2D

func _ready():
	visible= 0
	$Alarm1.start((4) / 30.0)
	sprite_index= 100/* spr_tinypomwag */
	image_speed= 0.2
	if(scr_monstersum() == 1) sprite_index= 101/* spr_tinypomsad */
	dmg= 9

func _gm_event_2_2():
	sprite_index= 100/* spr_tinypomwag */
	if(scr_monstersum() == 1) sprite_index= 101/* spr_tinypomsad */

func _gm_event_2_1():
	scale.x= -1
	x= GS.idealborder[0] - sprite_width
	y= GS.idealborder[3] - sprite_height - 36
	$Alarm0.start((10) / 30.0)
	visible= 1
	if(scr_monstersum() == 1) {
	    $Alarm0.start((60) / 30.0)
	    $Alarm2.start((60) / 30.0)
	    GS.turntimer= 170
	}

func _on_destroy():
	if(scr_monstersum() > 1) {
	    gen= instance_create(x - 20, y + 10, 688/* obj_loopbulletgrowgen */)
	    gen.dmg= GS.monsteratk[myself]
	    gen.blue= 1
	    add= floor(random(8)) / 10
	    gen.xadd= 2.2 + add
	    gen.speed= 1.2 + add * 1
	    gen.specialtimer= 999
	    sprite_index= 103/* spr_tinypombark */
	    $Alarm2.start((15) / 30.0)
	    $Alarm0.start((75) / 30.0)
	}
	if(scr_monstersum() == 1) {
	    sprite_index= 102/* spr_tinypomsadbark */
	    $Alarm2.start((30) / 30.0)
	    instance_create(x - 20, y + 25, 643/* blt_sadbullet */)
	}

func _on_outside_room():
	if(scr_monstersum() > 1)
	    draw_sprite_ext(sprite_index, frame, GS.idealborder[1] + sprite_width, y, 1, 1, 0, 16777215, 1)
	draw_sprite_ext(sprite_index, frame, x, y, -1, 1, 0, 16777215, 1)
	if(GS.turntimer < 1) {
	    GS.turntimer= -1
	    GS.mnfight= 3
	    instance_destroy()
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
