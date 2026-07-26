# Auto-converted from GameMaker: obj_spared
extends Node2D

func _ready():
	sprite_index= GS.monstersprite
	modulate.a= 0.5
	snd_stop(91)
	snd_play(91/* snd_vaporized */)
	n= 0
	while(n < 14) {
	    j= instance_create(random(sprite_width / 2) + sprite_width / 4 + x - 8, random(sprite_height / 2) + sprite_width / 4 + y - 8, 182/* obj_dustcloud */)
	    j.rightside= (8 + j.x - x) / sprite_width / 2
	    j.topside= (8 + j.y - y) / sprite_height / 2
	    n++
	}

func _on_destroy():
	x+= shudder
	if(shudder < 0) shudder= -(shudder + 2)
	else  shudder= -shudder
	$Alarm0.start((2) / 30.0)
	if(shudder == 0) {
	    $Alarm0.start((0) / 30.0)
	    exit
	} else  exit

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
