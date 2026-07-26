# Auto-converted from GameMaker: obj_fogmaker_complex
extends Node2D

func _ready():
	fog_alpha= 0
	fog_x= 0
	fog_r= 0
	dr= 0

func _on_outside_room():
	dr++
	if(dr > 3) {
	    fog_r++
	    dr= 0
	}
	fog_alpha= obj_mainchara.x / get_viewport_rect().size.x
	i= 0
	j= 0
	repeat(3)  {
	    repeat(32)  {
	        tfr= fog_r + i + j * 2
	        if(tfr >= 40) tfr-= 40
	        draw_sprite_part_ext(1933, 0, tfr, 0, 20, 80, i * 20, j * 80, 1, 1, 16777215, fog_alpha)
	        i++
	    }
	    j++
	    i= 0
	}
	if(fog_r >= 40) fog_r-= 40

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
