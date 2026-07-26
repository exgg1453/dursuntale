# Auto-converted from GameMaker: blt_4sidebullet
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	dmg= 0
	l= 0
	parent= 0
	$Alarm3.start((2) / 30.0)
	startspeed= 0
	image_speed= 0.5
	startdir= 0
	limit= 2
	startgrav= 0
	rotdir= 0

func _gm_event_2_4():
	l++
	thisbullet= _spawn("object_index", xstart, ystart)
	if(is_instance_valid(thisbullet)) {
	    thisbullet.startdir= startdir
	    thisbullet.startspeed= startspeed
	    thisbullet.rotdir= rotdir
	    thisbullet.dmg= dmg
	}
	if(l < limit) $Alarm4.start((26) / 30.0)

func _gm_event_2_3():
	if(parent == 1) {
	    $Alarm4.start((26) / 30.0)
	    speed= 2 + random(1.5)
	    g= floor(random(2))
	    rotdir= 0
	    startdir= scr_perpendicular()
	    startspeed= speed
	}
	visible= 1
	direction= startdir
	speed= startspeed

func _on_outside_room():
	draw_self_border()
	direction+= rotdir
	scr_bordercross(12)
	modulate.a+= 0.1

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
