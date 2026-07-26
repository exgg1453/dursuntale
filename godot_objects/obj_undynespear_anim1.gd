# Auto-converted from GameMaker: obj_undynespear_anim1
extends Node2D

func _ready():
	scale.x= 0.9
	modulate.a= 0.8
	direction= point_direction(x, y, 210, 130)
	speed= point_distance(x, y, 210, 130) / 6
	rotation_degrees= direction
	$Alarm3.start((5) / 30.0)
	snd_play(20/* snd_arrow */)
	part= 0

func _gm_event_2_4():
	part++

func _gm_event_2_3():
	snd_play(21/* snd_impact */)
	instance_create(0, 0, 118/* obj_flasher */)
	scr_shake(4, 4, 2)
	if(instance_exists(1063/* obj_undynedate_inside */)) {
	    with(obj_undynedate_inside.table) frame= 1
	}
	speed= 0
	sprite_index= 1451/* spr_undynespear_stabbed */
	rotation_degrees+= 90

func _process(delta: float):
	if(part == 1) {
	    sprite_index= 1449/* spr_undynespear */
	    scr_getideal(obj_mainchara.x - 13, obj_mainchara.y - 5)
	    part= 2
	    $Alarm4.start((16) / 30.0)
	    rotation_degrees-= 450
	    curangle= rotation_degrees
	    ss= 0
	}
	if(part == 2) {
	    ss++
	    scr_moveideal(16)
	    rotation_degrees+= 10
	}
	if(part == 3) {
	    rotation_degrees= 140
	    instance_create(210, 155, 1062/* obj_controlspear */)
	    instance_destroy()
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
