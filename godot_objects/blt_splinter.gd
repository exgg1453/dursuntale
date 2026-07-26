# Auto-converted from GameMaker: blt_splinter
# GM parent: blt_parent
extends Node2D

func _ready():
	speed= 1.5
	dmg= 0
	iteration= 0
	flush= 0
	iend= 999

func _process(delta: float):
	if(flush == 1 and modulate.a < 1)
	    modulate.a+= 0.1
	if(flush == 1 and modulate.a >= 1) {
	    flush= 2
	    modulate.a= 1
	}
	if(iteration > 0 and flush == 0) {
	    flush= 1
	    modulate.a= 0
	}
	if(iend == iteration) instance_destroy()

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
