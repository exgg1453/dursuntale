# Auto-converted from GameMaker: blt_clawbullet_white
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	dmg= 0
	l= 0
	parent= 0
	$Alarm3.start((2) / 30.0)
	startspeed= 0
	image_speed= 0.5
	startdir= 0
	limit= 4 + round(random(3))
	startgrav= 0
	rotdir= 0
	x-= 12
	y-= 12

func _gm_event_2_4():
	l++
	thisbullet= _spawn("object_index", xstart, ystart)
	thisbullet.startdir= startdir
	thisbullet.startspeed= startspeed
	thisbullet.rotdir= rotdir
	thisbullet.dmg= dmg
	if(l < limit) $Alarm4.start((6) / 30.0)

func _gm_event_2_3():
	if(parent == 1) {
	    $Alarm4.start((6) / 30.0)
	    speed= 1.5 + random(0.5)
	    g= floor(random(2))
	    if(y < GS.idealborder[2]) {
	        if(x > GS.idealborder[0] + c_borderwidth(0) / 2) g= 0
	        else  g= 1
	    }
	    if(y > GS.idealborder[3]) {
	        if(x > GS.idealborder[0] + c_borderwidth(0) / 2) g= 1
	        else  g= 0
	    }
	    if(g == 1) rotdir= 1 + random(1)
	    if(g == 0) rotdir= -1 - random(1)
	    startdir= scr_perpendicular()
	    startspeed= speed
	}
	friction= -0.1
	visible= 1
	direction= startdir
	speed= startspeed

func _on_outside_room():
	rotation_degrees= direction + rotdir * 2
	draw_sprite_ext(sprite_index, frame, x, y, 1, 1, rotation_degrees, 16777215, modulate.a)
	direction+= rotdir
	scr_bordercross(12)
	modulate.a+= 0.1

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
