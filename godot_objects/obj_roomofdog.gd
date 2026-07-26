# Auto-converted from GameMaker: obj_roomofdog
extends Node2D

func _ready():
	$Alarm0.start((5) / 30.0)

func _on_destroy():
	caster_free(-3)
	visible= 1
	type= floor(random(8))
	scale.x= 2
	scale.y= 2
	if(type == 7) {
	    x= get_viewport_rect().size.x / 2
	    y= get_viewport_rect().size.y / 2
	    sprite_index= 1518/* spr_tobdog_sleep_trash */
	    thissong= caster_load("music/sigh_of_dog.ogg")
	    caster_loop(thissong, 1, 0.8 + random(0.2))
	    image_speed= 0.05
	} else  {
	    x= get_viewport_rect().size.x / 2 - sprite_width / 2
	    y= get_viewport_rect().size.y / 2 - sprite_height / 2
	    thissong= caster_load("music/dance_of_dog.ogg")
	    caster_loop(thissong, 1, 0.95 + random(0.1))
	    image_speed= 0.15
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
