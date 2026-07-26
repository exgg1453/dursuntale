# Auto-converted from GameMaker: obj_skymoon
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm2.start((1) / 30.0)
	$Alarm3.start((20) / 30.0)
	dmg= 5

func _gm_event_2_3():
	if(sum == 1) {
	    aimbullet= instance_create(200 - random(200), 200 - random(200), 374/* obj_meteorbullet */)
	    with(aimbullet)
	        direction= point_direction(x, y, obj_heart.x, obj_heart.y)
	    $Alarm3.start((30) / 30.0)
	}

func _gm_event_2_2():
	ch= choose(0, 1)
	if(ch == 0)
	    instance_create(GS.idealborder[0] - random(GS.idealborder[0] - 50) - 50, 250 - random(200), 374/* obj_meteorbullet */)
	else 
	    instance_create(GS.idealborder[0] + random(c_borderwidth(0) - 150) - 60, GS.idealborder[2] - 200 - random(50), 374/* obj_meteorbullet */)
	$Alarm2.start((3) / 30.0)
	sum= scr_monstersum()
	if(sum > 1) $Alarm2.start((6) / 30.0)

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
