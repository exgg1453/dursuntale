# Auto-converted from GameMaker: obj_6book_wordbullet
# GM parent: obj_6bparent
extends Node2D

func _ready():
	col= 0
	counter= 0
	type= 0
	shake= 0
	word= "DEATH"
	word2= "LIFE"
	chooser= floor(random(15))
	if(chooser == 1) {
	    word= "DESPAIR"
	    word2= "HOPE"
	}
	if(chooser == 2) {
	    word= "NIGHTMARE"
	    word2= "DREAMS"
	}
	if(chooser == 3) {
	    word= "SADNESS"
	    word2= "HAPPINESS"
	}
	if(chooser == 4) {
	    word= "RUIN"
	    word2= "SUCCESS"
	}
	if(chooser == 5) {
	    word= "HATRED"
	    word2= "LOVE"
	}
	if(chooser == 6) {
	    word= "TRAPPED"
	    word2= "FREEDOM"
	}
	if(chooser == 7) {
	    word= "SLAUGHTER"
	    word2= "MERCY"
	}
	if(chooser == 8) {
	    word= "DOOM"
	    word2= "LUCK"
	}
	if(chooser == 9) {
	    word= "TERROR"
	    word2= "CALM"
	}
	if(chooser == 10) {
	    word= "HORROR"
	    word2= "RELIEF"
	}
	if(chooser == 11) {
	    word= "CRUELTY"
	    word2= "KINDNESS"
	}
	if(chooser == 12) {
	    word= "MURDERER"
	    word2= "DREAMER"
	}
	if(chooser == 13) {
	    word= "DESTROY"
	    word2= "CREATE"
	}
	if(chooser == 14) {
	    word= "CORRUPT"
	    word2= "PROTECT"
	}
	if(x < 320) velocity.x= 3.5
	else  velocity.x= -3.5
	if(obj_6book_master.con == 3) event_user(4)

func _on_destroy():
	speed= remspeed
	col= 0

func _on_alarm_0_timeout():
	if(type == 0) event_inherited()
	if(type == 5) {
	    snd_stop(155)
	    snd_play(155/* snd_heal_c */)
	    held= 0
	    if(held == 0 and GS.my_hp <= 10) {
	        GS.my_hp+= 10
	        held= 1
	    }
	    if(held == 0 and GS.my_hp <= 20) {
	        GS.my_hp+= 6
	        held= 1
	    }
	    if(held == 0 and GS.my_hp <= 30) {
	        GS.my_hp+= 4
	        held= 1
	    }
	    if(held == 0 and GS.my_hp <= 40) {
	        GS.my_hp+= 2
	        held= 1
	    }
	    if(held == 0 and GS.my_hp <= 50) {
	        GS.my_hp++
	        held= 1
	    }
	    instance_destroy()
	}

func _gm_event_7_15():
	type= 2

func _gm_event_7_14():
	image_blend= 65280
	type= 5
	word= word2

func _gm_event_7_11():
	if(counter < 10) instance_destroy()

func _on_outside_room():
	counter++
	draw_set_font(10)
	width= string_width(word)
	factor= 100 / width
	draw_set_color(image_blend)
	draw_text_transformed(x, y, word, factor, 4.2, 0)
	if(velocity.x > 0 and x > 405) instance_destroy()
	if(velocity.x < 0 and x < 120) instance_destroy()
	if(type == 2) {
	    shake+= 0.2
	    x+= random(shake) - random(shake)
	    y+= random(shake) - random(shake)
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
