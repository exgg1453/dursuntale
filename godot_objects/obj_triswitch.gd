# Auto-converted from GameMaker: obj_triswitch
# GM parent: obj_interactable
extends Node2D

func _ready():
	myinteract= 0
	con= 0
	on= 0

func _gm_event_2_3():
	myinteract= 0
	on= 0
	sprite_index= 1853/* spr_onoffswitch_off */

func _process_begin(delta: float):
	if(myinteract == 1 and on == 0 and instance_exists(1265/* obj_triswitchevent */)) {
	    con= 1
	    on= 1
	    myinteract= 2
	    snd_play(106/* snd_noise */)
	    sprite_index= 1854/* spr_onoffswitch_on */
	    $Alarm3.start((90) / 30.0)
	}
	if(on == 1 and instance_exists(1265/* obj_triswitchevent */))
	    obj_triswitchevent.switches++

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
