# Auto-converted from GameMaker: obj_spinbullet_huge
# GM parent: obj_floweybullet_parent
extends Node2D

func _ready():
	rotation_degrees= 0
	siner= 0
	hits= 0
	trick= 0
	king= 0

func _gm_event_2_3():
	move_towards_point(centerx, centery, 12)
	if(king == 1) snd_play(142/* snd_shakerbreaker */)

func _process(delta: float):
	rotation_degrees+= 30

func _on_alarm_0_timeout():
	if(trick == 0) event_inherited()
	if(trick == 1) {
	    snd_play(155/* snd_heal_c */)
	    GS.my_hp= 50
	    obj_flowey_master.dcon= 40
	    with(object_index) instance_destroy()
	}
	if(trick == 2) {
	    // obj_spinbullet_final_gen
	    with(1647) event_user(1)
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
