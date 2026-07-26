# Auto-converted from GameMaker: obj_vertplanegreen
extends Node2D

func _ready():
	parent= 327
	pop= scr_monstersum()
	if(pop > 1) scale.x= 1.3
	x-= 50

func _process(delta: float):
	if(GS.turntimer < 2) instance_destroy()

func _on_alarm_0_timeout():
	parent.graze++
	pop= scr_monstersum()
	if(pop > 1) parent.graze+= 0.5
	if(parent.graze < 4) snd_play(28/* snd_bell */)
	if(parent.graze > 3) parent.mercymod= 30
	if(parent.graze >= 4) {
	    parent.mercymod= 100
	    GS.monsterdef[parent.myself]= -99
	    snd_play(26/* snd_dumbvictory */)
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
