# Auto-converted from GameMaker: obj_phonetojetpack
extends Node2D

func _ready():
	velocity.y= -1
	ptimer= 0
	clip= 1570
	align= 0

func _process(delta: float):
	ptimer++
	if(ptimer == 40) {
	    GS.facing= 2
	    velocity.y= 0
	}
	if(ptimer == 70) {
	    snd_play(13/* snd_spearappear */)
	    sprite_index= 1819/* spr_yellowphone_jetpacktransform */
	    frame= 0
	    image_speed= 0.334
	}
	if(ptimer > 70 and sprite_index == 1819 and frame > 4) {
	    frame= 4
	    image_speed= 0
	}
	if(ptimer == 110) {
	    snd_play(13/* snd_spearappear */)
	    velocity.y= 5
	}
	if(ptimer > 110 and y > ystart - 5 and align == 0) {
	    align= 1
	    instance_create(0, 0, 118/* obj_flasher */)
	    snd_play(21/* snd_impact */)
	    velocity.y= 0
	    y= ystart
	}
	if(ptimer > 110 and velocity.y > 0) {
	    g= scr_afterimage(6, 0)
	    g.modulate.a= 0.5
	}
	if(ptimer == 160) {
	    snd_play(106/* snd_noise */)
	    sprite_index= 1820/* spr_yellowjetpack */
	    image_speed= 0.5
	}
	if(ptimer > 160) {
	    x= clip.x
	    y= clip.y + 10
	}

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
