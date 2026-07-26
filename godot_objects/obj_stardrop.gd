# Auto-converted from GameMaker: obj_stardrop
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	scale.y= 2
	scale.x= 2
	velocity.y= 2 + random(3)
	gravity_direction= 270
	gravity= 0.06
	if(y > 200) {
	    scale.y= -2
	    gravity= -gravity
	    velocity.y= -velocity.y
	}
	siner= 0
	shake= 0

func _on_destroy():
	velocity.x= random(4) - 2

func _process(delta: float):
	if(y > get_viewport_rect().size.y or y < 0) instance_destroy()
	if(shake == 1) {
	    x+= sin(siner / 2) * 2
	    rotation_degrees+= sin(siner / 2) * 2
	    siner++
	}
	if(GS.mnfight != 2) instance_destroy()

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
