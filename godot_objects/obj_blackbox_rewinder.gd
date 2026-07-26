# Auto-converted from GameMaker: obj_blackbox_rewinder
extends Node2D

func _ready():
	rew= 0
	rewed= 0
	maxrw= 12
	image_speed= 0.1

func _process(delta: float):
	rew++
	if(rewed == 0 and rew > 95) {
	    rewed= 1
	    vsp= obj_blackbox_pl.velocity.y
	}
	if(rewed == 1) {
	    vsp-= 0.4
	    if(vsp >= -maxrw) {
	        obj_blackbox_pl.velocity.y= vsp
	        obj_plusbomb.velocity.y= vsp
	    }
	}
	if(GS.turntimer < 1) instance_destroy()

func _on_outside_room():
	if(rewed == 0)
	    draw_sprite(520/* spr_recbox */, frame, GS.idealborder[1] - sprite_width - 5, GS.idealborder[3] - sprite_height - 5)
	if(rewed == 1)
	    draw_sprite(521/* spr_rewbox */, frame, GS.idealborder[1] - sprite_width - 5, GS.idealborder[3] - sprite_height - 5)

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
