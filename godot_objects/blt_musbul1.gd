# Auto-converted from GameMaker: blt_musbul1
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	dmg= 7
	image_speed= 0.2
	// obj_shyren
	with(259) {
	    if(emotion == 0) {
	        i= choose(0, 1, 2)
	        caster_play(badnote[i], 0.5, 0.7)
	    } else  {
	        i= floor(random(6))
	        caster_play(note[i], 1, 1)
	    }
	}
	if(obj_shyren.emotion == 0) {
	    speed= 4
	    dep= 1
	    detune= 3
	    dspeed= 1
	}
	if(obj_shyren.emotion >= 1) {
	    dep= 0
	    detune= 2
	    dspeed= 12
	    speed= 7
	}
	direction= random(60) + 250
	siner= random(100)
	gravity_direction= choose(0, 45, 90, 45, 180)
	$Alarm0.start((40 + random(20)) / 30.0)

func _on_destroy():
	gravity= 0.1

func _process(delta: float):
	siner++
	x+= sin(siner * dspeed / 10) * detune

func _gm_event_7_0():
	instance_destroy()

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
