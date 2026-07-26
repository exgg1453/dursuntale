# Auto-converted from GameMaker: obj_flylight_a
extends Node2D

func _ready():
	friction= -0.2
	size= 0.5
	scale.x= 0.5
	scale.y= 0.5
	initvelocity.x= 0
	$Alarm0.start((1) / 30.0)

func _on_destroy():
	initvelocity.x= velocity.x

func _process(delta: float):
	size+= 0.04
	scale.x= size
	scale.y= size
	if(y > 400) instance_destroy()
	rotation_degrees= direction

func _on_alarm_0_timeout():
	b= instance_create(x, y, 1188/* obj_bouncelight */)
	b.velocity.y= -velocity.y / 2 - random(1)
	b.velocity.x= velocity.x
	b.velocity.x+= 2 - random(4)
	b.rotation_degrees= rotation_degrees
	b.scale.x= scale.x
	b.scale.y= scale.y
	if(instance_exists(1196/* obj_counterscroller */)) {
	    if(obj_counterscroller.fakev > -2)
	        obj_counterscroller.fakev-= 6
	    if(obj_counterscroller.fakev < -3) obj_counterscroller.fakev= -3
	    snd_play(92/* snd_chug */)
	    if(not instance_exists(184/* obj_shaker */)) scr_shake(2, 2, 2)
	}
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
