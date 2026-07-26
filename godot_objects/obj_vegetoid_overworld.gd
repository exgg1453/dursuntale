# Auto-converted from GameMaker: obj_vegetoid_overworld
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	talkedto= 0
	fought= 0
	image_speed= 0
	if(GS.flag[202] > 11) instance_destroy()
	if(GS.flag[7] == 1) instance_destroy()

func _gm_event_2_1():
	GS.battlegroup= 18
	if(GS.flag[6] == 1) GS.battlegroup= 122
	GS.flag[200]= 202
	GS.interact= 0
	instance_create(0, 0, 142/* obj_battler */)
	instance_destroy()

func _on_destroy():
	GS.interact= 1
	talkedto= 1
	frame= 1
	snd_play(29/* snd_b */)
	$Alarm1.start((25) / 30.0)

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)

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
