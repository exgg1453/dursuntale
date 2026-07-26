# Auto-converted from GameMaker: obj_blastbul
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	size= 5
	snd_play(21/* snd_impact */)
	maxsize= 6.2
	pop= scr_monstersum()
	if(pop > 1) {
	    size= 4.5
	    maxsize= 5.5
	}

func _process(delta: float):
	size+= 0.1
	if(size > maxsize) modulate.a-= 0.2
	scale.x= size
	scale.y= size
	if(modulate.a < 0.06) instance_destroy()
	x= xstart + 3 - random(6)
	y= ystart + 3 - random(6)

func _on_alarm_0_timeout():
	scr_damagestandard_x()

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
