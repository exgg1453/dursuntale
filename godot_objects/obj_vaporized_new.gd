# Auto-converted from GameMaker: obj_vaporized_new
extends Node2D

func _ready():
	ht= 208
	wd= 200
	myvapor= 0
	myread= 0
	finishedreading= 0
	line= 0
	scr_newvapordata(0)
	if(myvapor == 0) snd_play(91/* snd_vaporized */)
	fun= 8
	spec= 0

func _on_outside_room():
	dn= 1
	ht_a= sprite_height - line * 2
	ht_b= y + line * 2
	ht_c= line * 2
	if(dn == 1)
	    draw_sprite_part_ext(sprite_index, frame, 0, ht_c, wd, ht_a, x, ht_b, scale.x, scale.y, 16777215, 1)
	if(finishedreading == 0) {
	    repeat(4)  {
	        ww= 0
	        mychar= string("0")
	        while(mychar != "}" and mychar != "~") {
	            mychar= string_char_at(mydata, myread + 1)
	            draw_set_color(0)
	            if(ord(mychar) >= 84 and ord(mychar) <= 121) {
	                i= 0
	                while(i < ord(mychar) - 85) {
	                    ww+= 2
	                    i++
	                }
	            }
	            draw_set_color(16777215)
	            if(ord(mychar) >= 39 and ord(mychar) <= 82) {
	                if(wd > 120 and spec == 0) {
	                    blk= instance_create(x + ww, y + line * 2, 191/* obj_whtpxlgrav */)
	                    blk.scale.x= ord(mychar) - 40
	                    with(blk) event_user(0)
	                    ww+= (ord(mychar) - 40) * 2
	                } else  {
	                    i= 0
	                    while(i < ord(mychar) - 40) {
	                        instance_create(x + ww, y + line * 2 + 2, 191/* obj_whtpxlgrav */)
	                        ww+= 2
	                        i++
	                    }
	                }
	            }
	            myread++
	        }
	        ww= 0
	        line++
	        if(mychar == "~") {
	            finishedreading= 1
	            instance_destroy()
	            exit
	        } else  $Alarm0.start((1 + myvapor) / 30.0)
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
