# Auto-converted from GameMaker: obj_sorry_trashball
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	rotation_degrees= random(360)
	aa= choose(1, -1) * (random(4) + 1)
	velocity.y= -12
	if(x < 320) velocity.x= 1 + random(1)
	if(x > 320) velocity.x= -10
	random(1)
	gravity_direction= 260 + random(20)
	gravity= 0.5 + random(0.2)
	visible= 0
	$Alarm0.start((1) / 30.0)
	stop= 0
	deactivate= 0
	if(velocity.x < -2) velocity.x= -2
	if(velocity.x > 2) velocity.x= 2
	dmg= 9

func _on_destroy():
	visible= 1

func _process_end(delta: float):
	if(stop == 0) rotation_degrees+= aa
	if(y > 580) instance_destroy()
	if(x > 640) instance_destroy()
	if(x < 0) instance_destroy()
	if(y < ystart - 70) z_index= -1112
	if(z_index < 0 and scale.x < 2) {
	    scale.x+= 0.05
	    scale.y+= 0.05
	}
	if(y > GS.idealborder[3] - 10 and stop == 0) {
	    stop= 1
	    speed= 0
	    gravity= 0
	}
	if(GS.mnfight != 2 and deactivate == 0) deactivate= 1
	if(deactivate == 1) {
	    stop= 2
	    gravity= 0.8 + random(0.3)
	    deactivate= 2
	}

func _on_alarm_0_timeout():
	if(deactivate == 0) scr_damagestandard_x()

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
