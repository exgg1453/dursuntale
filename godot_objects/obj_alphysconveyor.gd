# Auto-converted from GameMaker: obj_alphysconveyor
# GM parent: obj_conveyor_parent
extends Node2D

func _ready():
	scale.y= 4.8
	col= -1
	if(x < get_viewport_rect().size.x / 2) {
	    sprite_index= 1834/* spr_conveyorbelt_d_blue */
	    image_speed= 1
	}
	if(x > get_viewport_rect().size.x / 2) {
	    sprite_index= 1834/* spr_conveyorbelt_d_blue */
	    image_speed= -1
	}

func _process(delta: float):
	col--
	if(col == 0 and GS.interact == 1) {
	    GS.interact= 0
	    obj_mainchara.velocity.y= 0
	}
	if(col > 0) {
	    obj_mainchara.x= x
	    if(x > get_viewport_rect().size.x / 2) obj_mainchara.y-= 4
	    else  obj_mainchara.y+= 4
	}

func _on_alarm_0_timeout():
	col= 4
	if(GS.interact == 0) GS.interact= 1

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
