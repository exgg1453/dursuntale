# Auto-converted from GameMaker: obj_firestormgen
extends Node2D

func _ready():
	amount= 0
	maxamount= 12
	$Alarm0.start((1) / 30.0)
	baseang= random(100)
	lv= 1
	dr= 0

func _on_destroy():
	if(lv == 1) {
	    velocity.x= 5
	    amount++
	    amt= 20
	    i= 0
	    while(i < amt) {
	        fr= instance_create(x, y, 472/* obj_genericfire */)
	        fr.direction= i * 360 / amt + baseang
	        fr.speed= 3
	        fr.friction= -0.15
	        fr.scale.x= 2
	        fr.scale.y= 2
	        i++
	    }
	    $Alarm0.start((8) / 30.0)
	    if(amount > maxamount) $Alarm0.start((-1) / 30.0)
	}
	if(lv == 2) {
	    velocity.x= 6
	    amount+= 1.2
	    amt= 22
	    baseang+= 1.5
	    i= 0
	    while(i < amt) {
	        fr= instance_create(x, y, 472/* obj_genericfire */)
	        fr.direction= i * 360 / amt + baseang
	        fr.speed= 3.5
	        fr.friction= -0.17
	        fr.scale.x= 2
	        fr.scale.y= 2
	        i++
	    }
	    $Alarm0.start((7) / 30.0)
	    if(amount > maxamount) $Alarm0.start((-1) / 30.0)
	}
	if(lv == 3) {
	    velocity.x= 8
	    amount+= 1.2
	    amt= 22
	    baseang+= 2
	    i= 0
	    while(i < amt) {
	        fr= instance_create(x, y, 472/* obj_genericfire */)
	        fr.direction= i * 360 / amt + baseang
	        fr.speed= 12
	        fr.friction= 0.06
	        fr.scale.x= 2
	        fr.scale.y= 2
	        i++
	    }
	    $Alarm0.start((6) / 30.0)
	    if(amount > maxamount) $Alarm0.start((-1) / 30.0)
	}

func _on_outside_room():
	if(dr < 0.5) dr+= 0.1
	if(GS.turntimer < 6) dr-= 0.2
	draw_set_alpha(dr)
	draw_set_color(0)
	draw_rectangle(-10, -10, 999, 999, 0)
	draw_set_alpha(1)
	if(GS.turntimer <= 0) instance_destroy()

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
