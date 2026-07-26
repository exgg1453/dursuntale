# Auto-converted from GameMaker: obj_pianosolution
extends Node2D

func _ready():
	modulate.a= 0
	siner= 0
	image_speed= 0
	statuetimer= 0
	alpha_x= 0

func _process(delta: float):
	if(instance_exists(1157/* obj_musicstatue */) and GS.flag[86] == 1 and obj_musicstatue.boxactive == 1) {
	    statuetimer++
	    if(statuetimer >= 450) {
	        alpha_x+= 0.005
	        max_alpha= alpha_x
	        if(max_alpha > 1) max_alpha= 1
	        modulate.a= abs(sin(statuetimer / 60)) * max_alpha * 0.8 * (100 - obj_musicstatue.disto) / 100
	        x= xstart + sin(statuetimer / 20) * 3
	        y= ystart + cos(statuetimer / 33) * 2
	        image_speed= 0.06
	    }
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
