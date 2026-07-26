# Auto-converted from GameMaker: obj_sunmoon
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm2.start((1) / 30.0)
	$Alarm3.start((20) / 30.0)
	image_speed= 0.1
	on= 0
	dmg= 5

func _gm_event_2_3():
	if(sum == 1) {
	    aimbullet= instance_create(x + 14, y + 14, 372/* obj_sunbullet */)
	    with(aimbullet)
	        direction= point_direction(x, y, obj_heart.x, obj_heart.y)
	    $Alarm3.start((30) / 30.0)
	}

func _gm_event_2_2():
	instance_create(x + 14, y + 14, 372/* obj_sunbullet */)
	$Alarm2.start((1) / 30.0)
	sum= scr_monstersum()
	if(sum > 1) $Alarm2.start((choose(3)) / 30.0)

func _on_alarm_0_timeout():
	scr_damagestandard(0, 2, 0, 0, 90)

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
