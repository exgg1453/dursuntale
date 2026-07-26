# Auto-converted from GameMaker: obj_vaporized
extends Node2D

func _ready():
	sprite_index= GS.monstersprite
	line= 0
	finished= 0
	ht= sprite_get_height(sprite_index)
	wd= sprite_get_width(sprite_index)
	myvapor= GS.vaporspeed
	if(myvapor == 0) snd_play(91/* snd_vaporized */)
	finishedreading= 0
	mydata= scr_getvapordata()
	mychar= 0
	myread= 0
	$Alarm0.start(1 / 30.0)

func _on_destroy():
	if(finishedreading == 0) {
	    i= 0
	    while(i < wd / 2) {
	        mychar= string_char_at(mydata, myread)
	        if(mychar == "1")
	            instance_create(x + i * 2 - 2, y + line * 4, 193/* obj_blkpxltall */)
	        myread++
	        i++
	    }
	    if(myvapor == 0) {
	        line++
	        i= 0
	        while(i < wd / 2) {
	            mychar= string_char_at(mydata, myread)
	            if(mychar == "1")
	                instance_create(x + i * 2 - 2, y + line * 4, 193/* obj_blkpxltall */)
	            myread++
	            i++
	        }
	    }
	    line++
	    if(line > ht / 2 - 4) finishedreading= 1
	    else  {
	        $Alarm0.start((1 + myvapor) / 30.0)
	        if(myvapor > 1) snd_play(92/* snd_chug */)
	    }
	}

func _process(delta: float):
	if(finishedreading == 1) instance_destroy()
	if(line > 10 and not instance_exists(193/* obj_blkpxltall */))
	    instance_destroy()

func _on_outside_room():
	draw_sprite_part(sprite_index, frame, 0, line * 4, sprite_width, sprite_height - line * 4, x, y + line * 4)

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
