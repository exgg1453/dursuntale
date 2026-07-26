# Auto-converted from GameMaker: obj_heartcontainer
extends Node2D

func _ready():
	image_speed= 0.25
	con= 0
	h= 6

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(frame >= 6 and con == 0) {
	    image_speed= 0
	    con= 2
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 3) {
	    sprite_index= 1876/* spr_heartcontainer */
	    if(image_blend == 16777215) sprite_index= 1877/* spr_heartcontainer_empty */
	    image_speed= 0.1
	    h++
	    if(h >= sprite_height) {
	        con= 4
	        if(image_blend == 16777215) snd_play(21/* snd_impact */)
	    }
	}

func _on_outside_room():
	draw_sprite_part_ext(sprite_index, frame, 0, 0, sprite_width, h, x, y - h, 1, 1, image_blend, 1)

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
