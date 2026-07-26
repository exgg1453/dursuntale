# Auto-converted from GameMaker: obj_butterflybullet
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	image_speed= 0.2
	initx= x
	inity= y
	siner= 0
	sinerfactor= 64
	x= initx + sin(degtorad(siner)) * sinerfactor
	y= inity + cos(degtorad(siner)) * sinerfactor
	rotation_degrees= siner + 90
	siner2= 0
	dmg= 0
	green= 0
	s2factor= 1
	sineradd= 4

func _process(delta: float):
	siner+= sineradd
	siner2+= s2factor
	x= initx + sin(degtorad(siner)) * sinerfactor
	y= inity + cos(degtorad(siner)) * sinerfactor
	rotation_degrees= siner
	sinerfactor-= sin(siner2 / 6) * 1.2
	x+= sin(siner2 / 12) * 14
	y+= cos(siner2 / 12) * 14

func _on_alarm_0_timeout():
	if(green == 0) scr_damagestandard(0, 3, 0, 0, 0)
	if(green == 1) {
	    if(instance_exists(394/* obj_whimsalot */)) {
	        GS.msg[0]= "* Whimsalot doesn\'t want to&  fight anymore."
	        obj_whimsalot.mercymod+= 40
	    }
	    if(GS.hp < GS.maxhp) GS.hp++
	    snd_play(109/* snd_power */)
	    instance_destroy()
	    pop= scr_monstersum()
	    if(pop == 1) GS.turntimer= 20
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
