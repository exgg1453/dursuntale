# Auto-converted from GameMaker: obj_menubone_bottom
# GM parent: obj_sansbullet_parent
extends Node2D

func _ready():
	spot= 0
	idealx= 0
	idealx2= 10
	con= 1
	active= 0
	myspeed= -8
	$Alarm0.start((1) / 30.0)
	terminate= 0
	innate_karma= 1

func _on_destroy():
	idealy= 440
	if(spot == 0) {
	    idealx= 140
	    idealx2= 10
	}
	if(spot == 1) {
	    idealx= 300
	    idealx2= 170
	}
	if(spot == 2) {
	    idealx= 450
	    idealx2= 320
	}
	if(spot == 3) {
	    idealx2= 490
	    idealx= 620
	}
	active= 1

func _process(delta: float):
	if(active == 1) {
	    if(con == 1) {
	        x= idealx
	        y= 480
	        velocity.y= -10
	        con= 2
	    }
	    if(con == 2 and y <= idealy) {
	        velocity.y= 0
	        velocity.x= myspeed
	        con= 3
	    }
	    if(con == 3) {
	        cool= 0
	        if(velocity.x < 0 and x <= idealx2) cool= 1
	        if(velocity.x > 0 and x >= idealx2) cool= 1
	        if(cool == 1) {
	            velocity.x= 0
	            velocity.y= 10
	            con= 4
	        }
	    }
	    if(con == 4 and y >= 480) {
	        speed= 0
	        con= 1
	        if(terminate == 1) instance_destroy()
	    }
	}

func _on_alarm_0_timeout():
	if(obj_sansb_body.damageturn == 0) {
	    // obj_sansb_body
	    with(517) event_user(2)
	    if(GS.hp < 1) GS.hp= 1
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
