# Auto-converted from GameMaker: obj_wizardorb_wall
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	w_l= GS.idealborder[0] + 5
	w_r= GS.idealborder[1] - 30
	w_u= GS.idealborder[2] + 5
	w_d= GS.idealborder[3] - 30
	cl= 0
	x= w_l
	y= w_u
	$Alarm0.start((10) / 30.0)
	dmg= 8
	alt= 0

func _on_destroy():
	$Alarm0.start((8) / 30.0)
	cross= instance_create(x + 10, y + 10, 364/* obj_crosszap */)
	cross.speed= 3.5
	if(distance_to_point(obj_heart.x, obj_heart.y) > 190)
	    cross.speed= 5.5
	pop= scr_monstersum()
	cross.direction+= 15 - random(30)
	cross.friction= 0.015
	cross.exist= 200
	cross.dmg= dmg
	if(pop > 1) {
	    cross.direction+= 10 - random(20)
	    $Alarm0.start((15) / 30.0)
	    cross.speed= 2.8
	}
	if(alt == 1) {
	    cross.friction= 0.01
	    cross.speed= 3
	}

func _process(delta: float):
	if(cl == 4) {
	    if(velocity.y > 0 and y > w_d) {
	        y= w_d
	        if(cl == 0) direction+= 90
	        else  direction-= 90
	    }
	    if(velocity.x > 0 and x > w_r) {
	        x= w_r
	        if(cl == 0) direction+= 90
	        else  direction-= 90
	    }
	    if(velocity.y < 0 and y < w_u) {
	        y= w_u
	        if(cl == 0) direction+= 90
	        else  direction-= 90
	    }
	    if(velocity.x < 0 and x < w_l) {
	        x= w_l
	        if(cl == 0) direction+= 90
	        else  direction-= 90
	    }
	}
	if(Input.is_action_pressed("move_left")) x= w_l
	if(Input.is_action_pressed("move_right")) x= w_r
	if(Input.is_action_pressed("move_up")) y= w_u
	if(Input.is_action_pressed("move_down")) y= w_d

func _on_alarm_0_timeout():
	scr_damagestandard(0, 3, 0, 0, 0)

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
