# Auto-converted from GameMaker: obj_starker
extends Node2D

func _ready():
	subject= 2.8729472348937300000000000000000000
	if(GS.flag[85] == 1) {
	    instance_destroy()
	    exit
	} else  {
	    if(instance_exists(1570/* obj_mainchara */)) {
	        obj_mainchara.usprite= 1007
	        obj_mainchara.rsprite= 1008
	        obj_mainchara.dsprite= 1005
	        obj_mainchara.lsprite= 1009
	        subject= 1570
	    }
	    exit
	}

func _process_end(delta: float):
	if(is_instance_valid(subject)) {
	    x= subject.x
	    y= subject.y
	    scale.x= 1
	    z_index= subject.z_index + 100
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
