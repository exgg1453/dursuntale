# Auto-converted from GameMaker: obj_6heal
extends Node2D

func _ready():
	image_blend= 65280
	if(instance_exists(1603/* obj_6soul_helpcutscene */)) z_index= -14
	modulate.a= 0
	sprite_index= choose(2231, 2222, 2214, 2219, 2210, 2209)
	if(sprite_index != 2231) {
	    scale.x= 2
	    scale.y= 2
	}
	image_speed= 0
	rotation_degrees= random(360)
	velocity.y= 2.5 + random(1)

func _process(delta: float):
	if(modulate.a < 1) modulate.a+= 0.1
	if(y > 540) instance_destroy()
	rotation_degrees++

func _on_alarm_0_timeout():
	snd_stop(155)
	snd_play(155/* snd_heal_c */)
	held= 0
	if(held == 0 and GS.my_hp <= 10) {
	    GS.my_hp+= 6
	    held= 1
	}
	if(held == 0 and GS.my_hp <= 20) {
	    GS.my_hp+= 4
	    held= 1
	}
	if(held == 0 and GS.my_hp <= 30) {
	    GS.my_hp+= 3
	    held= 1
	}
	if(held == 0 and GS.my_hp <= 40) {
	    GS.my_hp+= 2
	    held= 1
	}
	if(held == 0 and GS.my_hp <= 50) {
	    GS.my_hp++
	    held= 1
	}
	instance_destroy()

func _gm_event_7_0():
	instance_destroy()

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
