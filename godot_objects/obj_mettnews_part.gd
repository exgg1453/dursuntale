# Auto-converted from GameMaker: obj_mettnews_part
extends Node2D

func _ready():
	stayx= xstart - view_xview[0]
	stayy= ystart - view_yview[0]
	on= 1
	ang= 1 + random(2) * choose(1, -1)
	if(ang > 0) ang/= 2
	thischara= 1570

func _process_end(delta: float):
	if(not instance_exists(184/* obj_shaker */) and on == 1) {
	    view_xview[0]= round(obj_mainchara.x - view_wview[0] / 2 + 10)
	    view_yview[0]= round(obj_mainchara.y - view_hview[0] / 2 + 10)
	    if(view_yview[0] <= 0) view_yview[0]= 0
	}
	if(on == 1) {
	    x= view_xview[0] + stayx
	    y= view_yview[0] + stayy
	    if(view_yview[0] <= 0) view_yview[0]= 0
	}
	if(on == 0) {
	    gravity= 0.4
	    rotation_degrees+= ang
	    if(y > get_viewport_rect().size.y) instance_destroy()
	}
	if(view_yview[0] <= 0) view_yview[0]= 0

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
