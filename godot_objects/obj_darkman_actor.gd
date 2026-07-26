# Auto-converted from GameMaker: obj_darkman_actor
extends Node2D

func _ready():
	sprite_index= 1843/* spr_darkman_d */
	dsprite= 1843
	lsprite= 1841
	rsprite= 1842
	usprite= 1843
	image_speed= 0
	mov= 0

func _process(delta: float):
	if(speed == 0) frame= 0
	if(speed > 0) image_speed= 0.25
	if(velocity.x > 0) sprite_index= 1842/* spr_darkman_r */
	if(velocity.x < 0) sprite_index= 1841/* spr_darkman_l */
	if(velocity.y != 0) sprite_index= 1843/* spr_darkman_d */
	if(mov == 1) {
	    velocity.y= -2
	    mov= 2
	}
	if(mov == 2 and y < view_yview[0] - 50) instance_destroy()

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
