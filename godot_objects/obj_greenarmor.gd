# Auto-converted from GameMaker: obj_greenarmor
extends Node2D

func _ready():
	if(instance_exists(310/* obj_bara02 */)) {
	    g= obj_bara02.armor
	    r= 255 - obj_bara02.armor
	} else  {
	    if(instance_exists(311/* obj_bara03 */)) {
	        g= obj_bara03.armor
	        r= 255 - obj_bara03.armor
	    }
	}
	b= 0
	image_blend= make_color_rgb(r, g, b)
	siner= 0
	inv= 0

func _process(delta: float):
	image_blend= make_color_rgb(r, g, b)
	y+= sin(siner / 20) * 2
	x+= cos(siner / 10) * 6
	siner++
	if(GS.turntimer < 3) {
	    if(instance_exists(310/* obj_bara02 */)) obj_bara02.armor= g
	    if(instance_exists(311/* obj_bara03 */)) obj_bara03.armor= g
	    if(r > 99) {
	        GS.mnfight= 5
	        GS.border= 0
	    }
	    instance_destroy()
	}
	inv--

func _on_alarm_0_timeout():
	if(inv <= 0) {
	    snd_play(28/* snd_bell */)
	    g-= 21
	    r+= 21
	    inv= 20
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
