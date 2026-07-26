# Auto-converted from GameMaker: obj_amalgam_laserdog
# GM parent: obj_amalgambul_parent
extends Node2D

func _ready():
	con= 0
	$Alarm4.start((30) / 30.0)
	image_speed= 0
	scale.x= 3
	scale.y= 3
	y= GS.idealborder[3] - sprite_height - 2
	x= GS.idealborder[1] - sprite_width
	skip= 0
	if(skip == 1) {
	    con= 4
	    frame= 7
	}
	nowx= x
	nowy= y
	dmg= 9

func _gm_event_2_6():
	missle= instance_create(x + 24, y + 16, 543/* obj_dogmissle */)
	$Alarm6.start((7) / 30.0)

func _gm_event_2_5():
	velocity.y= 3 + random(4) * choose(1, -1)
	$Alarm5.start((15 + random(20)) / 30.0)

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    nowx= x
	    nowy= y
	    image_speed= 0.25
	    if(frame >= 7) {
	        image_speed= 0
	        con= 2
	        $Alarm4.start((10) / 30.0)
	    }
	}
	if(con == 3) {
	    con= 4
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 4) {
	    x= nowx + random(3) - random(3)
	    y= nowy + random(3) - random(3)
	}
	if(con == 5) {
	    con= 6
	    velocity.y= -6
	    $Alarm5.start((15) / 30.0)
	    $Alarm6.start((5) / 30.0)
	}
	if(y < GS.idealborder[2]) {
	    y+= 6
	    if(velocity.y < 0) velocity.y= -velocity.y
	}
	if(y > GS.idealborder[3] - sprite_height + 5) {
	    y-= 6
	    if(velocity.y > 0) velocity.y= -velocity.y
	}
	if(GS.turntimer < 1) {
	    GS.turntimer= -1
	    GS.mnfight= 3
	    instance_destroy()
	}

func _gm_event_7_13():
	con= 4
	frame= 7

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
