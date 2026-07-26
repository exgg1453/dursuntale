# Auto-converted from GameMaker: blt_soapbul
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	angle= 0
	angleadd= 0
	dmg= 0
	image_speed= 0
	direction= random(180)
	if(direction < 10) direction+= 20
	if(abs(direction - 90) < 10) direction+= 30
	if(abs(direction - 180) < 10) direction-= 20
	speed= 4
	if(abs(velocity.x) < 0.2) velocity.x*= 3
	if(abs(velocity.y) < 0.2) velocity.y*= 3
	friction= -0.04
	blue= 0
	$Alarm0.start((4) / 30.0)
	offset= 0

func _gm_event_2_7():
	instance_destroy()

func _on_destroy():
	my= instance_create(x + 12, y + 16, 667/* blt_shinebullet */)
	my.dmg= dmg - 2
	$Alarm0.start((7) / 30.0)
	if(offset == 1) {
	    speed= 5
	    $Alarm0.start((10) / 30.0)
	}

func _process(delta: float):
	if(GS.turntimer <= 2) {
	    if(GS.mnfight == 2) GS.mnfight= 3
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	y-= velocity.y
	velocity.y= -velocity.y

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
