# Auto-converted from GameMaker: obj_loopbulletgrowgen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	xadd= 0
	totalbt= 8
	radius= 2
	idealradius= 55
	circ= radius * 2 * 3.14159265358979
	speed= 2
	myself= 0
	$Alarm0.start((3) / 30.0)
	blue= 0
	blueone= 999
	specialtimer= 999

func _on_destroy():
	if(blue == 1) blue= floor(random(2)) + 1
	i= 0
	while(i < totalbt) {
	    dir= 0 + i * 360 / totalbt
	    xx= x + lengthdir_x(radius, dir - 90)
	    yy= y + lengthdir_y(radius, dir - 90)
	    loopbullet= instance_create(xx, yy, 657/* blt_loopbulletgrow */)
	    loopbullet.speed= speed
	    loopbullet.anglechange= 360 / circ / speed
	    loopbullet.direction= dir
	    loopbullet.xadd= xadd
	    loopbullet.idealradius= idealradius
	    loopbullet.dmg= GS.monsteratk[myself]
	    loopbullet.specialtimer= specialtimer
	    if(blue == 3) blue= 2
	    if(blue == 1) {
	        loopbullet.blue= 1
	        blue= 3
	    }
	    if(blue == 2) blue= 1
	    i++
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
