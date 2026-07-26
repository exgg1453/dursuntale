# Auto-converted from GameMaker: obj_mkid_shadow
extends Node2D

func _ready():
	visible= 0
	$Alarm1.start((1) / 30.0)
	follow= -1
	if(GS.plot > 112) instance_destroy()

func _gm_event_2_3():
	if(con == 2) {
	    con= 3
	    speedup= 1
	    follow= 1
	}
	if(con == 1) {
	    velocity.x= 0
	    sprite_index= usprite
	    frame= 0
	    image_speed= 0
	    con= 2
	    $Alarm3.start((110) / 30.0)
	}

func _gm_event_2_1():
	visible= 1
	y= obj_mainchara.y + 3
	x= obj_mainchara.x - 24
	if(GS.entrance == 1) x= obj_mainchara.x - 24
	if(GS.entrance == 2) x= obj_mainchara.x + 24
	rsprite= 1383
	lsprite= 1382
	usprite= 1384
	dsprite= 1381
	if(GS.plot > 112) instance_destroy()
	follow= 1
	image_speed= 0
	con= 0
	speedup= 0
	z_index= obj_mainchara.z_index
	look= 0

func _process_end(delta: float):
	if(follow == 1) {
	    moving= 0
	    if(obj_mainchara.x < x - 34) {
	        x-= 3
	        if(speedup == 1) x-= 3
	        sprite_index= lsprite
	        image_speed= 0.25
	        moving= 1
	        look= 0
	    }
	    if(obj_mainchara.x > x + 34) {
	        x+= 3
	        if(speedup == 1) x+= 3
	        sprite_index= rsprite
	        image_speed= 0.25
	        moving= 1
	        look= 0
	    }
	    if(moving == 0) {
	        speedup= 0
	        frame= 0
	        image_speed= 0
	        look++
	        if(look > 60) sprite_index= usprite
	    }
	}
	if(x > 450 and con == 0 and GS.flag[91] < 6) {
	    velocity.x= 6
	    GS.flag[91]= 6
	    follow= 2
	    con= 1
	    sprite_index= rsprite
	    frame= 0
	    image_speed= 0.25
	    $Alarm3.start((60) / 30.0)
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
