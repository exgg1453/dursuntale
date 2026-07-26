# Auto-converted from GameMaker: obj_backgrounder_lastruins
# GM parent: obj_backgrounder_parent
extends Node2D

func _ready():
	scrollspeed= 1

func _gm_event_7_10():
	scrollspeed[0]= 0.1
	scrollspeed[1]= 0.3
	scrollspeed[2]= 0.5
	scrollspeed[3]= 0.6
	scrollspeed[4]= 0.7
	scrollspeed[5]= 0.8
	scrollspeed[6]= 0.9
	i= 0
	while(i < 7) {
	    xxx= view_xview[0]
	    if(xxx > get_viewport_rect().size.x - 320) xxx= get_viewport_rect().size.x - 320
	    if(xxx >= 0)
	        background_x[i]= floor(xxx - xxx * scrollspeed[i])
	    gg= get_viewport_rect().size.x - 320
	    if(xxx >= get_viewport_rect().size.x - 320)
	        background_x[i]= 0 + floor(gg - gg * scrollspeed[i])
	    i++
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
