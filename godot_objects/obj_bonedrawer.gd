# Auto-converted from GameMaker: obj_bonedrawer
extends Node2D

func _ready():
	drawerdown= 0
	image_speed= 0
	damt= 0

func _on_outside_room():
	draw_sprite_part(sprite_index, frame, 0, sprite_height - damt - 6, sprite_width, 6 + damt, x, y)
	if(drawerdown == 1) {
	    if(damt < sprite_height - 6) damt+= 2
	    else  {
	        damt= sprite_height - 6
	        drawerdown= 2
	    }
	}
	if(drawerdown == 3) {
	    if(damt > 0) damt-= 2
	    else  {
	        damt= 0
	        drawerdown= 4
	    }
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
