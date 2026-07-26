# Auto-converted from GameMaker: obj_gyftrotmouth
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	scale.x= 2
	scale.y= 2
	$Alarm0.start((20) / 30.0)
	image_speed= 0

func _gm_event_2_2():
	if(frame > 0) {
	    frame--
	    $Alarm2.start((3) / 30.0)
	} else  $Alarm0.start((45 + random(60)) / 30.0)

func _gm_event_2_1():
	$Alarm2.start((25) / 30.0)
	instance_create(x + 40, y + 46, 234/* obj_gyfcloud */)

func _on_destroy():
	if(frame < 4) {
	    frame++
	    $Alarm0.start((3) / 30.0)
	} else  $Alarm1.start((25) / 30.0)

func _process(delta: float):
	if(instance_exists(236/* obj_gyftrothead */)) {
	    x= obj_gyftrothead.x + 50
	    y= obj_gyftrothead.y + 96
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
