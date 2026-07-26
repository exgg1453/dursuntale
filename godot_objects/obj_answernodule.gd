# Auto-converted from GameMaker: obj_answernodule
extends Node2D

func _ready():
	$Alarm0.start((60) / 30.0)
	qno= 0
	atext= "Errror Babye"
	answered= 0
	visible= 0
	ano= 0

func _on_destroy():
	if(qno == 0) sprite_index= 350/* spr_abutton */
	if(qno == 1) sprite_index= 351/* spr_bbutton */
	if(qno == 2) sprite_index= 352/* spr_cbutton */
	if(qno == 3) sprite_index= 353/* spr_dbutton */
	visible= 1
	ano= qno
	if(obj_questionasker.correct == 5) ano= 5
	obj_heart.movement= 1

func _on_alarm_0_timeout():
	if(visible == 1 and obj_questionasker.phase == 2 and answered == 0) {
	    obj_questionasker.phase= 3
	    obj_questionasker.answer= ano
	    answered= 1
	}

func _on_outside_room():
	draw_set_font(1)
	draw_set_color(16777215)
	if(obj_questionasker.phase > 2) {
	    draw_set_color(65535)
	    if(obj_questionasker.answer == -1) visible= 0
	}
	if(answered == 1) {
	    if(obj_questionasker.correct == ano) draw_set_color(32768)
	    else  draw_set_color(255)
	}
	atext2= atext
	if(atext == "special1") {
	    if(qno == 0) atext2= string(obj_questionasker.mettamt + 11)
	    if(qno == 1) atext2= string(obj_questionasker.mettamt + 6)
	    if(qno == 2) atext2= string(obj_questionasker.mettamt + 8)
	    if(qno == 3) atext2= string(obj_questionasker.mettamt + 10)
	}
	sizefactor= 1
	txtsize= string_length(atext2)
	if(txtsize > 11) sizefactor= 11 / txtsize
	if(qno == 0 or qno == 2) {
	    draw_set_halign(2)
	    draw_text_transformed(x - 20 + random(2), y + random(2), atext2, sizefactor, 1, 1)
	}
	if(qno == 1 or qno == 3)
	    draw_text_transformed(x + 60 + random(2), y + random(2), atext2, sizefactor, 1, 1)
	if(answered == 0 and obj_questionasker.phase == 2)
	    draw_sprite(sprite_index, 0, x, y)
	draw_set_halign(0)

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
