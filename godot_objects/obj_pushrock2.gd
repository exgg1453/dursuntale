# Auto-converted from GameMaker: obj_pushrock2
# GM parent: obj_pushrock1
extends CharacterBody2D

func _ready():
	push= 0
	if(GS.flag[32] == 1) {
	    x+= 80
	    push= 1
	}

func _process(delta: float):
	scr_depth()
	if(GS.flag[32] == 1) x= 280

func _on_alarm_0_timeout():
	if(push == 0) {
	    push= 1
	    x= 280
	    obj_mainchara.x-= 6
	    GS.flag[32]= 1
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
