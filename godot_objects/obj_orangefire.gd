# Auto-converted from GameMaker: obj_orangefire
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	parent= 339
	siner= random(40)

func _process_end(delta: float):
	if(not is_instance_valid(parent)) {
	    instance_destroy()
	    exit
	} else  {
	    x= parent.x + rememberx
	    y= parent.y + remembery
	    siner++
	    x+= sin(siner / 3) * 2
	    y+= cos(siner / 3) * 2
	    exit
	}

func _on_alarm_0_timeout():
	scr_damagestandard(2, 0, 0, 0, 0)

func _gm_event_7_10():
	remembery= y - parent.y
	rememberx= x - parent.x

func _on_outside_room():
	draw_self_border_e()

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
