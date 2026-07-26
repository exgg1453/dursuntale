# Auto-converted from GameMaker: obj_floweyx_flame
# GM parent: obj_floweybullet_parent
extends Node2D

func _ready():
	rotation_degrees= direction
	image_speed= 1
	size= 1
	rp= 0
	snd_stop(135)
	snd_play(135/* snd_flameloop */)

func _process(delta: float):
	rotation_degrees= direction
	friction= 0.3
	if(velocity.x > 0) velocity.x-= 0.1
	if(velocity.x < 0) velocity.x+= 0.1
	if(obj_vsflowey_heart.x + 8 > x) velocity.x+= 0.1
	if(obj_vsflowey_heart.y + 8 > y) velocity.y+= 0.1
	if(obj_vsflowey_heart.y + 8 < y) velocity.y-= 0.12
	if(obj_vsflowey_heart.x + 8 < x) velocity.x-= 0.1
	if(y > 380) velocity.x*= 1.12
	scale.x= size
	scale.y= size
	if(frame > 9 and rp < 2) {
	    frame= 5
	    rp++
	}
	if(frame > 18) {
	    if(modulate.a > 0.8) modulate.a= 0.8
	    image_blend= merge_color(image_blend, 16776960, 0.1)
	    modulate.a-= 0.05
	    if(modulate.a <= 0.1) instance_destroy()
	}
	if(frame >= 40) instance_destroy()

func _on_alarm_0_timeout():
	if(frame >= 3 and frame <= 18) event_inherited()

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
