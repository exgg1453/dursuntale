# Auto-converted from GameMaker: obj_toroverworld1
extends Node2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	image_speed= 0
	dsprite= 1103
	usprite= 1112
	lsprite= 1108
	rsprite= 1107
	dtsprite= 1105
	utsprite= 1111
	ltsprite= 1110
	rtsprite= 1109
	myinteract= 0
	facing= 0
	phone= 0
	fader= 0

func _process(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(instance_exists(763/* obj_torface */)) {
	    myinteract= 1
	    if(instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.halt != 0)
	        image_speed= 0.2
	} else  {
	    myinteract= 0
	    if(speed == 0) {
	        frame= 0
	        image_speed= 0
	    }
	    if(speed > 0) image_speed= 0.2
	}
	scr_npcdir(0)
	if(room == 5 and y < 140) fader= 1
	if(fader == 1) {
	    modulate.a-= 0.2
	    if(modulate.a <= 0.2) instance_destroy()
	}

func _on_alarm_0_timeout():
	queue_free()

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
