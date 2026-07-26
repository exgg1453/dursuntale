# Auto-converted from GameMaker: obj_backgrounder_dock
# GM parent: obj_backgrounder_parent
extends Node2D

func _ready():
	scrollspeed= 0.8
	xhome= xstart
	yhome= ystart
	$Alarm4.start((60) / 30.0)
	active= 0

func _gm_event_7_10():
	gg= get_viewport_rect().size.x - view_wview[0]
	hh= get_viewport_rect().size.y - view_hview[0]
	if(view_xview[0] >= 0 and view_xview[0] < gg) {
	    x= xhome + floor(view_xview[0] - view_xview[0] * scrollspeed)
	    g= x - xprevious
	    tile_layer_shift(1000100, g, 0)
	    tile_layer_shift(1000002, g / 2, 0)
	}
	if(view_yview[0] >= 0 and view_yview[0] < hh) {
	    y= yhome + floor(view_yview[0] - view_yview[0] * scrollspeed)
	    h= y - yprevious
	    tile_layer_shift(1000100, 0, h)
	    tile_layer_shift(1000002, 0, h / 2)
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
