# Auto-converted from GameMaker: obj_rollgrow
extends Node2D

func _ready():
	size= 1
	angle= 0
	friction= 0.1
	bonk= 0

func _process(delta: float):
	z_index= 50000 - y * 10 + sprite_height * 4
	xchange= abs(velocity.x)
	ychange= abs(velocity.y)
	tchange= xchange + ychange
	if(size < 10)
	    size+= tchange / (size * 10 + 20)
	angle+= tchange * 30 / size * 10
	scale.x= size
	scale.y= size

func _on_alarm_0_timeout():
	if(bonk == 1) {
	    velocity.x= 0
	    velocity.y= 0
	    bonk= 0
	} else  {
	    if(obj_time.left == 1) velocity.x-= 0.6 / size + 0.05
	    if(obj_time.up == 1) velocity.y-= 0.6 / size + 0.05
	    if(obj_time.right == 1)
	        velocity.x+= 0.6 / size + 0.05
	    if(obj_time.down == 1) velocity.y+= 0.6 / size + 0.05
	}
	other.x= other.xprevious
	other.y= other.yprevious

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, size, size, angle, 16777215, 1)

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
