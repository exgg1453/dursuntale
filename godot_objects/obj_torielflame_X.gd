# Auto-converted from GameMaker: obj_torielflame_X
extends Node2D

func _ready():
	image_speed= 0
	visible= 0
	$Alarm0.start((70) / 30.0)
	$Alarm1.start((100) / 30.0)
	flashing= 1
	scale.x= 2
	scale.y= 2

func _gm_event_2_1():
	velocity.x= -8
	flashing= 0
	visible= 1
	image_speed= 0.25

func _on_destroy():
	if(flashing == 1) {
	    if(visible == 1) visible= 0
	    else  visible= 1
	    $Alarm0.start((1) / 30.0)
	}

func _on_alarm_0_timeout():
	other.conversation= 17
	other.sprite_index= 164/* spr_floweyhurt */
	snd_play(43/* snd_ehurt1 */)
	GS.hshake= 2
	GS.shakespeed= 2
	GS.vshake= 0
	instance_create(0, 0, 184/* obj_shaker */)
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
