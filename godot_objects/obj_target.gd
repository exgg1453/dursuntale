# Auto-converted from GameMaker: obj_target
extends Node2D

func _ready():
	$Alarm0.start(6 / 30.0)
	fade= 0

func _on_destroy():
	if(GS.weapon == 3) instance_create(x - 16, y, 734/* obj_targetchoice */)
	if(GS.weapon == 13 or GS.weapon == 45 or GS.weapon == 51 or GS.weapon == 52) {
	    r= round(random(1))
	    if(r == 0) instance_create(x - 16, y, 734/* obj_targetchoice */)
	    if(r == 1) instance_create(x + 570, y, 734/* obj_targetchoice */)
	}
	if(GS.weapon == 14 or GS.weapon == 47) {
	    r= round(random(1))
	    if(r == 0) instance_create(x - 16, y, 736/* obj_targetchoicefist */)
	    if(r == 1) instance_create(x + 570, y, 736/* obj_targetchoicefist */)
	}

func _process(delta: float):
	if(fade == 1) {
	    modulate.a-= 0.08
	    scale.x-= 0.06
	    x+= 15.8
	}
	if(scale.x < 0.08) instance_destroy()

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
