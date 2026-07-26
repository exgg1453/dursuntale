# Auto-converted from GameMaker: obj_sadspider
extends Node2D

func _ready():
	con= 0
	image_speed= 0.2
	scale.x= 2
	scale.y= 2
	x= 730
	velocity.x= -3

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 0 and x < 400) {
	    velocity.x-= 0.2
	    if(velocity.x <= 0) {
	        image_speed= 0
	        velocity.x= 0
	        con= 1
	    }
	}
	if(con == 1) {
	    $Alarm4.start((90) / 30.0)
	    con= 2
	}
	if(con == 2) {
	    image_speed= 0.1
	    velocity.x= -1
	    con= 3
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 4) {
	    image_speed= 0
	    velocity.x= 0
	    con= 5
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 6) {
	    velocity.x= 6
	    image_speed= 0.25
	    con= 7
	}
	if(con == 7 and x > 800) {
	    con= 8
	    flower= instance_create(x, y - 8, 1363/* obj_npc_marker */)
	    flower.sprite_index= 411/* spr_tinyspider_flower */
	    flower.scale.x= 2
	    flower.scale.y= 2
	    flower.image_speed= 0
	    flower.visible= 1
	    velocity.x= -3
	}
	if(con > 7 and con < 10) {
	    flower.x= x - 20
	    flower.y= y - 20
	}
	if(con == 8 and x < 380) {
	    velocity.x+= 0.1
	    if(velocity.x >= 0) {
	        image_speed= 0
	        velocity.x= 0
	        con= 9
	        $Alarm4.start((50) / 30.0)
	    }
	}
	if(con == 10) {
	    flower.x-= 0.5
	    flower.y+= 0.25
	    if(flower.y > y - 6) {
	        con= 11
	        $Alarm4.start((90) / 30.0)
	    }
	}
	if(con == 12) {
	    velocity.x= 2
	    image_speed= 0.25
	    con= 13
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 14) {
	    velocity.x= 0
	    image_speed= 0
	    con= 15
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 16) {
	    GS.monster[0]= 0
	    velocity.x= 8
	    image_speed= 0.5
	    con= 17
	}
	if(con == 17 and x > 700) instance_destroy()

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
