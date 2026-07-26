# Auto-converted from GameMaker: obj_vaporacquirer
extends Node2D

func _ready():
	sprite_index= GS.monstersprite
	line= 0
	finished= 0
	ht= sprite_get_height(sprite_index)
	wd= sprite_get_width(sprite_index)
	myvapor= GS.vaporspeed
	fileplace= "data/monster/" + sprite_get_name(sprite_index)
	file= file_text_open_write(fileplace)
	if(instance_exists(189/* obj_dmgwriter */)) {
	    // obj_dmgwriter
	    with(189) instance_destroy()
	}
	$Alarm0.start(2 / 30.0)

func _on_destroy():
	i= 0
	while(i < wd / 2) {
	    if(draw_getpixel(x + i * 2, y + line * 2) == 16777215)
	        file_text_write_string(file, "1")
	    else  file_text_write_string(file, "0")
	    i++
	}
	if(myvapor == 0) line++
	line++
	if(line > ht / 2) {
	    file_text_write_string(file, "2")
	    file_text_close(file)
	    instance_destroy()
	    exit
	} else  {
	    $Alarm0.start((1 + myvapor) / 30.0)
	    exit
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
