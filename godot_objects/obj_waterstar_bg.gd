# Auto-converted from GameMaker: obj_waterstar_bg
# GM parent: obj_backgrounder_parent
extends Node2D

func _ready():
	f_test= 1
	g_heart= 0
	rememberx= obj_mainchara.x
	rememberview= view_xview[0]
	view_xview[0]= 300
	obj_mainchara.x= 300
	size= 1
	$Alarm0.start((1) / 30.0)
	scrollspeed= size
	xhome= xstart
	if(GS.entrance == 1) {
	    if(x < 0) {
	        x+= 350
	        xhome+= 350
	    }
	    if(x > 320) {
	        x-= 350
	        xhome-= 350
	    }
	    if(x < 0) {
	        x+= 350
	        xhome+= 350
	    }
	    if(x > 320) {
	        x-= 350
	        xhome-= 350
	    }
	    if(x < 0) {
	        x+= 350
	        xhome+= 350
	    }
	    if(x > 320) {
	        x-= 350
	        xhome-= 350
	    }
	    if(x < 0) {
	        x+= 350
	        xhome+= 350
	    }
	    if(x > 320) {
	        x-= 350
	        xhome-= 350
	    }
	}
	if(GS.entrance == 2) {
	    repeat(5)  {
	        if(x < get_viewport_rect().size.x - view_wview[0]) {
	            x+= 350
	            xhome+= 350
	        }
	        if(x > get_viewport_rect().size.x - view_wview[0]) {
	            x-= 350
	            xhome-= 350
	        }
	    }
	}
	x= xhome
	obj_mainchara.x= rememberx

func _on_destroy():
	view_xview[0]= 300
	obj_mainchara.x= 300
	scale.x= size
	scale.y= size
	modulate.a= size / 2 + 0.2
	y= ystart - 15 + random(5) + 30 / size
	scrollspeed= size / 5 + 0.1
	frame= random(10)
	image_speed= 0.25
	go= 1
	obj_mainchara.x= rememberx
	view_xview[0]= rememberview
	x= xhome
	if(obj_mainchara.x > get_viewport_rect().size.x - 90) {
	    repeat(5)  {
	        if(x > get_viewport_rect().size.x) {
	            x-= 320
	            xhome-= 320
	        }
	    }
	}

func _gm_event_7_10():
	if(f_test == 1) {
	    myview= view_xview[0]
	    myview_b= view_xview[0]
	    if(g_heart < 4 and obj_mainchara.x > get_viewport_rect().size.x - 160)
	        myview-= 140
	    g_heart++
	    gg= get_viewport_rect().size.x - view_wview[0]
	    if(myview < 0) myview= 0
	    if(x < myview - 20 and myview < gg) {
	        x+= 350
	        xhome+= 350
	    }
	    if(x > myview + 340) {
	        x-= 350
	        xhome-= 350
	    }
	    if(view_xview[0] >= 0)
	        x= xhome + round(view_xview[0] - view_xview[0] * scrollspeed)
	    if(view_xview[0] >= gg)
	        x= xhome + round(gg - gg * scrollspeed)
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
