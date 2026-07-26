# Auto-converted from GameMaker: blt_hoopbullet2
# GM parent: blt_parent
extends Node2D

func _ready():
	dmg= 0
	r= round(random(1))
	b= round(random(1))
	if(r == 0) velocity.x= 1
	else  velocity.x= -1
	if(b == 1) velocity.y= 1
	else  velocity.y= -1
	x+= 5
	friction= -0.042
	intangible= 1
	modulate.a= 0
	if(instance_number(620) > 5) instance_destroy()

func _process_end(delta: float):
	if(GS.turntimer < 1) instance_destroy()
	if(modulate.a < 0.9) modulate.a+= 0.1
	else  {
	    modulate.a= 1
	    intangible= 0
	}

func _on_alarm_0_timeout():
	y-= 6
	velocity.y= -velocity.y

func _gm_event_7_0():
	queue_free()

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
