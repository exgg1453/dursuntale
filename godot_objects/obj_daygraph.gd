# Auto-converted from GameMaker: obj_daygraph
# GM parent: obj_graphparent
extends Node2D

func _ready():
	die= 0
	currenthour= current_hour
	if(currenthour <= 6 or currenthour >= 18) frame= 0
	else  frame= 1
	$Alarm0.start((1800) / 30.0)
	image_speed= 0
	weekday= current_weekday
	if(weekday == 0) day= "SUN"
	if(weekday == 1) day= "MON"
	if(weekday == 2) day= "TUE"
	if(weekday == 3) day= "WED"
	if(weekday == 4) day= "THU"
	if(weekday == 5) day= "FRI"
	if(weekday == 6) day= "SAT"
	if(weekday == 7) day= "SUN"
	rot= 0

func _on_destroy():
	currenthour= current_hour
	if(currenthour <= 6 or currenthour >= 18) frame= 0
	else  frame= 1
	$Alarm0.start((1800) / 30.0)

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x + 24, y + 24, 2, 2, rot, 16777215, 1)
	draw_set_font(1)
	draw_set_color(16777215)
	draw_text(x + 60, y + 10, day)
	rot+= 0.34

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
