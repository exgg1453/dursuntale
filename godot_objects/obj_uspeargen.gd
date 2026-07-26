# Auto-converted from GameMaker: obj_uspeargen
extends Node2D

func _ready():
	$Alarm0.start((10) / 30.0)
	spearamt= 0

func _on_destroy():
	move= 0
	if(instance_exists(1117/* obj_undynea_actor */)) {
	    move= obj_undynea_actor.velocity.x
	    obj_undynea_actor.sprite_index= 1437/* spr_undyne_starkd_arm */
	    obj_undynea_actor.$Alarm8.start((20) / 30.0)
	    star= instance_create(x - 5, y + 5, 1040/* obj_magicstar */)
	    star.velocity.x= move
	    star.z_index= obj_undynea_actor.z_index - 1
	    snd_play(13/* snd_spearappear */)
	}
	xx= x
	yy= y
	if(room == 93) {
	    xx= -100
	    yy= choose(240, 0)
	}
	repeat(3)  {
	    a= instance_create(xx - 5, yy + 5, 1042/* obj_undynespear */)
	    a.move= move
	}
	if(spearamt < 35) {
	    spearamt+= 0.3
	    if(spearamt > 13) spearamt+= 0.4
	} else  {
	    snd_play(114/* snd_squeak */)
	    if(room == 92) GS.flag[284]= 1
	}
	$Alarm0.start((48) / 30.0)
	alarm[0]-= spearamt

func _process(delta: float):
	if(GS.interact != 0) alarm[0]++

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
