# Auto-converted from GameMaker: obj_butterflybullet_2
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	sum= scr_monstersum()
	velocity.y= -5
	if(sum > 1) velocity.y= -3
	direction+= random(20) - 10
	rotation_degrees= direction
	image_speed= 0.5
	dmg= 0
	off= 0

func _process(delta: float):
	if(velocity.y < -1.5) velocity.y+= 0.15
	image_speed= velocity.y / 8
	if(y < GS.idealborder[2] - 20) off= 1
	if(off == 1) {
	    modulate.a-= 0.05
	    if(modulate.a < 0.1) instance_destroy()
	}

func _on_alarm_0_timeout():
	scr_damagestandard(0, 3, 0, 0, 0)

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
