# Auto-converted from GameMaker: obj_flyingiceblock
extends Node2D

func _ready():
	velocity.x= 6
	friction= 0.1
	velocity.y= -2
	gravity= 0.3
	gravity_direction= 270
	stage= 0
	scale.x= -1
	x-= sprite_width
	if(scr_murderlv() >= 7) instance_destroy()
	if(GS.flag[7] == 1) instance_destroy()
	kid= 43948
	stagetimer= 0

func _process(delta: float):
	if(y > ystart + 48 and stagetimer == 0) {
	    stagetimer= 1
	    snd_play(22/* snd_splash */)
	    kid= scr_marker(x + sprite_width / 2 + 8, y + sprite_height + 10, 1578)
	    kid.scale.x= 4
	    kid.scale.y= 0
	    kid.z_index= z_index - 10
	}
	if(y > ystart + 55 and stage == 0) {
	    stage= 1
	    sprite_index= 1306/* spr_waterice */
	    image_speed= 0.2
	    gravity= 0
	    friction= 0
	    velocity.y= 0
	    velocity.x= 0
	    velocity.x= 1
	    friction= -0.1
	}
	if(stagetimer == 1 and is_instance_valid(kid)) {
	    if(kid.scale.x > 2)
	        kid.scale.x-= 0.4
	    kid.scale.y+= 0.2
	    if(kid.scale.y > 0.8)
	        kid.modulate.a-= 0.2
	    if(kid.modulate.a < 0.2) {
	        with(kid) instance_destroy()
	    }
	}
	if(x > get_viewport_rect().size.x + 80) {
	    if(is_instance_valid(kid)) {
	        with(kid) instance_destroy()
	    }
	    instance_destroy()
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
