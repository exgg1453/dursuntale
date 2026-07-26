# Auto-converted from GameMaker: obj_gunshot_stab
extends Node2D

func _ready():
	image_speed= 0.5
	$Alarm1.start((5) / 30.0)
	form= 0
	size= 2
	scale.x= size
	scale.y= size
	shotno= 0
	gunsfx= caster_load("music/sfx_gunshot.ogg")
	caster_play(gunsfx, 1, 1)
	$Alarm6.start((60) / 30.0)
	crit= 0

func _gm_event_2_6():
	caster_free(gunsfx)
	instance_destroy()

func _gm_event_2_4():
	g2= instance_create(x, y, 729/* obj_gunshot_2 */)
	g2.image_blend= image_blend
	if(crit == 1) snd_play(117/* snd_saber3 */)
	shotno++
	if(shotno < 3) $Alarm4.start((3) / 30.0)

func _gm_event_2_2():
	visible= 0
	i= 0
	while(i < 8) {
	    g= instance_create(x, y, 728/* obj_gunshot_star */)
	    g.rotation_degrees= 20 * i
	    g.siner= 45 * i
	    g.image_blend= image_blend
	    i++
	}
	g2= instance_create(x, y, 729/* obj_gunshot_2 */)
	g2.image_blend= image_blend
	shotno++
	$Alarm4.start((3) / 30.0)

func _gm_event_2_1():
	visible= 0
	$Alarm2.start((2) / 30.0)

func _gm_event_7_15():
	image_blend= merge_color(16777215, 65535, 0.5)
	crit= 1

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
