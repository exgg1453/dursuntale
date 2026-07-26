# Auto-converted from GameMaker: obj_mettatonnn_writer
extends Node2D

func _on_outside_room():
	maxed= obj_questionasker.mettamt
	maxeda= maxed
	if(maxeda > 13) maxeda= 13
	maxedb= maxed - 13
	if(maxedb > 20) maxedb= 20
	maxedc= maxed - 32
	draw_set_font(1)
	i= 0
	while(i < maxeda) {
	    draw_set_color(16777215)
	    draw_text(431 + random(1) + i * 14, 82 + random(1), "n")
	    i++
	}
	if(maxedb > 0) {
	    i= 0
	    while(i < maxedb) {
	        draw_set_color(16777215)
	        draw_text_transformed(get_viewport_rect().size.x - 6 + random(1), 116 + i * 16, "n", 1, 1, 270)
	        i++
	    }
	}
	if(maxedc > 0) {
	    i= 0
	    while(i < maxedc) {
	        draw_set_color(16777215)
	        draw_text_transformed(get_viewport_rect().size.x - 40 + random(1) - i * 16, get_viewport_rect().size.y - 20, "n", 1, 1, 180)
	        i++
	    }
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
