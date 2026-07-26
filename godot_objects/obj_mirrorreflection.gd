# Auto-converted from GameMaker: obj_mirrorreflection
extends Node2D

func _ready():
	flip= 0
	horizon= 114
	ceiling= 73
	if(room == 252) {
	    horizon-= 20
	    ceiling-= 20
	}

func _process_end(delta: float):
	if(instance_exists(1570/* obj_mainchara */)) {
	    image_blend= obj_mainchara.image_blend
	    x= obj_mainchara.x
	    y= horizon - obj_mainchara.y - horizon
	    if(y < ceiling) y= ceiling
	    sprite_index= obj_mainchara.sprite_index
	    frame= obj_mainchara.frame
	    if(sprite_index == 1043 and flip == 0) {
	        sprite_index= 1044/* spr_maincharau */
	        flip= 1
	    }
	    if(sprite_index == 1044 and flip == 0) {
	        sprite_index= 1043/* spr_maincharad */
	        flip= 1
	    }
	    flip= 0
	}

func _on_outside_room():
	if(instance_exists(1570/* obj_mainchara */)) {
	    image_blend= obj_mainchara.image_blend
	    x= obj_mainchara.x
	    y= horizon - obj_mainchara.y - horizon
	    if(y < ceiling) y= ceiling
	    sprite_index= obj_mainchara.sprite_index
	    frame= obj_mainchara.frame
	    if(sprite_index == 1043 and flip == 0) {
	        sprite_index= 1044/* spr_maincharau */
	        flip= 1
	    }
	    if(sprite_index == 1044 and flip == 0) {
	        sprite_index= 1043/* spr_maincharad */
	        flip= 1
	    }
	    flip= 0
	}
	draw_sprite_ext(sprite_index, frame, x, y, 1, 1, 0, image_blend, 1)

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
