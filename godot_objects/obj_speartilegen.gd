# Auto-converted from GameMaker: obj_speartilegen
extends Node2D

func _ready():
	$Alarm3.start((2) / 30.0)
	tums= 57
	sound1= 0
	sound2= 0
	if(room == 112) $Alarm3.start((30) / 30.0)

func _gm_event_2_3():
	$Alarm3.start((tums) / 30.0)
	instance_create(0, 0, 1048/* obj_speartile */)
	instance_create(0, 0, 1048/* obj_speartile */)
	instance_create(0, 0, 1048/* obj_speartile */)
	instance_create(0, 0, 1048/* obj_speartile */)
	instance_create(0, 0, 1048/* obj_speartile */)
	instance_create(0, 0, 1048/* obj_speartile */)
	instance_create(0, 0, 1048/* obj_speartile */)
	g= instance_create(0, 0, 1048/* obj_speartile */)
	g.duty= 1
	if(tums > 35) tums-= 0.75
	if(tums <= 35 and tums > 28) tums-= 0.25
	if(tums > 15 and tums <= 28) tums-= 0.5
	snd_play(13/* snd_spearappear */)
	if(tums <= 15) {
	    snd_play(114/* snd_squeak */)
	    if(room == 111) GS.flag[285]= 1
	}

func _process(delta: float):
	if(sound1 == 1) {
	    snd_play(13/* snd_spearappear */)
	    sound1= 0
	}
	if(sound2 == 1) {
	    snd_play(14/* snd_spearrise */)
	    sound2= 0
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
