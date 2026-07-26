# Auto-converted from GameMaker: obj_specialtile
extends Node2D

func _ready():
	gg= random(128)
	mygrey= make_color_rgb(gg + 120, gg + 120, gg + 120)
	garfield= 30
	rando= 0
	randofactor= 25
	finalrando= 0
	if(id == instance_find(object_index, 1)) kingrando= 1
	else  kingrando= 0

func _on_destroy():
	if(rando == 0) {
	    garfield/= 1.02
	    randofactor/= 1.1
	    if(randofactor < 3) {
	        randofactor= 3
	        finalrando++
	    }
	    if(finalrando > 12) randofactor= 2
	    if(finalrando > 30) randofactor= 1
	    garfield--
	    if(finalrando > 120) randofactor= -1
	    if(kingrando == 1)
	        caster_set_pitch(obj_papyrus4.computersound, 3 / (garfield / 20 + 2.5))
	    $Alarm0.start((randofactor) / 30.0)
	    gg= floor(random(7))
	    if(gg == 0) mygrey= 16711680
	    if(gg == 1) mygrey= 65535
	    if(gg == 2) mygrey= 65280
	    if(gg == 3) mygrey= 8388736
	    if(gg == 4) mygrey= 4235519
	    if(gg == 5) mygrey= 255
	    if(gg == 6) mygrey= make_color_rgb(255, 100, 100)
	    if(randofactor == -1) {
	        kingrando= 0
	        if(y < 120 or y >= 160) mygrey= 255
	        else  mygrey= make_color_rgb(255, 100, 100)
	    }
	}

func _on_outside_room():
	draw_set_color(mygrey)
	draw_rectangle(x, y, x + 19, y + 19, 0)

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
