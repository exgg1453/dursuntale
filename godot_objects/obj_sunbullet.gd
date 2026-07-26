# Auto-converted from GameMaker: obj_sunbullet
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	direction= random(360)
	speed= 0.9
	friction= -0.1
	$Alarm0.start((90) / 30.0)
	size= 0.25
	dmg= 8
	sum= scr_monstersum()
	if(sum > 1) speed= 0.7

func _on_destroy():
	instance_destroy()

func _process(delta: float):
	direction-= 2
	sum= scr_monstersum()
	size+= 0.025
	scale.x= size
	scale.y= size

func _on_alarm_0_timeout():
	scr_damagestandard(0, 3, 0, 0, 0)
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
