# Auto-converted from GameMaker: obj_fakesanstrigger
extends CharacterBody2D

func _ready():
	if(GS.plot >= 35) instance_destroy()
	if(GS.flag[275] >= 2) instance_destroy()
	conversation= 0
	scale.y= 999
	if(GS.flag[47] > 2) instance_destroy()

func _process(delta: float):
	if(GS.plot >= 35) instance_destroy()

func _on_alarm_0_timeout():
	instance_create(obj_creeptree_sansmaker.x + 35, obj_mainchara.y, 984/* obj_fakedarksans */)
	GS.flag[275]= 2
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
