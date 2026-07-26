# Auto-converted from GameMaker: obj_meloneye
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	shake= 1
	ss= 0
	rr= 0
	siner= 0
	timer= 0
	dmg= 8

func _on_destroy():
	instance_create(x + ssin, y + rsin, 525/* obj_melonbullet */)
	$Alarm0.start((17) / 30.0)

func _on_outside_room():
	timer++
	if(timer == 15) $Alarm0.start((5) / 30.0)
	if(timer < 15) {
	    ss+= random(1) - random(0.8)
	    rr+= random(0.8) - random(1)
	    ssin= sin(ss / 3) * 5
	    rsin= sin(rr / 3) * 5
	} else  {
	    ssini= lengthdir_x(5, point_direction(x, y, obj_heart.x + 8, obj_heart.y + 8))
	    rsini= lengthdir_y(5, point_direction(x, y, obj_heart.x + 8, obj_heart.y + 8))
	    if(rsin < rsini - 1) rsin++
	    if(rsin > rsini + 1) rsin--
	    if(ssin < ssini - 1) ssin++
	    if(ssin > ssini + 1) ssin--
	}
	siner++
	sz= sin(siner / 4) * 0.2
	draw_sprite_ext(sprite_index, frame, x - ssin / 2 + sin(siner / 6), y - rsin / 2, 2, 2, 0, 16777215, 1)
	draw_sprite_ext(sprite_index, frame, x + ssin, y + rsin, 0.8 + sz, 0.8 + sz, 0, 16777215, 1)

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
