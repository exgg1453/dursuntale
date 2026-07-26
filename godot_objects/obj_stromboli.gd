# Auto-converted from GameMaker: obj_stromboli
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	active= 1
	off= 0
	modulate.a= 0

func _gm_event_2_3():
	off= 1

func _process(delta: float):
	wall_l= GS.idealborder[0] - 2
	wall_r= GS.idealborder[1] - 22
	wall_d= GS.idealborder[3] - 22
	wall_u= GS.idealborder[2] - 2
	if(active == 1) {
	    if(velocity.x > 0 and x > wall_r) {
	        event_user(1)
	        velocity.y= 0
	        velocity.x= -2
	    }
	    if(velocity.x < 0 and x < wall_l) {
	        event_user(1)
	        velocity.y= 0
	        velocity.x= 2
	    }
	    if(velocity.y > 0 and y > wall_d) {
	        event_user(1)
	        velocity.y= -2
	        velocity.x= 0
	    }
	    if(velocity.y < 0 and y < wall_u) {
	        event_user(1)
	        velocity.y= 2
	        velocity.x= 0
	    }
	}
	if(modulate.a < 1 and off == 0)
	    modulate.a+= 0.1
	if(off == 1) modulate.a-= 0.05
	if(modulate.a < 0.1 and off == 1) instance_destroy()

func _on_alarm_0_timeout():
	if(modulate.a >= 1) scr_damagestandard(0, 3, 0, 0, 0)

func _gm_event_7_11():
	active= 2
	$Alarm3.start((60) / 30.0)

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
