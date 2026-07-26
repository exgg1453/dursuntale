# Auto-converted from GameMaker: blt_whiteax
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	hard= 0
	image_speed= 0
	visible= 0
	sprite_index= 96/* spr_whiteax2 */
	modulate.a= 0
	if(instance_number(object_index) > 1) axetype= 1
	else  axetype= 0
	if(axetype == 0) {
	    x= GS.idealborder[0] - 130
	    frame= 0
	    velocity.x= 0
	} else  {
	    x= GS.idealborder[1] - 50
	    frame= 1
	    velocity.x= 0
	}
	$Alarm1.start((10) / 30.0)
	y= 309
	if(x < 140) x= 99
	else  x= 350
	dmg= 0
	g= 0
	hurted= 0
	blconnum= 0
	move= 0

func _gm_event_1_0():
	GS.turntimer= -1
	GS.mnfight= 3

func _gm_event_2_1():
	if(move == 1) {
	    if(axetype == 0) velocity.x= 1.8
	    else  velocity.x= -1.8
	    velocity.y= -3.8
	    if(hard == 1) velocity.y= -3.4
	    if(scr_monstersum() == 1) velocity.y= -3.1
	    gravity_direction= 270
	    gravity= 0.2
	}
	if(move == 0) {
	    velocity.x= 0
	    $Alarm1.start((10 + floor(random(14))) / 30.0)
	    move= 1
	}
	visible= 1

func _process_end(delta: float):
	if(GS.turntimer < 1) {
	    GS.turntimer= -1
	    GS.mnfight= 3
	    instance_destroy()
	}
	if(modulate.a < 1) modulate.a+= 0.05

func _on_alarm_0_timeout():
	velocity.y= 0
	velocity.x= 0
	gravity= 0
	x= xprevious
	y= yprevious
	$Alarm1.start((15) / 30.0)
	if(instance_exists(184/* obj_shaker */)) {
	    // obj_shaker
	    with(184) instance_destroy()
	}
	snd_play(106/* snd_noise */)
	GS.hshake= 3
	GS.shakespeed= 2
	GS.vshake= 0
	instance_create(0, 0, 184/* obj_shaker */)
	if(scr_monstersum() == 1) $Alarm1.start((4) / 30.0)

func _on_outside_room():
	draw_self_border()

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
