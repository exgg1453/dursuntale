# Auto-converted from GameMaker: obj_amalgam_tooth
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	con= 1
	visible= 0
	$Alarm0.start((1) / 30.0)
	top= 1
	anchor= 0
	dmg= 9

func _gm_event_2_4():
	con++

func _gm_event_2_2():
	anchor= 0
	if(top == 1) {
	    velocity.y= -15
	    $Alarm4.start((10) / 30.0)
	}
	if(top == 0) {
	    velocity.y= 4
	    $Alarm4.start((10) / 30.0)
	}
	visible= 1

func _on_destroy():
	if(top == 1) {
	    y= GS.idealborder[2] - sprite_height
	    velocity.y= 2
	    $Alarm4.start((20) / 30.0)
	}
	if(top == 0) {
	    y= GS.idealborder[3]
	    sprite_index= 708/* spr_amalgam_toothd */
	    mask_index= 710
	    velocity.y= -2
	    $Alarm4.start((20) / 30.0)
	}
	visible= 1

func _process(delta: float):
	if(con == 2) {
	    velocity.y= 0
	    anchor= 1
	    con= 3
	}
	if(anchor == 1) {
	    if(top == 1) y= GS.idealborder[2]
	    if(top == 0) y= GS.idealborder[3] - sprite_height
	}
	if(con == 11) instance_destroy()

func _on_alarm_0_timeout():
	scr_damagestandard_x()

func _on_outside_room():
	draw_self_border()

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
